#!/bin/sh
set -e

shellcheck src/bin/*

TARGET=target
SOURCE=src

mkdir "$TARGET"

# Control File
cp -vr $SOURCE/DEBIAN $TARGET
chmod 755 $TARGET/DEBIAN/*

# Binary Files
mkdir -p $TARGET/usr/bin
cp -vr $SOURCE/bin $TARGET/usr
chmod 755 $TARGET/usr/bin/*
(
  cd $TARGET/usr/bin
  ln -s run-linux run-ubuntu
  ln -s run-linux run-debian
  ln -s run-linux run-alpine
  ln -s run-linux run-busybox
  ln -s run-linux run-fedora
  ln -s run-linux run-almalinux
  ln -s run-linux run-amazonlinux
  ln -s run-linux run-archlinux
)

# Lib Files
mkdir -p $TARGET/usr/lib/image-runner
cp -vr $SOURCE/lib/* $TARGET/usr/lib/image-runner
chmod 755 $TARGET/usr/lib/image-runner/*

# Man Pages
mkdir -p $TARGET/usr/share/man/man1/
pandoc $SOURCE/md/run-linux.1.md -s -t man | gzip -9 >$TARGET/usr/share/man/man1/run-linux.1.gz
pandoc $SOURCE/md/run-image.1.md -s -t man | gzip -9 >$TARGET/usr/share/man/man1/run-image.1.gz
pandoc $SOURCE/md/run-image-sample-config.1.md -s -t man | gzip -9 >$TARGET/usr/share/man/man1/run-image-sample-config.1.gz
pandoc $SOURCE/md/run-image-build-links.1.md -s -t man | gzip -9 >$TARGET/usr/share/man/man1/run-image-build-links.1.gz
pandoc $SOURCE/md/run-image-list-links.1.md -s -t man | gzip -9 >$TARGET/usr/share/man/man1/run-image-list-links.1.gz

mkdir -p $TARGET/usr/share/man/man5/
pandoc $SOURCE/md/run-image-config.yaml.5.md -s -t man | gzip -9 >$TARGET/usr/share/man/man5/run-image-config.yaml.5.gz

(
  cd $TARGET/usr/share/man/man1/
  ln -s run-linux.1.gz run-ubuntu.1.gz
  ln -s run-linux.1.gz run-debian.1.gz
  ln -s run-linux.1.gz run-alpine.1.gz
  ln -s run-linux.1.gz run-busybox.1.gz
  ln -s run-linux.1.gz run-fedora.1.gz
  ln -s run-linux.1.gz run-almalinux.1.gz
  ln -s run-linux.1.gz run-amazonlinux.1.gz
  ln -s run-linux.1.gz run-archlinux.1.gz
)

fakeroot dpkg-deb --build -Zxz $TARGET
dpkg-name ${TARGET}.deb

DEBFILE=$(ls ./*.deb)

sha256sum "$DEBFILE" >$DEBFILE.sha256sum
sha512sum "$DEBFILE" >$DEBFILE.sha512sum

dpkg --contents "$DEBFILE"
