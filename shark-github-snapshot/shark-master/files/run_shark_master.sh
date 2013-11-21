#!/bin/bash
. /opt/shark-0.9.0-SNAPSHOT/conf/shark-env.sh
export PATH=$PATH:$SCALA_HOME/bin
export CLASSPATH=$CLASSPATH:$SCALA_HOME/lib/scala-library.jar

/opt/spark-$SPARK_VERSION/bin/start-master.sh

while [ 1 ];
do
    tail -f /opt/spark-${SPARK_VERSION}/logs/*.out
    sleep 1
done
