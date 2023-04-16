#!/usr/bin/bash
echo "admin servers"

# set global envs
function stop-all () {
	cd $WORKSPACE_HOME/de.bit.elementar
	#bash pkg/bin/stop-db.sh
	bash pkg/bin/stop-backend.sh &
	bash pkg/bin/stop-frontend.sh &
}

export ELEMENTAR_HOME=/c/dev/elementar
export WORKSPACE_HOME=$ELEMENTAR_HOME/workspace
export M2_HOME=/c/ngi/opt/modules/build/maven/apache-maven-3.2.5
export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was
export PATH=$PATH:$M2_HOME/bin
export JAVA_HOME=/c/ngi/opt/modules/app/was/8.5.5.12/java_1.8_64

cd $WORKSPACE_HOME/de.bit.elementar

# use pkg (not target/classes) to start servers
export NGI_PKG_HOME=$WORKSPACE_HOME/de.bit.elementar/pkg

#bash pkg/bin/run-db.sh &> $ELEMENTAR_HOME/logs/db.log &
bash pkg/bin/run-backend.sh NGI_APP_DEBUG=SERVER NGI_APP_PROFILER=JFR &> $ELEMENTAR_HOME/logs/backend.log &

export JAVA_HOME=/c/ngi/opt/modules/lang/java/jdk1.8.0_121_x64
bash pkg/bin/run-frontend.sh NGI_APP_DEBUG=SERVER &> $ELEMENTAR_HOME/logs/frontend.log &

# start admin bash
unset JAVA_HOME
export JAVA_HOME=/c/ngi/opt/modules/lang/java/jdk1.8.0_121_x64

tail -F $ELEMENTAR_HOME/logs/backend.log

# shutdown servers after closing admin bash
stop-all
