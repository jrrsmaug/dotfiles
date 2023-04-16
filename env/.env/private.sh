#!/usr/bin/bash
export CLASSPATH=

export JAVA_HOME=/c/private/openjdk-15.0.1_windows-x64_bin
export M2_HOME=/c/ngi/opt/modules/build/maven/apache-maven-3.2.5
export MAVEN_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=1024M -XX:MaxPermSize=4096M"

export PATH=$PATH:$M2_HOME/bin:/mingw64/bin

alias lein=lein.bat
alias deps=deps.exe

echo -ne "\e]0;private dev\a"

cd /c/private
zsh
