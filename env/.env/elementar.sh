#!/usr/bin/bash
source ~/.env/ngi.sh
echo "elementar dev"

function doin() {
  local YELLOW="[1;33m"
  local NO_COLOUR="[0m"
  echo $YELLOW$1$NO_COLOUR
  if [ ! -d "$1" ]; then
    echo "Directory does not exist"; return
  fi
  pushd "$1" > /dev/null
  shift
  eval "$@"
  if [[ "$?" -ne 0 ]] ; then
    echo "Failed command"; return
  fi
  popd > /dev/null
}
alias d=doin

function forsome() {
  dirs=$1
  shift
  for d in $dirs*/ ; do
    doin "$d" $@
  done
}
alias fs=forsome
alias f="forsome '*'"


export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was

export ELEMENTAR_HOME=/d/elementar
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
