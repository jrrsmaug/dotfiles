#!/usr/bin/zsh

export NGI_HOME=/c/ngi/opt

export NGI_MODULES_DBMS=postgresql
export NGI_MODULES_APP=jboss


export M2_HOME=$NGI_HOME/modules/build/maven/apache-maven-3.2.5
export MAVEN_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=1024M -XX:MaxPermSize=4096M"

export JAVA_HOME=/c/ngi/opt/modules/lang/java/jdk1.8.0_121_x64
export CLASSPATH=

export ELEMENTAR_HOME=/d/elementar
export ELEMENTAR_SRC=$ELEMENTAR_HOME/workspace

path=(
  $path
  $M2_HOME/bin
  $JAVA_HOME/bin
)

forall () {
  local LIGHT_GREEN="[1;32m"
  local NO_COLOUR="[0m"
  for d in */ ; do
  	echo $LIGHT_GREEN$d$NO_COLOUR
    pushd $d
    eval "$@"
	if [[ "$?" -ne 0 ]] ; then
	  echo "Failed command"; exit
	fi
    popd
  done
}

alias ele-build-all="mvn clean install -DskipTests -f de.bit.elementar.vertrag.system/build/maven -Pde.bit.elementar.all,de.novum.ngi.modules.tools.vgeree.ai"
