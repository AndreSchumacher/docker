#!/bin/bash
. /opt/shark-0.9.0-SNAPSHOT/conf/shark-env.sh

# TODO: move this to the configure script of some base class
ln -s /opt/shark-${SHARK_VERSION}/run-tests-from-scratch-workspace/hive/build/dist /opt/hive-${HIVE_VERSION}-bin

export PATH=$PATH:$SCALA_HOME/bin
export CLASSPATH=$CLASSPATH:$SCALA_HOME/lib/scala-library.jar
/opt/spark-$SPARK_VERSION/spark-class org.apache.spark.deploy.worker.Worker spark://master:7077
