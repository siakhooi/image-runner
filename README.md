# Image Runner

Collection of bash scripts to run container images for dev/testing purposes.

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
run-linux
```

## Quick Start

### Installation

```bash
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.list | sudo tee /etc/apt/sources.list.d/siakhooi-apt.list > /dev/null
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  | sudo tee /usr/share/keyrings/siakhooi-apt.gpg > /dev/null
$ sudo apt update
$ sudo apt install siakhooi-image-runner
```
