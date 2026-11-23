#!/bin/sh
head -c 20971520 /dev/zero | tr '\0' 'B'
echo
exit 0
