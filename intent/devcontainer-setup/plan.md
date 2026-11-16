# plan: make the devcontainer usable for writing posts

- Intent: intent/devcontainer-setup/intent.md
- Appetite: half-day
- Branch: chore/devcontainer-setup

## Steps

1. `post-create.sh`: run `bundle install` after the existing `package.json` block, so gems are present when the container opens. Without it the first `tools/run.sh` fails on missing gems.
2. `devcontainer.json`: add `forwardPorts: [4000]` so the Jekyll server is reachable from the host browser. Leave `tools/run.sh` and `.vscode/tasks.json` unchanged (see Deviations).
3. `tools/serve-container.sh` (added mid-build, see Deviations): run `bundle install`, then `tools/run.sh -H 0.0.0.0`, for container clients that publish ports through Docker.

## Files

- `.devcontainer/post-create.sh`
- `.devcontainer/devcontainer.json`
- `tools/serve-container.sh` (new)

## Done-when

- [x] `docker run --rm mcr.microsoft.com/devcontainers/jekyll:2-bullseye ruby -v` prints `ruby 3.3.x` (checked: 3.3.9, so no image pin or Ruby feature is needed).
- [x] `bash -n .devcontainer/post-create.sh` exits 0.
- [x] `grep -n '"forwardPorts": \[4000\]' .devcontainer/devcontainer.json` matches one line.
- [x] In a fresh container from that image with the repo mounted, `bash .devcontainer/post-create.sh && bundle exec jekyll -v` exits 0 and prints a Jekyll version.
- [x] In the same container, `bash tools/test.sh` exits 0 (the repo has no other test, lint or type command; there is no CLAUDE.md).
- [ ] Manual, in VS Code: `Dev Containers: Rebuild Without Cache`, run the "Run Jekyll Server" task, and `http://localhost:4000` on the host renders the `hello-world` post. `docker run` can't exercise VS Code port forwarding, so this one is yours to run.
- [x] `bash -n tools/serve-container.sh` exits 0, and the file is executable.
- [x] `docker run -d -v "$PWD":/work -w /work -p 127.0.0.1:4010:4000 mcr.microsoft.com/devcontainers/jekyll:2-bullseye bash tools/serve-container.sh`, then `curl -fsS http://127.0.0.1:4010/posts/hello-world/` on the host exits 0 and returns the `Hello, world` page (checked).
- [ ] `git diff --name-only main...HEAD` lists only the three files above plus `intent/devcontainer-setup/`.

## Release

Pattern: all-at-once. These files affect only local and Codespaces container builds, not the deployed site or CI. Rollback is `git revert` of the two commits. Rollback trigger: the container fails to build or `tools/run.sh` is unreachable from the host. No holding metric applies.

## Deviations
- Port binding differs from the accepted intent, which proposed `-H 0.0.0.0` in the VS Code task. The plan leaves `tasks.json` and `tools/run.sh` unchanged and relies on `forwardPorts` alone. Reason: `.vscode/tasks.json` is shared with host use, so binding `0.0.0.0` there would expose the dev server to the LAN, and VS Code port forwarding is expected to reach a server bound to `127.0.0.1` inside the container. This is unverified until the manual VS Code Done-when item is run. If it fails, add a container-only task that binds `0.0.0.0` and record that here.
- Added `tools/serve-container.sh` after the first Zed run. Zed publishes ports through Docker (`0.0.0.0:4000->4000`), which only reaches a server bound to `0.0.0.0`, so the `forwardPorts`-only approach above does not work there. It also did not run `post-create.sh` (no Oh My Zsh plugins, no `unset LESS` in `~/.zshrc`), so gems were missing. The script does `bundle install` and then serves on `0.0.0.0` in one command, and works in any client. `.vscode/tasks.json` and `tools/run.sh` stay unchanged, so the host-side server still binds `127.0.0.1`. The manual VS Code item is still unrun and now matters less.
