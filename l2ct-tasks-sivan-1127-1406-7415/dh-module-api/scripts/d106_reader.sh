#!/bin/sh
# D106 reader: exit 0 = the marker file is exactly 'D106:root'; exit 1 = anything else; exit 3 = no marker file
f=/tmp/l2ct_d106
[ -f "$f" ] || { echo 'D106 reader: no marker file'; exit 3; }
got=$(tr '\n' ' ' < "$f" | sed 's/ *$//')
echo "D106 reader saw: $got"
[ "$got" = 'D106:root' ] && exit 0
exit 1
