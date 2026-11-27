#!/bin/sh
# D105 reader: exit 0 = the marker file is exactly 'D105:shared'; exit 1 = anything else; exit 3 = no marker file
f=/tmp/l2ct_d105
[ -f "$f" ] || { echo 'D105 reader: no marker file'; exit 3; }
got=$(tr '\n' ' ' < "$f" | sed 's/ *$//')
echo "D105 reader saw: $got"
[ "$got" = 'D105:shared' ] && exit 0
exit 1
