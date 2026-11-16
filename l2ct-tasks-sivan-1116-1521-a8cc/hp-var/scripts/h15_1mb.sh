#!/bin/sh
head -c 1048576 /dev/zero | tr '\0' 'B'
echo
exit 0
