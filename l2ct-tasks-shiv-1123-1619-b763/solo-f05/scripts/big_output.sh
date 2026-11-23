#!/bin/sh
# about 1 MB of output (1048576 bytes)
head -c 1048576 /dev/zero | tr '\0' 'A'
echo
exit 0
