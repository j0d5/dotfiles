# README

This is a repository for custom configuration of a Unix-based system. It
contains many single configuration files  and shell scripts, that do some
initial configuration for Macs and set the runtime configuration for terminal
sessions.

## Getting Started

### Prerequisites

__Disclaimer:__ currently only Mac OS X is supported.

* Mac OS X
* git must be installed
* `curl` or `wget` for script based cloning


### Basic Installation

To download and install this dotfile configuration run one of the following
commands or just clone the repository and run the __install.sh__ script.

#### via curl

```shell
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/johannes82/.dotfiles/master/install.sh)"
```

#### via wget

```shell
	sh -c "$(wget  https://raw.githubusercontent.com/johannes82/.dotfiles/master/install.sh -O -)"
```

### Updating

To update the repository just run the following command in the dotfiles directory:

```shell
	git pull --rebase --stat origin master
```
