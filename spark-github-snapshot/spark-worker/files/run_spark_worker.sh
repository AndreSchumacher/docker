#!/bin/bash
. /opt/spark-0.9.0-incubating-SNAPSHOT/conf/spark-env.sh
${SPARK_HOME}/spark-class org.apache.spark.deploy.worker.Worker spark://master:7077
