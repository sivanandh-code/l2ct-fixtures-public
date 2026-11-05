#!/bin/sh
# H17: the first run changes a file and fails, the second run passes
[ -f /tmp/l2ct_h17 ] && exit 0
touch /tmp/l2ct_h17
echo first run
exit 1
