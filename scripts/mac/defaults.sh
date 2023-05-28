#!/bin/bash

set -eux

if [ "$(uname)" != "Darwin" ]; then
	exit 0
fi


#
# General
#

# mute on startup
sudo nvram StartupMute=%01


#
# Trackpad
#

# tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# two finger right click
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true


#
# Dock
#

# auto hide
defaults write com.apple.dock autohide -bool true

# min effect: scale
defaults write com.apple.dock mineffect scale

killall Dock


#
# Finder
#

defaults write com.apple.finder "ShowPathbar" -bool "true"

killall Finder


#
# VSCode
#

# for nvim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

killall VSCode
