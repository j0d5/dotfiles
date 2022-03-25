.PHONY: all etc defaults homebrew
.DEFAULT_GOAL := help

DOTPATH  := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES := $(wildcard etc/.??* etc/*)
BINFILES := $(wildcard bin/??*)
LIBFILES := $(wildcard Library/**/**)

help:
	@echo ".dotfiles/osx Tasks:"
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: etc defaults shell ## all osx tasks (probably only on a new setup)

etc: $(foreach F, $(DOTFILES), _install-dot/$F) ## Symlink files into home
_install-dot/%:
	#/bin/ln -sf $(DOTPATH)/$* $(HOME)/.$(notdir $*)

defaults: ## set some sane osx default preferences
	$(DOTPATH)/osx-defaults

homebrew: ## install homebrew and all homebrew packages (see Brewfile)
ifeq "$(wildcard /usr/local/bin/brew )" ""
	curl -fsSo $(TMPDIR)/brew-install.rb https://raw.githubusercontent.com/Homebrew/install/master/install
	/usr/bin/ruby $(TMPDIR)/brew-install.rb
endif
	brew bundle --verbose

shell: ## adds homebrew bash and zsh to /etc/shells and sets bash as new shell
	sudo sh -c "if ! grep /usr/local/bin/zsh /etc/shells; then echo /usr/local/bin/zsh >> /etc/shells; fi"
	sudo sh -c "if ! grep /usr/local/bin/fish /etc/shells; then echo /usr/local/bin/fish >> /etc/shells; fi"
	chsh -s /usr/local/bin/zsh
