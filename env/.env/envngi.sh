#!/usr/bin/zsh -x

#export NOVUM_DEV_HOME=$1
#export USE_JAVA=$2

export NGI_HOME=/c/ngi/opt

#export JAVA_HOME=$NGI_HOME/modules/java/$2

export CLASSPATH=

#export M2_HOME=$1/maven/apache-maven-3.2.5
#export M3_HOME=$M2_HOME

#export MAVEN_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=1024M -XX:MaxPermSize=4096M"

export PSQL_HOME=$NGI_HOME/modules/dbms/postgresql/pgsql-9.4.5-3

export NGI_PKG_HOME=$1/workspace/vportal/pkg
export NGI_MODULES_DBMS=postgresql
export NGI_MODULES_APP=jboss

export NGI_VPORTAL_ENV=dev
export ENVIRONMENT=$NGI_VPORTAL_ENV

path=(
  $path
  $PSQL_HOME/bin
  $NGI_PKG_HOME/bin
)

