#!/usr/bin/env bash
#
# Description: Build a Debian package from the source files.
# Usage: ./build-deb.sh [options]
#

set -euo pipefail

# shellcheck disable=SC1091
source ./release.env
# shellcheck disable=SC1091
source ./build.env

# ===== Constants =====
# readonly build_home=target
# readonly source_home=src
readonly full_name=$PACKAGE_NAME-$RELEASE_VERSION
readonly build_root=target
readonly build_home=$build_root/$full_name
readonly source_home=src

# ===== Argument Parsing =====
parse_args() {
	while getopts "h" opt; do
		case "${opt}" in
		h)
			usage
			exit 0
			;;
		*)
			usage
			exit 1
			;;
		esac
	done
	shift $((OPTIND - 1))
}

# ===== Helper Functions =====
prepare_directory() {
	mkdir -p "$build_home"
	rm -rf "${build_home:?}"/*
}
copy_control_files() {
	cp -vr $source_home/DEBIAN "$build_home"
	chmod 755 "$build_home"/DEBIAN/postinst
}
copy_binary_files() {
	readonly build_bin_home=$build_home/usr/bin
	mkdir -p "$build_bin_home"

	find $source_home/bin -type f -exec cp -vr {} "$build_bin_home" \;
	chmod 755 "$build_bin_home"/*
}
link_binary() {
	(
		cd "$build_bin_home"
		ln -s run-linux run-ubuntu
		ln -s run-linux run-debian
		ln -s run-linux run-alpine
		ln -s run-linux run-busybox
		ln -s run-linux run-fedora
		ln -s run-linux run-almalinux
		ln -s run-linux run-amazonlinux
		ln -s run-linux run-archlinux
		ln -s run-linux run-termux
	)
}
generate_man_pages() {
	mkdir -p "$build_home/usr/share/man/man1/"
	pandoc $source_home/md/run-linux.1.md -s -t man | gzip -9 >"$build_home"/usr/share/man/man1/run-linux.1.gz
	pandoc $source_home/md/run-image.1.md -s -t man | gzip -9 >"$build_home"/usr/share/man/man1/run-image.1.gz
	pandoc $source_home/md/run-image-sample-config.1.md -s -t man | gzip -9 >"$build_home"/usr/share/man/man1/run-image-sample-config.1.gz
	pandoc $source_home/md/run-image-build-links.1.md -s -t man | gzip -9 >"$build_home"/usr/share/man/man1/run-image-build-links.1.gz
	pandoc $source_home/md/run-image-list-links.1.md -s -t man | gzip -9 >"$build_home"/usr/share/man/man1/run-image-list-links.1.gz

	mkdir -p "$build_home"/usr/share/man/man5/
	pandoc $source_home/md/run-image-config.yaml.5.md -s -t man | gzip -9 >"$build_home"/usr/share/man/man5/run-image-config.yaml.5.gz

	(
		cd "$build_home"/usr/share/man/man1/
		ln -s run-linux.1.gz run-ubuntu.1.gz
		ln -s run-linux.1.gz run-debian.1.gz
		ln -s run-linux.1.gz run-alpine.1.gz
		ln -s run-linux.1.gz run-busybox.1.gz
		ln -s run-linux.1.gz run-fedora.1.gz
		ln -s run-linux.1.gz run-almalinux.1.gz
		ln -s run-linux.1.gz run-amazonlinux.1.gz
		ln -s run-linux.1.gz run-archlinux.1.gz
		ln -s run-linux.1.gz run-termux.1.gz
	)

}

build_deb_package() {
	fakeroot dpkg-deb --build -Zxz "$build_home"
}
rename_deb_package() {
	dpkg-name "${build_home}.deb"
}
generate_checksums() {
	DEBFILE=$(ls ./target/*.deb)

	mv -v "$DEBFILE" .
	deb_file=$(basename "$DEBFILE")
	sha256sum "$deb_file" >"$deb_file.sha256sum"
	sha512sum "$deb_file" >"$deb_file.sha512sum"
}
list_deb_contents() {
	dpkg --contents "$deb_file"
}
# ===== Main Logic =====
main() {

	parse_args "$@"
	prepare_directory

	copy_control_files
	copy_binary_files
	link_binary

	generate_man_pages

	build_deb_package
	rename_deb_package

	generate_checksums

	list_deb_contents
}
# ===== Entrypoint =====
main "$@"
