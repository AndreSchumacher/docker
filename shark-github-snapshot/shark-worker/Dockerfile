# Shark worker
FROM shark-base:0.9.0-SNAPSHOT
MAINTAINER amplab amp-docker@eecs.berkeley.edu

# Add run script
ADD files /root/shark_worker_files

# Add the entrypoint script for the worker
ENTRYPOINT ["/root/shark_worker_files/default_cmd"]
