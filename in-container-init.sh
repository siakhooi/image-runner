#!/bin/bash

apt update -y

apt install -y man-db curl wget
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

yes | unminimize

curl -L https://siakhooi.github.io/apt/siakhooi-apt.list > /etc/apt/sources.list.d/siakhooi-apt.list
curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  > /usr/share/keyrings/siakhooi-apt.gpg
apt update -y

apt install -y $(ls ./siakhooi-image-runner_*_amd64.deb)
