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

cd $ELEMENTAR_SRC
#zsh
