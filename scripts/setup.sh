#!/bin/sh

set -e

/bin/sh scripts/install_deps.sh

# link
ln -sf ~/.dotfiles/.zshrc ~
ln -sf ~/.dotfiles/.config ~

# デフォルトシェルをzshにする
# chsh -s $(which zsh)
