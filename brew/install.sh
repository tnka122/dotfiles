#!/bin/bash

set -eux

# mac
if [ "$(uname)" == 'Darwin' ]; then
brew_path=$(cat << "EOS"

eval "$(/opt/homebrew/bin/brew shellenv)"
EOS
)
# linux
elif [ "$(uname)" == 'Linux' ]; then
brew_path=$(cat << "EOS"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOS
)
else
  echo "[error] Windows not supported!" 1>&2
  exit 1
fi

if ! builtin command -v brew &> /dev/null; then
  echo "[info] Brew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "$brew_path" >> "$HOME"/.zprofile
  echo "[info] Installed"
else
  echo "[info] Brew already installed"
fi
