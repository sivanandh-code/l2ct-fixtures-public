#!/bin/sh
# L110: fails the FIRST time (marker in /tmp of the container), passes on the retry
[ -f /tmp/l2ct-l110-setup ] && exit 0
touch /tmp/l2ct-l110-setup
echo 'L110 setup failed on purpose'
exit 1
