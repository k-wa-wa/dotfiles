FROM ubuntu:24.04

RUN apt update && apt -y upgrade
RUN apt install -y git curl sudo

RUN usermod -aG sudo ubuntu \
  && echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu

# 開発用
RUN apt install -y vim

USER ubuntu
WORKDIR /home/ubuntu/.dotfiles

COPY . .
RUN /bin/sh scripts/setup.sh

WORKDIR /home/ubuntu
CMD [ "zsh" ]
