#!/bin/sh
head -c 52428800 /dev/zero | tr '\0' 'B'
echo
exit 0
