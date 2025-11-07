#!/bin/bash

set -eux -o pipefail

dotfiles_dir=$(cd "$(dirname "$0")" && cd .. || exit 0; pwd)

# zsh
if [ -f "$HOME"/.zshenv ]; then
  mv "$HOME"/.zshenv "$HOME"/.zshenv.org
  echo "[info] ~/.zshenv was overwritten. Original ~/.zshenv is copied to ~/.zshenv.org"
fi
ln -sf "$dotfiles_dir"/.zshenv "$HOME"/.zshenv
if [ ! -d "$HOME"/.zsh ]; then mkdir "$HOME"/.zsh; fi
ln -sf "$dotfiles_dir"/zsh/.zshenv "$HOME"/.zsh/.zshenv
ln -sf "$dotfiles_dir"/zsh/.zshrc "$HOME"/.zsh/.zshrc
ln -sf "$dotfiles_dir"/zsh/.zprofile "$HOME"/.zsh/.zprofile
# sheldon
if [ ! -d "$HOME"/.config/sheldon ]; then mkdir -p "$HOME"/.config/sheldon; fi
ln -sf "$dotfiles_dir"/sheldon/plugins.toml "$HOME"/.config/sheldon/plugins.toml
# starship
if [ ! -d "$HOME"/.config ]; then mkdir "$HOME"/.config; fi
ln -sf "$dotfiles_dir"/starship/starship.toml "$HOME"/.config/starship.toml
# nvim
if [ ! -d "$HOME"/.config/nvim ]; then mkdir -p "$HOME"/.config/nvim; fi
ln -sf "$dotfiles_dir"/nvim/init.lua "$HOME"/.config/nvim/init.lua
# gitignore
if [ ! -d "$HOME"/.config/git ]; then mkdir -p "$HOME"/.config/git; fi
ln -sf "$dotfiles_dir"/git/ignore "$HOME"/.config/git/ignore
