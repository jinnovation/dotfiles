#!/bin/bash

set -euxo pipefail

if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Not running on macOS; skipping \`default\` settings"
    exit
fi
echo "Running on macOS; setting \`default\` configurations"

defaults write com.apple.dock "tilesize" -int "36"
defaults write com.apple.dock "orientation" -string "right"
defaults write com.apple.dock "autohide" -bool "true"
killall Dock
