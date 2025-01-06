#/bin/sh

DOTFILES_DIR=~/.dotfiles

if [ ! -d ${DOTFILES_DIR} ]; then
  git clone https://github.com/k-wa-wa/dotfiles ${DOTFILES_DIR}
else
  cd ${DOTFILES_DIR}
  git fetch origin
  git checkout origin/master
fi

cd ${DOTFILES_DIR}
/bin/sh scripts/setup.sh
