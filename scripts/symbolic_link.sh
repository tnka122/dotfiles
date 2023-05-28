#!/bin/bash

set -eux

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
cd "$SCRIPT_DIR" && cd .. || exit

# zsh
ln -sf "$PWD"/.zshenv "$HOME"/.zshenv
if [ ! -d "$HOME"/.zsh ]; then mkdir "$HOME"/.zsh; fi
ln -sf "$PWD"/zsh/.zshenv "$HOME"/.zsh/.zshenv
ln -sf "$PWD"/zsh/.zshrc "$HOME"/.zsh/.zshrc
ln -sf "$PWD"/zsh/.zprofile "$HOME"/.zsh/.zprofile
# sheldon
if [ ! -d "$HOME"/.config/sheldon ]; then mkdir -p "$HOME"/.config/sheldon; fi
ln -sf "$PWD"/sheldon/plugins.toml "$HOME"/.config/sheldon/plugins.toml
# starship
if [ ! -d "$HOME"/.config ]; then mkdir "$HOME"/.config; fi
ln -sf "$PWD"/starship/starship.toml "$HOME"/.config/starship.toml
# nvim
if [ ! -d "$HOME"/.config/nvim ]; then mkdir -p "$HOME"/.config/nvim; fi
ln -sf "$PWD"/nvim/init.vim "$HOME"/.config/nvim/init.vim
