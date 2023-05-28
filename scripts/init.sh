#!/bin/bash

set -eux

dotfiles_dir=$(cd "$(dirname "$0")" && cd .. || exit 0; pwd)

#
# Mac
#

if [ "$(uname)" == 'Darwin' ]; then
  echo "[info] MacOS"
  # Install Command line tools
  if ! xcode-select --print-path &> /dev/null; then
    echo "[info] Command line tools not found. Installing..."
    xcode-select --install > /dev/null
    echo "[info] Installed"
  else
    echo "[info] Command line tools already installed"
  fi
  # brew
  "$dotfiles_dir"/brew/install.sh
  eval "$(/opt/homebrew/bin/brew shellenv)"
  "$dotfiles_dir"/brew/setup.sh
  # defaults
  "$dotfiles_dir"/scripts/mac/defaults.sh
  # rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#
# Linux
#

elif [ "$(uname)" == 'Linux' ]; then
  echo "[info] Linux"
  # apt
  echo "[info] Update apt..."
  sudo apt -y update
  sudo apt install zsh build-essential procps
  sudo apt -yV upgrade
  sudo apt -yV dist-upgrade
  sudo apt -yV autoremove
  sudo apt autoclean
  # zsh
  sudo chsh "$USER" -s "$(builtin command -v zsh)"
  # brew
  "$dotfiles_dir"/brew/install.sh
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  "$dotfiles_dir"/brew/setup.sh
  # rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  # WSL 用の調整
  if [[ "$(uname -r)" == *microsoft* ]]; then
    echo "[info] WSL"
  fi

#
# Windows
#

else
  echo "[error] Windows not supported!" 1>&2
  exit 1
fi
