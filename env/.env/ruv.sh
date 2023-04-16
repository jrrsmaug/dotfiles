#!/usr/bin/bash
source ~/.env/ngi.sh
echo -ne "\e]0;ruv dev\a"

export NGI_MODULES_DBMS=db2
export NGI_MODULES_APP=was

export RUV_HOME=/c/dev/ruv
export RUV_SRC=$RUV_HOME/workspace

cd $RUV_SRC
zsh

