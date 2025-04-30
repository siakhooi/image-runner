#!/bin/bash

set -e

readonly TARGETURL="https://${PUBLISH_TO_GITHUB_REPO_TOKEN}@github.com/siakhooi/apt.git"
readonly TARGETBRANCH=main
readonly TARGETPATH=docs/pool/main/binary-amd64
readonly TARGETDIR=apt
readonly TARGET_GIT_EMAIL=image-runner@siakhooi.github.io
readonly TARGET_GIT_USERNAME=image-runner

TARGET_COMMIT_MESSAGE="image-runner: Auto deploy [$(date)]"
readonly TARGET_COMMIT_MESSAGE

deb_file_path=$(ls ./*.deb)
debian_package_file_path=$(realpath "$deb_file_path")
debian_package_file=$(basename "$deb_file_path")

readonly target_debian_package_file_path="$TARGETPATH/$debian_package_file"
working_directory=$(mktemp -d)

(
  cd "$working_directory" || exit 1
  git config --global user.email "$TARGET_GIT_EMAIL"
  git config --global user.name "$TARGET_GIT_USERNAME"

  git clone -n --depth=1 -b "$TARGETBRANCH" "$TARGETURL" "$TARGETDIR"
  cd "$TARGETDIR"
  git remote set-url origin "$TARGETURL"
  git restore --staged .
  mkdir -p $TARGETPATH
  cp -v "$debian_package_file_path" "$target_debian_package_file_path"
  git add "$target_debian_package_file_path"
  git status
  git commit -m "$TARGET_COMMIT_MESSAGE"
  git push
)
find .
