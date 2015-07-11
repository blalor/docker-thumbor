#!/bin/bash

export LD_LIBRARY_PATH="$( scl enable python27 'echo ${LD_LIBRARY_PATH}' )"
export PATH="$( scl enable python27 'echo ${PATH}' )"
export PKG_CONFIG_PATH="$( scl enable python27 'echo ${PKG_CONFIG_PATH}' )"

exec thumbor --ip=127.0.0.1 --port 8080 --conf=/etc/thumbor.conf --log-level=info
