# Shark master
FROM shark-base:0.9.0-SNAPSHOT
MAINTAINER amplab amp-docker@eecs.berkeley.edu

# Add run script
ADD files /root/shark_shell_files

# Add default command for master
ENTRYPOINT ["/root/shark_shell_files/default_cmd"]

