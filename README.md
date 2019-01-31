# dotfiles 🏡

This repository contains the custom configuration of a Unix-based system. It consists configuration files and shell scripts, that do some initial configuration for Macs and set the runtime configuration for terminal sessions.

## Getting Started 🛫

- Clone the repository into your home folder: `git clone https://github.com/tweetjay/dotfiles ~/.dotfiles`
- Cd into the folder: `cd ~/.dotfiles`
- Update the submodules with: `git submodule init && git submodule update`
- Run `make all`

## Description 🤓

- `bin`: Contains some helper scripts
- `etc`: Contains all configuration files for shell tools
- `fish`: Contains configuration for [fish-shell](https://github.com/fish-shell/fish-shell)
- `git`: Contains hooks and templates for git
- `hammerspoon`: Contains the configuration files for [hammerspoon](http://www.hammerspoon.org/)
- `osx`: Contains scripts which will configure the macOS environment. Please look carefully for the changes that are done with these scripts
- `shells`: Contains a script that will add the fancy shells `fish` and `zsh` to the systems shells and sets `fish` as default
- `vim`: Contains the configuration files for [vim](https://github.com/vim/vim)
- `zsh`: Contains the configuration files for [zsh](https://github.com/zsh-users/zsh)
