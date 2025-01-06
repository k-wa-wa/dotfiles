#!/bin/sh

set -e

sudo apt install -y \
    zsh cargo build-essential \
    neovim fzf
cargo install lsd

# zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# starship
curl -sS https://starship.rs/install.sh | sudo sh -s -- --yes

# fastfetch TODO

# TODO ちゃんと書く
USER=$(whoami)
GROUP=$(id -gn)
sudo chown -R $USER:$GROUP ~/.dotfiles/.config

# link
ln -sf ~/.dotfiles/.zshrc ~
ln -sf ~/.dotfiles/.config ~
