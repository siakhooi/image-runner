default:
	@just --list

all: clean update-version shellcheck build

clean:
	rm -rf target *.deb *.deb.*sum
shellcheck:
	./scripts/shellcheck.sh
update-version:
	./scripts/set-version.sh
build:
	./scripts/build-deb.sh
release:
	./scripts/create-release.sh

test-man:
	pandoc src/md/run-image-list-links.1.md -s -t man | man -l -
test-man-5:
	pandoc src/md/run-image-config.yaml.5.md -s -t man | man -l -

terminalizer:
	terminalizer render docs/terminalizer-image-sitter.yml

test:
	run-debian
	run-ubuntu
	run-alpine
	run-busybox
	run-fedora
	run-almalinux
	run-amazonlinux
	run-archlinux
	run-linux

	man run-debian
	man run-ubuntu
	man run-alpine
	man run-busybox
	man run-fedora
	man run-almalinux
	man run-amazonlinux
	man run-archlinux
	man run-linux

root := justfile_directory()
docker-build-deb:
	docker run --rm -v {{ root }}:/workspaces docker.io/siakhooi/devcontainer:deb2604 scripts/build-deb.sh
