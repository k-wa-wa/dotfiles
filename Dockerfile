ARG BASE_IMAGE=ubuntu:24.04
FROM ${BASE_IMAGE}

RUN apt update && apt -y upgrade
RUN apt install -y git curl sudo

RUN useradd -m testuser \
  && usermod -aG sudo testuser \
  && echo "testuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/testuser

# setup.shを流す
USER testuser

COPY . /home/testuser/.dotfiles/
RUN sudo chown -R $(whoami):$(id -gn) ~/.dotfiles/.config
RUN cd ~/.dotfiles && /bin/sh scripts/setup.sh

WORKDIR /home/testuser
CMD [ "zsh" ]
