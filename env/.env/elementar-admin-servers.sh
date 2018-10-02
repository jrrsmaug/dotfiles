#!/usr/bin/bash
echo "starting servers"

# set global envs
function stop-all {
	cd $WORKSPACE_HOME/de.bit.elementar
	bash pkg/bin/stop-db.sh
	bash pkg/bin/stop-backend.sh
	bash pkg/bin/stop-frontend.sh
}

export ELEMENTAR_HOME=/d/elementar
export WORKSPACE_HOME=$ELEMENTAR_HOME/workspace
export M2_HOME=$NGI_HOME/modules/maven/apache-maven-3.2.5
export NGI_MODULES_DBMS=postgresql
export NGI_MODULES_APP=jboss
export PATH=$PATH:$M2_HOME/bin
export JAVA_HOME=/c/ngi/opt/modules/lang/java/jdk1.8.0_121_x64

cd $WORKSPACE_HOME/de.bit.elementar

# use pkg (not target/classes) to start servers
export NGI_PKG_HOME=$WORKSPACE_HOME/de.bit.elementar/pkg

bash pkg/bin/run-db.sh &> $ELEMENTAR_HOME/logs/db.log &
bash pkg/bin/run-backend.sh NGI_APP_DEBUG=SERVER NGI_APP_PROFILER=JFR &> $ELEMENTAR_HOME/logs/backend.log &
bash pkg/bin/run-frontend.sh NGI_APP_DEBUG=SERVER &> $ELEMENTAR_HOME/logs/frontend.log &

# use generated target/classes to admin servers (deploy, sql, ...)
export NGI_PKG_HOME=$WORKSPACE_HOME/de.bit.elementar/pkg/target/classes

# start admin bash
unset JAVA_HOME
bash


# shutdown servers after closing admin bash
stop-all
