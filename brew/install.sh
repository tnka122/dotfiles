#!/bin/bash

set -eux

if ! builtin command -v brew &> /dev/null; then
  echo "[info] Brew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "[info] Installed"
else
  echo "[info] Brew already installed"
fi
