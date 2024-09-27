% RUN-IMAGE-CONFIG.YAML(5) Siak Hooi DevUtils 1.2.0 | Image-Runner Commands
% Siak Hooi
% April 2023

# NAME
~/.image-runner/config.yaml - image runner config file

# DESCRIPTION
~/.image-runner/config.yaml is config file in yaml format, with following available options:

run-image:\
\ \ \<program-name>:\
\ \ \ \ image: \<container-name>\
\ \ \ \ command: \<command-to-start/exec-in>\
\ \ \ \ execStartCommand: \<start-command-for-exec>\
\ \ \ \ workingDirectory: \<optional, container-directory-to-mount-to-host-working-directory, default to /working>\
\ \ \ \ network: \<network>\
\ \ \ \ volumes:\
\ \ \ \ \ \ - path: \<path in container>\
\ \ \ \ \ \ - hostPath: \<path in host>

# EXAMPLES
run-image:\
\ \ run-oraclelinux:\
\ \ \ \ image: oraclelinux:9\
\ \ \ \ command: bash\
\ \ \ \ workingDirectory: /tmp\
\ \ run-oraclelinux2:\
\ \ \ \ image: oraclelinux:9\
\ \ \ \ command: bash\
\ \ \ \ network: host\
\ \ \ \ volumes:\
\ \ \ \ \ \ - path: /var/run/docker.sock\
\ \ \ \ \ \ - hostPath: /var/run/docker.sock

# FILES
~/.image-runner/config.yaml

# LICENSE
MIT

# BUGS
Report bugs at <https://github.com/siakhooi/image-runner/issues>.

# SEE ALSO
run-image(1), run-linux(1), run-image-sample-config(5), run-image-build-links(1)