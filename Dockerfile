FROM ubuntu:24.04

RUN apt update && apt -y upgrade
RUN apt install -y git curl

# 開発用
RUN apt install -y vim

WORKDIR /root/.dotfiles
COPY . .
RUN /bin/sh scripts/setup.sh

CMD [ "tail", "-f", "/dev/null" ]
