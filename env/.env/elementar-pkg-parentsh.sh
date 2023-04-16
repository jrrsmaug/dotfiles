#!/usr/bin/bash
export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was
export NGI_PKG_HOME=/c/dev/elementar/workspace/de.bit.elementar/pkg/target/classes

source $NGI_HOME/bin/ngi.sh
echo -ne "\e]0;elementar pkg\a"

cd /c/dev/elementar/workspace/de.bit.elementar/pkg
zsh
