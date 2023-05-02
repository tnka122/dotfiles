#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    echo 'MacOS'
    # Install xcode
    xcode-select --install > /dev/null
    # brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
elif [ "$(uname)" == 'Linux' ]; then
    echo 'Linux'
    sudo apt -y update
    sudo apt-get install build-essential procps curl file git
    sudo apt -yV upgrade
    sudo apt -yV dist-upgrade
    sudo apt -yV autoremove
    sudo apt autoclean
    # brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # WSL 用の調整
    if [[ "$(uname -r)" == *microsoft* ]]; then
        echo 'WSL'
    fi
  
else
    echo 'Windows is not supported'
    exit
fi

brew doctor
brew update --verbose
brew upgrade --verbose
brew bundle --file ./Brewfile --verbose
brew cleanup --verbose
