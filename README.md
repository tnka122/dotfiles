[![Setup CI](https://github.com/tnka122/dotfiles/actions/workflows/setup.yml/badge.svg)](https://github.com/tnka122/dotfiles/actions/workflows/setup.yml)

# dotfiles

My personal configuration files for zsh, sheldon, starship, neovim, and more.

## Install

1. Clone this repository

    ```
    git clone https://github.com/tnka122/dotfiles.git ~/dotfiles
    ```

2. Run `make all`

    ```
    cd dotfiles
    make all
    ```

    `make all` creates `~/.zsh` directory as `$ZDOTDIR` and symbolic links to the configuration files in this `.zsh`.
   
    See [`Makefile`](./Makefile) for more details.

## Note

- Since this may overwrite your `$HOME/.zshenv` file, please make a backup beforehand if it exists.

- You may need to modify them to avoid conflicts with your existing configuration files.

- These configuration files are designed to work on macOS. They may not work correctly on Linux or Windows.

- After installation, the `$ZDOTDIR` will be set to `~/.zsh`.


## Update

- If you want to add new configuration files, add them to the dotfiles directory and create a symbolic link in [`scripts/symbolic_link.sh`](./scripts/symbolic_link.sh).
