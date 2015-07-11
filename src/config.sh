#!/bin/bash

set -e -x -u

cd /tmp/src

## install nginx, from *their* repo.  epel's is old enough to drink.
yum localinstall -y http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm

## http://stackoverflow.com/questions/4632261/pil-jpeg-library-help
yum install -y centos-release-SCL git nginx gcc libjpeg-devel curl-devel

## post-SCL installation
yum install -y python27 python27-devel

## copy over our skel dir, replacing anything that was put in place by RPMs
tar -c -C skel -f - . | tar -xf - -C /

export LD_LIBRARY_PATH="$( scl enable python27 'echo ${LD_LIBRARY_PATH}' )"
export PATH="$( scl enable python27 'echo ${PATH}' )"
export PKG_CONFIG_PATH="$( scl enable python27 'echo ${PKG_CONFIG_PATH}' )"

easy_install-2.7 pip==7.1.0
pip2.7 install -r requirements.txt

## cleanup
cd /
yum clean all
rm -rf /var/tmp/yum-root* /tmp/src
