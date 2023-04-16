#!/usr/bin/bash
echo "starting db..."

# set global envs
function stop-all {
	cd $WORKSPACE_HOME/de.bit.elementar
	bash pkg/bin/stop-db.sh
	bash pkg/bin/stop-backend.sh
	bash pkg/bin/stop-frontend.sh
}

export ELEMENTAR_HOME=/c/dev/elementar
export WORKSPACE_HOME=$ELEMENTAR_HOME/workspace
export M2_HOME=$NGI_HOME/modules/build/maven/apache-maven-3.2.5
export NGI_MODULES_DBMS=postgresql
export NGI_MODULES_APP=jboss
export PATH=$PATH:$M2_HOME/bin
export JAVA_HOME=/c/ngi/opt/modules/lang/java/jdk1.8.0_121_x64

cd $WORKSPACE_HOME/de.bit.elementar

# use pkg (not target/classes) to start servers
export NGI_PKG_HOME=$WORKSPACE_HOME/de.bit.elementar/pkg

bash pkg/bin/run-db.sh &
