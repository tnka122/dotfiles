#!/bin/bash

dotfiles_dir=$(cd "$(dirname "$0")" && cd .. || exit 0; pwd)

#
# Mac
#

if [ "$(uname)" == 'Darwin' ]; then
  echo "[info] MacOS"
  # Install xcode
  echo "[info] install xcode"
  xcode-select --install > /dev/null
  # brew
  echo "[info] install brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  "$dotfiles_dir"/scripts/update_brew.sh
  # defaults
  "$dotfiles_dir"/scripts/mac/defaults.sh

#
# Linux
#

elif [ "$(uname)" == 'Linux' ]; then
  echo "[info] Linux"
  # apt
  echo "[info] install apt-related"
  sudo apt -y update
  sudo apt install build-essential procps curl file git
  sudo apt -yV upgrade
  sudo apt -yV dist-upgrade
  sudo apt -yV autoremove
  sudo apt autoclean
  # brew
  echo "[info] install brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  "$dotfiles_dir"/scripts/update_brew.sh

  # WSL 用の調整
  if [[ "$(uname -r)" == *microsoft* ]]; then
    echo "[info] WSL"
  fi

#
# Windows
#

else
  echo "[error] Windows is not supported!" 1>&2
  exit 1
fi
