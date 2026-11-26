#!/bin/sh
# L111: fails the FIRST time (marker in /tmp of the container), passes on the retry
[ -f /tmp/l2ct-l111-setup ] && exit 0
touch /tmp/l2ct-l111-setup
echo 'L111 setup failed on purpose'
exit 1
