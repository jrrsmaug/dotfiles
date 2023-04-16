#!/usr/bin/bash
source ~/.env/ngi.sh
echo -ne "\e]0;wur dev\a"

export WUERZBURGER_SRC=/c/dev/wuerzburger/workspace

cd $WUERZBURGER_SRC
zsh
