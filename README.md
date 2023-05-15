# Image Runner

## Introduction

Image-Runner is a collection of scripts to run latest linux container with default shell for development/testing purposes.

Features:

- `run-linux`
  - run latest container with shell.
  - mount a working directory as a directory in container.
  - container clean up when exit.
- `run-image`
  - run container based on configuration.
  - mount a working directory as a directory in container.
  - container clean up when exit.
  - support using symbolic link to `run-image` for the configured program.
  - mount additional volumes.

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

run-image imageName [workingDirectory]
<imageName> [workingDirectory]

```

👉Visit [Screenshots](screenshots/Screenshots.md) of each commands.

## Quick Start

### Installation

- Pre-requisite
  - yq <https://github.com/mikefarah/yq>
  - docker <https://docs.docker.com/engine/install/>

```bash
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.list | sudo tee /etc/apt/sources.list.d/siakhooi-apt.list > /dev/null
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  | sudo tee /usr/share/keyrings/siakhooi-apt.gpg > /dev/null
$ sudo apt update
$ sudo apt install siakhooi-image-runner
```

## Deployments

- <https://siakhooi.github.io/apt/>
- <https://siakhooi.jfrog.io/ui/packages>

## Badges

![GitHub](https://img.shields.io/github/license/siakhooi/image-runner?logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/siakhooi/image-runner?logo=github)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/siakhooi/image-runner?logo=github)
![GitHub issues](https://img.shields.io/github/issues/siakhooi/image-runner?logo=github)
![GitHub closed issues](https://img.shields.io/github/issues-closed/siakhooi/image-runner?logo=github)
![GitHub pull requests](https://img.shields.io/github/issues-pr-raw/siakhooi/image-runner?logo=github)
![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed-raw/siakhooi/image-runner?logo=github)
![GitHub top language](https://img.shields.io/github/languages/top/siakhooi/image-runner?logo=github)
![GitHub language count](https://img.shields.io/github/languages/count/siakhooi/image-runner?logo=github)
![Lines of code](https://img.shields.io/tokei/lines/github/siakhooi/image-runner?logo=github)
![GitHub repo size](https://img.shields.io/github/repo-size/siakhooi/image-runner?logo=github)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/siakhooi/image-runner?logo=github)
![Workflow](https://img.shields.io/badge/Workflow-github-purple)
![workflow](https://github.com/siakhooi/image-runner/actions/workflows/workflow-build-with-quality-checks.yml/badge.svg)
![workflow](https://github.com/siakhooi/image-runner/actions/workflows/workflow-deployments.yml/badge.svg)
![Release](https://img.shields.io/badge/Release-github-purple)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/siakhooi/image-runner?label=GPR%20release&logo=github)
![GitHub all releases](https://img.shields.io/github/downloads/siakhooi/image-runner/total?color=33cb56&logo=github)
![GitHub Release Date](https://img.shields.io/github/release-date/siakhooi/image-runner?logo=github)

[![Generic badge](https://img.shields.io/badge/Funding-BuyMeACoffee-33cb56.svg)](https://www.buymeacoffee.com/siakhooi)
[![Generic badge](https://img.shields.io/badge/Funding-Ko%20Fi-33cb56.svg)](https://ko-fi.com/siakhooi)
![visitors](https://visitor-badge.glitch.me/badge?page_id=siakhooi.image-runner&left_color=grey&right_color=#33cb56)
