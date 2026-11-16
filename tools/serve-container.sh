#!/usr/bin/env bash
#
# Install gems and serve the site on all interfaces, for use inside a dev container.
# Container clients that publish ports through Docker (e.g. Zed) can only reach a
# server bound to 0.0.0.0, and may not run the devcontainer lifecycle commands.
#
# Usage: bash tools/serve-container.sh [options for tools/run.sh]

set -eu

bundle install

exec bash "$(dirname "${BASH_SOURCE[0]}")/run.sh" -H 0.0.0.0 "$@"
