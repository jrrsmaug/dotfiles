#!/usr/bin/zsh

export JAVA_HOME=/d/vportal/java/jdk1.7.0_80_x64
export CLASSPATH=

export M2_HOME=/d/vportal/maven/apache-maven-3.2.5
export M3_HOME=$M2_HOME

export MAVEN_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=1024M -XX:MaxPermSize=4096M"

path=(
  $path
  $JAVA_HOME/bin
  $M3_HOME/bin
)

