#!/bin/bash

if builtin command -v brew > /dev/null 2>&1; then
  echo "[info] run brew doctor"
  brew doctor
  echo "[info] run brew update"
  brew update --verbose
  echo "[info] run brew upgrade"
  brew upgrade --verbose
  echo "[info] run brew bundle"
  brew bundle --file "$DOTFILES_DIR"/Brewfile --verbose
  echo "[info] run brew upgrade"
  brew cleanup --verbose
else
  echo "[error] brew command is not found!" 1>&2
  exit 1
fi
