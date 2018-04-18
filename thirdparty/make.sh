#!/bin/sh

CUR_DIR="$(cd $(dirname $0) && pwd)"
INSTALL_PREFIX="$CUR_DIR/../install"

if [ $# -ge 2 ]; then INSTALL_PREFIX=$1; fi

mkdir -p $INSTALL_PREFIX

LIBS=`find $INSTALL_PREFIX -name *.a`

if [ `echo $LIBS|grep -c libssl` -eq 0 ]; then
    cd $CUR_DIR
    tar xzf openssl-1.0.0a.tar.gz
    cd openssl-1.0.0a
    ./config --prefix=$INSTALL_PREFIX
    make && make install
fi

if [ `echo $LIBS|grep -c libexpat` -eq 0 ]; then
    cd $CUR_DIR
    tar xjf expat-2.2.5.tar.bz2
    cd expat-2.2.5
    ./configure --prefix=$INSTALL_PREFIX
    make && make install
fi

if [ `echo $LIBS|grep -c libapr` -eq 0 ]; then
    cd $CUR_DIR
    tar xzf apr-1.6.3.tar.gz
    cd apr-1.6.3
    ./configure --prefix=$INSTALL_PREFIX
    make && make install
fi

if [ `echo $LIBS|grep -c libaprutil` -eq 0 ]; then
    cd $CUR_DIR
    tar xzf apr-util-1.6.1.tar.gz
    cd apr-util-1.6.1
    ./configure --prefix=$INSTALL_PREFIX --with-apr=$INSTALL_PREFIX --with-expat=$INSTALL_PREFIX
    make && make install
fi