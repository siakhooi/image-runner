#!/bin/sh
set -e

shellcheck src/bin/*

TARGET=target
SOURCE=src

mkdir "$TARGET"

# Control File
cp -vr $SOURCE/DEBIAN $TARGET

# Binary Files
mkdir -p $TARGET/usr/bin
chmod +x $SOURCE/bin/*
cp -vr $SOURCE/bin $TARGET/usr
(
  cd $TARGET/usr/bin
  ln -s run-linux run-ubuntu
  ln -s run-linux run-debian
)

# Lib Files
mkdir -p $TARGET/usr/lib/image-runner
chmod +x $SOURCE/lib/*
cp -vr $SOURCE/lib/* $TARGET/usr/lib/image-runner

# Man Pages
mkdir -p $TARGET/usr/share/man/man1/
pandoc $SOURCE/md/run-linux.1.md -s -t man | gzip -9 >$TARGET/usr/share/man/man1/run-linux.1.gz

(
  cd $TARGET/usr/share/man/man1/
  ln -s run-linux.1.gz run-ubuntu.1.gz
  ln -s run-linux.1.gz run-debian.1.gz
)

dpkg-deb --build -Zxz $TARGET
dpkg-name ${TARGET}.deb

DEBFILE=$(ls ./*.deb)
dpkg --contents "$DEBFILE"
