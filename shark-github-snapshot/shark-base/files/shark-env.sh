#!/usr/bin/env bash
. __SPARK_HOME__/conf/spark-env.sh
SPARK_JAVA_OPTS="$SPARK_JAVA_OPTS -Dspark.local.dir=/tmp/spark "
export SPARK_JAVA_OPTS
export SHARK_MASTER_MEM=700m
export HIVE_HOME=__HIVE_HOME__
export SHARK_VERSION=0.9.0-SNAPSHOT
