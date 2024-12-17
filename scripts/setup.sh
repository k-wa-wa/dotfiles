#!/bin/sh

apt install -y \
    curl zsh lsd

# zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# fastfetch TODO

# link
ln -sf ~/.dotfiles/.zshrc ~
ln -sf ~/.dotfiles/.config ~
