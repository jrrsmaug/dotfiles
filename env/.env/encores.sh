#!/usr/bin/bash
source ~/.env/ngi.sh
echo "encores dev"

export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was

export ENCORES_HOME=/d/encores
export ENCORES_SRC=$ENCORES_HOME/workspace/de.aga.encores

alias build-all="mvn clean install -DskipTests -Pas-websphere-ngi"
alias import-testdata="mvn clean install -f encores-it-tests/pom.xml -am -Pas-websphere-ngi,tests-import-data"
alias system-reset="mvn clean install -DskipTests -pl pkg -Pas-websphere-ngi,de.novum.ngi.pkg.system-reset"
alias system-update="mvn clean install -DskipTests -pl pkg -Pas-websphere-ngi,de.novum.ngi.pkg.system-update"
alias system-update-nodata='mvn clean install -DskipTests -pl pkg -Pas-websphere-ngi,de.novum.ngi.pkg.system-update'

cd $ENCORES_SRC
