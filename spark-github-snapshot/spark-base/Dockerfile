# Spark Master SNAPSHOT
#
FROM apache-hadoop-hdfs-precise:1.2.1

MAINTAINER amplab amp-docker@eecs.berkeley.edu

ENV SCALA_VERSION 2.9.3
ENV SPARK_VERSION 0.9.0-incubating-SNAPSHOT
ENV SCALA_HOME /opt/scala-$SCALA_VERSION
ENV SPARK_HOME /opt/spark-$SPARK_VERSION
ENV PATH $SPARK_HOME:$SCALA_HOME/bin:$PATH

# Install Scala
ADD http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.tgz /
RUN (cd / && gunzip < scala-$SCALA_VERSION.tgz)|(cd /opt && tar -xvf -)
RUN rm /scala-$SCALA_VERSION.tgz

# Install Spark 
ADD https://github.com/apache/incubator-spark/archive/master.zip /opt/
RUN (apt-get install -y unzip && cd /opt && unzip master.zip && \
	ln -s /opt/incubator-spark-master /opt/spark-$SPARK_VERSION && \
	rm /opt/master.zip && \
	cd /opt/incubator-spark-master)

# Fake install of Fuse and install JDK
# (see https://github.com/dotcloud/docker/issues/514 ,
# https://gist.github.com/henrik-muehe/6155333 )
RUN (apt-get install libfuse2 && \
	cd /tmp && apt-get download fuse && \
	dpkg-deb -x fuse_* . && \
	dpkg-deb -e fuse_* && \
	rm fuse_*.deb && \
	echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst && \
	dpkg-deb -b . /fuse.deb && \
	dpkg -i /fuse.deb)

RUN (apt-get install -y git openjdk-7-jdk maven && \
	cd /opt/spark-$SPARK_VERSION && \
	./sbt/sbt assembly publish-local)

# Add Shark config files and configure script
ADD files /root/spark_files
