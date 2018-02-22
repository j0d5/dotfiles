#!/bin/sh

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo sh -c "if ! grep /usr/local/bin/zsh /etc/shells; then echo /usr/local/bin/zsh >> /etc/shells; fi"
sudo sh -c "if ! grep /usr/local/bin/fish /etc/shells; then echo /usr/local/bin/fish >> /etc/shells; fi"
sh -c "if command -v fish; then chsh -s /usr/local/bin/fish; fi"

