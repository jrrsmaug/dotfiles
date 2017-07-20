#!/usr/bin/bash

# ngi env vportal
export NGI_MODULES_DBMS=postgresql
export NGI_MODULES_APP=jboss
export NGI_PKG_HOME=/d/vportal/workspace/vportal/pkg
export NGI_VPORTAL_ENV=dev
export ENVIRONMENT=$NGI_VPORTAL_ENV
export PATH=$NGI_PKG_HOME/bin:$PATH
unset JAVA_HOME
