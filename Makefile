.PHONY: all bin folders etc osx
.DEFAULT_GOAL := help

DOTPATH  := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES := $(wildcard etc/??*)
BINFILES := $(wildcard bin/??*)
CONFIG_DIR="$(HOME)/.config"

help:
	@echo ".dotfiles Tasks:"
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@$(MAKE) osx-help

all: etc bin folders ## Run everything (except osx tasks)

etc: $(foreach F, $(DOTFILES), _install-dot/$F) ## Symlink dotfiles
	touch $(HOME)/.gitconfig_local
	touch $(HOME)/.vimrc_local

bin: ## symlink bin files to $HOME/.bin
	/bin/ln -sfn $(DOTPATH)/bin $(HOME)/.bin

folders: ## symlink all those folders
	if [ ! -d "$(CONFIG_DIR)" ]; then \
		/bin/mkdir "$(CONFIG_DIR)"; \
	fi
	/bin/ln -sfn $(DOTPATH)/git $(HOME)/.git
	/bin/ln -sfn $(DOTPATH)/fish $(HOME)/.config/fish
	/bin/ln -sfn $(DOTPATH)/zsh $(HOME)/.zsh
	/bin/ln -sfn $(DOTPATH)/zsh/zshrc $(HOME)/.zshrc
	/bin/ln -sfn $(DOTPATH)/vim $(HOME)/.vim
	/bin/ln -sfn $(DOTPATH)/vim/vimrc $(HOME)/.vimrc
	/bin/ln -sfn $(DOTPATH)/vim $(HOME)/.config/nvim
	/bin/ln -sfn $(DOTPATH)/kitty $(HOME)/.config/kitty
	/bin/ln -sfn $(DOTPATH)/tmuxinator $(HOME)/.config/tmuxinator
	if [ -d "$(HOME)/Library" ]; then \
		/bin/ln -sfn $(DOTPATH)/VisualStudioCode/settings.json "$(HOME)/Library/Application Support/Code/User/settings.json"; \
		/bin/ln -sfFn $(DOTPATH)/SublimeText/User "$(HOME)/Library/Application Support/Sublime Text/Packages"; \
	fi

osx: ## run osx all task, see below
	$(MAKE) -C ./osx all

osx-%:
	@$(MAKE) -C ./osx $*

# Meta install and uninstall targets
_install-dot/%:
	/bin/ln -sf $(DOTPATH)/$* $(HOME)/.$(notdir $*)
