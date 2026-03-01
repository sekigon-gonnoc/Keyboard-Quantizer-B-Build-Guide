#!/usr/bin/env bash
set -euo pipefail

# build-local.sh
# Usage:
#   ./build-local.sh        # build only
#   ./build-local.sh serve  # build then run `bundle exec jekyll serve`

cmd="build"
if [ "${1-}" = "serve" ]; then
  cmd="serve"
fi

echo "Installing Ruby gems (bundle install)..."
bundle install

echo "Installing Node dependencies (yarn install --dev)..."
yarn install --dev

echo "Running yarn build..."
yarn build

if [ "$cmd" = "serve" ]; then
  echo "Starting Jekyll server..."
  bundle exec jekyll serve
fi

echo "Done."
