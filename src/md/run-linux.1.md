% RUN-LINUX(1) Siak Hooi DevUtils 1.2.0 | Image-Runner Commands
% Siak Hooi
% March 2023

# NAME

run-ubuntu - run latest ubuntu container with bash.\
run-debian - run latest debian container with bash.\
run-alpine - run latest alpine container with sh.\
run-busybox - run latest busybox container with sh.\
run-fedora - run latest fedora container with bash.\
run-almalinux - run latest almalinux container with bash.\
run-amazonlinux - run latest amazonlinux container with bash.\
run-archlinux - run latest archlinux container with bash.\
run-linux - display this help.

# SYNOPSIS

**run-ubuntu** [workingDirectory]\
**run-debian** [workingDirectory]\
**run-alpine** [workingDirectory]\
**run-busybox** [workingDirectory]\
**run-fedora** [workingDirectory]\
**run-almalinux** [workingDirectory]\
**run-amazonlinux** [workingDirectory]\
**run-archlinux** [workingDirectory]\
**run-linux**

# DESCRIPTION

**run-linux** is a collection of scripts to run latest linux container with default shell for development/testing purposes.\
Features: \
\ \ - run latest container with shell, _bash_ or _sh_.\
\ \ - mount a working directory as a directory in container.\
\ \ - container clean up when exit.

**workingDirectory**
: Directory to mount at /working, default to current directory

# EXIT CODE

**1**
: Program is not configured in config file.

**2**
: **workingDirectory** is not exists or not a directory.

**3**
: Run Container Command (default: docker) is not available, please install.

# LICENSE

MIT

# BUGS

Report bugs at <https://github.com/siakhooi/image-runner/issues>.

# SEE ALSO

run-image(1)
