#!/usr/bin/bash
echo "ngi setup"

export CLASSPATH=

export M2_HOME=/c/ngi/opt/modules/build/maven/apache-maven-3.2.5
export MAVEN_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=1024M -XX:MaxPermSize=4096M"

export PATH=$PATH:$M2_HOME/bin:/mingw64/bin
