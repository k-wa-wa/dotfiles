#!/bin/sh

set -e

if command -v apt &> /dev/null; then
  sudo apt update
  sudo apt install -y software-properties-common
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update

  sudo apt install -y \
      zsh build-essential \
      neovim fzf \
      fastfetch
else
  echo "Not implemented. Please install deps yourself."
fi

# rust/cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH=$HOME/.cargo/bin:$PATH

cargo install lsd

# zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# starship
curl -sS https://starship.rs/install.sh | sudo sh -s -- --yes
