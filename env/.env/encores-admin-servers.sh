#!/usr/bin/bash

# set global envs
function stop-servers {
	bash $NGI_HOME/modules/app/was/bin/shutdown.sh pkg/modules/app/was/etc/backend.properties
}

export ENCORES_HOME=/d/encores
export WORKSPACE_HOME=$ENCORES_HOME/workspace/de.aga.encores
export JAVA_HOME=/d/encores/java/jdk1.7.0_80_x64
export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was

cd $WORKSPACE_HOME

# use pkg to start servers
export NGI_PKG_HOME=$WORKSPACE_HOME/pkg
bash pkg/bin/run-backend.sh &> $ENCORES_HOME/logs/was.log &
bash pkg/bin/run-frontend.sh &> $ENCORES_HOME/logs/tomcat.log &

# use generated target/classes to admin servers (deploy, sql, ...)
export NGI_PKG_HOME=$WORKSPACE_HOME/pkg/target/classes
# start admin bash
bash

# shutdown servers after closing admin bash
stop-servers
