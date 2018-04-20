#!/usr/bin/bash
echo "starting servers"

# set global envs
function stop-was {
	bash $NGI_HOME/modules/app/was/bin/shutdown.sh pkg/modules/app/was/etc/backend.properties
}

export ENCORES_HOME=/d/encores
export WORKSPACE_HOME=$ENCORES_HOME/workspace/de.aga.encores
export M2_HOME=$NGI_HOME/modules/maven/apache-maven-3.2.5
export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was
export PATH=$PATH:$M2_HOME/bin

cd $WORKSPACE_HOME

# use pkg (not target/classes) to start servers
export NGI_PKG_HOME=$WORKSPACE_HOME/pkg
bash pkg/bin/run-backend.sh NGI_APP_DEBUG=SERVER NGI_APP_CONSOLE=JMX NGI_APP_PROFILER=JFR &> $ENCORES_HOME/logs/was.log &

export JAVA_HOME=/d/encores/java/jdk1.7.0_80_x64
bash pkg/bin/run-frontend.sh NGI_APP_DEBUG=SERVER &> $ENCORES_HOME/logs/tomcat.log &
bash pkg/bin/run-apgonline.sh NGI_APP_DEBUG=SERVER &> $ENCORES_HOME/logs/apgonline.log &

# use generated target/classes to admin servers (deploy, sql, ...)
export NGI_PKG_HOME=$WORKSPACE_HOME/pkg/target/classes

# start admin bash
#export JAVA_HOME=/d/encores/java/jdk1.7.0_80_x64
unset JAVA_HOME
bash


# shutdown servers after closing admin bash
stop-was
