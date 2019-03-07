#!/usr/bin/bash
export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was
export NGI_PKG_HOME=/d/elementar/workspace/de.bit.elementar.vertrag.system/pkg/target/classes

source $NGI_HOME/bin/ngi.sh
echo "elementar pkg"

cd /d/elementar/workspace/de.bit.elementar.vertrag.system/pkg
