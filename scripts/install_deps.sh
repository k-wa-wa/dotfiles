#!/bin/sh

set -e

if command -v apt &> /dev/null; then
  sudo apt update

  sudo apt install -y \
      zsh build-essential tar \
      neovim fzf

  # fastfetch TODO: アーキテクチャ等の分岐
  wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.33.0/fastfetch-linux-amd64.tar.gz
  tar -xzvf fastfetch-linux-amd64.tar.gz
  sudo cp -f fastfetch-linux-amd64/usr/bin/fastfetch /usr/local/bin/
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
