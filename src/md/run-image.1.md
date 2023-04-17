% RUN-IMAGE(1) Siak Hooi DevUtils 1.2.0 | Image-Runner Commands
% Siak Hooi
% April 2023

# NAME

run-image - run container image based on config file.

# SYNOPSIS

**run-image** program-name [workingDirectory]
**\<program-name-symbolic-link-to-run-image\>** [workingDirectory]

# DESCRIPTION

**run-image** to run container image based on config file.\
Features: \
\ \ - run configured container with configured command.\
\ \ - mount a working directory as a directory in container.\
\ \ - container clean up when exit.

**workingDirectory**
: Directory to mount at /working, default to current directory

# EXIT CODE

**1**
: Config file not exist.

**2**
: Program is not configured in config file.

**3**
: **workingDirectory** is not exists or not a directory.

**4**
: Run Container Command (default: docker) is not available, please install.

# LICENSE

MIT

# BUGS

Report bugs at <https://github.com/siakhooi/image-runner/issues>.

# SEE ALSO

run-linux(1), run-image-config.yaml(5), run-image-sample-config(5), run-image-build-links(1)
