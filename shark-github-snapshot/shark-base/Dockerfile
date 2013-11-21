# Spark and Shark master build
#
# Use spark-base as base
FROM spark-base:0.9.0-incubating-SNAPSHOT
MAINTAINER amplab amp-docker@eecs.berkeley.edu

# note: SPARK_VERSION should be inherited from spark-base
# but for some reason isn't (?)
ENV SPARK_VERSION 0.9.0-incubating-SNAPSHOT
ENV SHARK_VERSION 0.9.0-SNAPSHOT
ENV HIVE_VERSION 0.9.0
ENV SPARK_HADOOP_VERSION 1.2.1
ENV HIVE_HOME /opt/shark-$SHARK_VERSION/run-tests-from-scratch-workspace/hive/build/dist

# Install Shark
ADD https://github.com/amplab/shark/archive/master.zip /opt/

RUN (apt-get install -y ivy && cd /opt && unzip master.zip && \
        ln -s /opt/shark-master /opt/shark-$SHARK_VERSION && \
        rm /opt/master.zip && rm -rf /root/.ivy2)
RUN (mkdir /opt/shark-$SHARK_VERSION/run-tests-from-scratch-workspace && \
	cd /opt/shark-$SHARK_VERSION/run-tests-from-scratch-workspace && \
	ln -s /opt/spark-$SPARK_VERSION spark && \
        ln -s /etc/hadoop hadoop-$SPARK_HADOOP_VERSION && \
	cd .. && \
	./bin/dev/run-tests-from-scratch -s -d -t)

# Add Shark config files and configure script
ADD files /root/shark_files

