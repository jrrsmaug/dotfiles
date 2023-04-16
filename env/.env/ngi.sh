#!/usr/bin/bash
echo "ngi setup"

export CLASSPATH=

export JAVA_HOME=/c/ngi/opt/modules/lang/java/jdk1.8.0_121_x64
export M2_HOME=/c/ngi/opt/modules/build/maven/apache-maven-3.2.5
export M3_HOME=/c/ngi/opt/modules/build/maven/apache-maven-3.8.3
export MAVEN_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=1024M -XX:MaxPermSize=4096M"

export PATH=$PATH:$M3_HOME/bin:/mingw64/bin
