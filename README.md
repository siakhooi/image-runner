# Image Runner

## Introduction

Image-Runner is a collection of scripts to run latest linux container with default shell for development/testing purposes.

Features:

- run latest container with shell.
- mount a working directory as a directory in container.
- container clean up when exit.

## Commands

```bash
run-ubuntu [workingDirectory]
run-debian [workingDirectory]
run-alpine [workingDirectory]
run-busybox [workingDirectory]
run-fedora [workingDirectory]
run-almalinux [workingDirectory]
run-amazonlinux [workingDirectory]
run-archlinux [workingDirectory]
run-linux
```

👉Visit [Screenshots](screenshots/Screenshots.md) of each commands.

## Quick Start

### Installation

- Pre-requisite
  - yq <https://github.com/mikefarah/yq>

```bash
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.list | sudo tee /etc/apt/sources.list.d/siakhooi-apt.list > /dev/null
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  | sudo tee /usr/share/keyrings/siakhooi-apt.gpg > /dev/null
$ sudo apt update
$ sudo apt install siakhooi-image-runner
```

## Deployments

- <https://siakhooi.github.io/apt/>
- <https://siakhooi.jfrog.io/ui/packages>
