#!/usr/bin/zsh

export NOVUM_DEV_HOME=$1
export USE_JAVA=$2

export JAVA_HOME=$NOVUM_DEV_HOME/$USE_JAVA
export CLASSPATH=

export M2_HOME=$NOVUM_DEV_HOME/maven/apache-maven-3.2.5
export M3_HOME=$M2_HOME

export MAVEN_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=1024M -XX:MaxPermSize=4096M"

export ECLIPSE_HOME=$NOVUM_DEV_HOME/eclipse-4

export CATALINA_HOME=$NOVUM_DEV_HOME/app/apache-tomcat-7.0.65

export JBOSS_HOME=$NOVUM_DEV_HOME/app/jboss-as-7.1.1.Final

export PSQL_HOME=$NOVUM_DEV_HOME/db/psql-9.4.5-3

export WEBSPHERE_8_5_HOME=$NOVUM_DEV_HOME/websphere-8.5

export HSQLDB_HOME=$NOVUM_DEV_HOME/db/hsqldb

export DEPLOY_SOURCE=$NOVUM_DEV_HOME/deploy

path=(
  $path
  $NOVUM_DEV_HOME
  $JAVA_HOME/bin
  $M3_HOME/bin
  $ECLIPSE_HOME
  $CATALINA_HOME
  $PSQL_HOME/bin
)
