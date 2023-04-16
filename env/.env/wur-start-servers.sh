 #!/usr/bin/bash
echo -ne "\e]0;wur servers\a"

# set global envs
function stop-all () {
	cd $WORKSPACE_HOME/de.novum.vger.pc.vertrag/system/container
	bash db/src/bin/local-stop.sh &
	bash vger/src/bin/local-stop.sh &
	bash ewc/src/bin/local-stop.sh &
}

function start-all () {
	cd $WORKSPACE_HOME/de.novum.vger.pc.vertrag/system/container
	bash db/src/bin/local-entrypoint.sh &> $PROJECT_HOME/logs/db.log &
	bash vger/src/bin/local-entrypoint.sh &> $PROJECT_HOME/logs/backend.log &
	bash ewc/src/bin/local-entrypoint.sh &> $PROJECT_HOME/logs/frontend.log &
}

export PROJECT_HOME=/c/dev/wuerzburger
export WORKSPACE_HOME=$PROJECT_HOME/workspace

cd $WORKSPACE_HOME/de.novum.vger.pc.vertrag/system/container

# start admin bash
start-all && tail -F $PROJECT_HOME/logs/backend.log
