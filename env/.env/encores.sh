#!/usr/bin/zsh

export NGI_HOME=/c/ngi/opt

export M2_HOME=$NGI_HOME/modules/build/maven/apache-maven-3.2.5
export MAVEN_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=1024M -XX:MaxPermSize=4096M"

export JAVA_HOME=/d/encores/java/jdk1.7.0_80_x64
export CLASSPATH=

export ENCORES_HOME=/d/encores
export ENCORES_SRC=$ENCORES_HOME/workspace/de.aga.encores

path=(
  $path
  $M2_HOME/bin
  $JAVA_HOME/bin
)

function build-all {
	cd $ENCORES_SRC
	mvn clean install -DskipTests -Pas-websphere-ngi
}

function import-testdata {
	cd $ENCORES_SRC
	mvn clean install -f encores-it-tests/pom.xml -am -Pas-websphere-ngi,tests-import-data
}
