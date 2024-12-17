#/bin/sh

DOTFILES_DIR=~/.dotfiles

if [ ! -d ${DOTFILES_DIR} ]; then
    git clone https://github.com/k-wa-wa/dotfiles ${DOTFILES_DIR}
fi

cd ~/.dotfiles
/bin/sh scripts/setup.sh
