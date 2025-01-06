#!/bin/sh

set -e

base_images=("ubuntu:20.04" "ubuntu:22.04")

# 配列の要素を直接ループ
for base_image in "${base_images[@]}"; do
  echo "base_image: $base_image"
  docker build -t dotfiles.test --build-arg BASE_IMAGE=$base_image .
  docker run --rm dotfiles.test zsh -i -c "echo done"
done
