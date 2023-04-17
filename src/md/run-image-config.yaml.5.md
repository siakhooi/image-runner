% RUN-IMAGE-CONFIG.YAML(5) Siak Hooi DevUtils 1.2.0 | Image-Runner Commands
% Siak Hooi
% April 2023

# NAME
~/.image-runner/config.yaml - image runner config file

# DESCRIPTION
~/.image-runner/config.yaml is config file in yaml format, with following available options:

run-image:
\ \ <program-name>:
\ \ \ \ image: <container-name>
\ \ \ \ command: <command-to-start>

# EXAMPLES
run-image:
\ \ run-oraclelinux:
\ \ \ \ image: oraclelinux:9
\ \ \ \ command: bash

# FILES
~/.image-runner/config.yaml

# LICENSE
MIT

# BUGS
Report bugs at <https://github.com/siakhooi/image-runner/issues>.

# SEE ALSO
run-image(1), run-linux(1), run-image-sample-config(5), run-image-build-links(1)