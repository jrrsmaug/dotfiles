#!/usr/bin/bash
source ~/.env/ngi.sh
echo -ne "\e]0;elementar dev\a"

export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was

export ELEMENTAR_HOME=/c/dev/elementar
export ELEMENTAR_SRC=$ELEMENTAR_HOME/workspace
export SST=$ELEMENTAR_SRC/de.bit.elementar.sst
export VSYS=$ELEMENTAR_SRC/de.bit.elementar.vertrag.system
export VKOM=$ELEMENTAR_SRC/de.bit.elementar.vertrag.sparte.kompakt
export SSYS=$ELEMENTAR_SRC/de.bit.elementar.schaden.system
export PC=$ELEMENTAR_SRC/de.novum.vger.pc

alias build-all="mvn clean install -DskipTests -f de.bit.elementar.vertrag.system/build/maven -Pde.bit.elementar.all"
alias build-war="mvn clean install -am -DskipTests -f de.bit.elementar.vertrag.system -pl de.bit.elementar.vertrag.system:de.bit.elementar.vertrag.system.clients.ewc.war"
alias system-reset="mvn clean install -DskipTests -Pde.novum.ngi.pkg.system-reset -pl pkg -f de.bit.elementar.vertrag.system"
alias system-update="mvn clean install -DskipTests -Pde.novum.ngi.pkg.system-update -pl pkg -f de.bit.elementar.vertrag.system"
alias system-update-nodata="mvn clean install -DskipTests -Pde.novum.ngi.pkg.system-update-nodata -pl pkg -f de.bit.elementar.vertrag.system"

alias build-all-was="build-all -DNGI_MODULES_APP=was"
alias system-reset-was="system-reset -DNGI_MODULES_APP=was"

alias s-build-all="mvn clean install -DskipTests -f de.bit.elementar.schaden.system"
alias s-system-reset="mvn clean install -DskipTests -Pde.novum.ngi.pkg.system-reset -f de.bit.elementar.schaden.system"

cd $ELEMENTAR_SRC
zsh
