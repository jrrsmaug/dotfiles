#!/usr/bin/bash
export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was
export NGI_PKG_HOME=/c/dev/ruv/workspace/de.ruv.poc.vertrag/system/pkg/target/classes

source $NGI_HOME/bin/ngi.sh
echo -ne "\e]0;ruv pkg vertrag\a"

cd /c/dev/ruv/workspace/de.ruv.poc.vertrag/system/pkg
zsh
