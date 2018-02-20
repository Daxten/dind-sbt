#!/bin/bash
set -xe

apt-get clean autoclean
rm -rf /var/lib/apt/* /var/lib/cache/* /var/lib/log/*
