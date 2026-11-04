#!/bin/sh
head -c 5242880 /dev/zero | tr '\0' 'B'
echo
exit 0
