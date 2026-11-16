# intent: make the devcontainer usable for writing posts

- Status: accepted
- Originator: dave6892
- Source: idea

## What we want

Open the repo in the existing `.devcontainer/` (Jekyll on Debian bullseye) and have the live-reload server and the html-proofer check work with no manual steps. The container is the supported way to write posts, so the host's Ruby setup doesn't matter.

## Why now

Local `bundle install` failed on macOS system Ruby 2.6. We fixed it with rbenv on the host, but the repo already ships a devcontainer that was never exercised. It has known gaps:

- `post-create.sh` never runs `bundle install`, so the first `tools/run.sh` fails on missing gems.
- `devcontainer.json` has no `forwardPorts`, and `tools/run.sh` binds `127.0.0.1` by default, so the server isn't reachable from the host browser.
- The base image's Ruby version isn't pinned to anything we've checked against `html-proofer` 5.1 (needs Ruby >= 3.1, < 4.0) or CI's 3.3.

## Constraints

- Keep the Chirpy-starter devcontainer structure. Fix gaps, don't rewrite it.
- Ruby in the container must satisfy `html-proofer` (>= 3.1, < 4.0), and should match CI (3.3) if the base image allows.
- Docker is already installed on the host (28.0.4); no new host dependencies.
- No changes to the CI workflow, `_config.yml` or post content.

## Out of scope

- The `new-post` skill (separate unit).
- The `.nojekyll` / timezone cleanup.
- Replacing the host rbenv setup.
- Codespaces-specific tuning.

## How we will know it worked

From a clean build (`Dev Containers: Rebuild Without Cache`), with no manual commands beyond the VS Code task:

1. `ruby -v` in the container reports >= 3.1 and < 4.0.
2. `bundle exec jekyll -v` works, so gems were installed by `post-create.sh`.
3. The "Run Jekyll Server" task serves the site, and `http://localhost:4000` on the host renders `hello-world`.
4. `bash tools/test.sh` passes inside the container.

## Open questions

- [x] Which editor/client? Accepted: VS Code Dev Containers, since `.vscode/` and the extension list already target it. The CLI (`devcontainer up`) would also work.
- [x] Ruby version: accepted: keep `jekyll:2-bullseye` if it already ships Ruby >= 3.1, otherwise pin a newer tag or add the Ruby feature at 3.3. Proposed: check what the current image ships before deciding.
- [x] Port binding: accepted: `forwardPorts: [4000]` plus having the server bind `0.0.0.0` inside the container (via `-H 0.0.0.0` in the VS Code task), leaving `tools/run.sh` defaults alone.
- [x] Should `post-create.sh` keep cloning Oh My Zsh plugins from GitHub on every build? Proposed: leave as is, since it's the Chirpy default and low risk.
