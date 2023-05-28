#!/bin/bash

set -eux

dotfiles_dir=$(cd "$(dirname "$0")" && cd .. || exit 0; pwd)

if builtin command -v brew &> /dev/null; then
  echo "[info] run brew update"
  brew update --verbose
  echo "[info] run brew upgrade"
  brew upgrade --verbose
  echo "[info] run brew bundle"
  brew bundle --file "$dotfiles_dir"/brew/Brewfile --verbose
  echo "[info] run brew upgrade"
  brew cleanup --verbose
  if [ -d /usr/local/include/node ]; then sudo rm -R /usr/local/include/node; fi
  echo "[info] run brew doctor"
  brew doctor
else
  echo "[error] Brew not found!" 1>&2
  exit 1
fi
