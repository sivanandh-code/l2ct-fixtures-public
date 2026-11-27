#!/bin/sh
# D108 reader: exit 0 = the marker file is exactly 'D108:a D108:b'; exit 1 = anything else; exit 3 = no marker file
f=/tmp/l2ct_d108
[ -f "$f" ] || { echo 'D108 reader: no marker file'; exit 3; }
got=$(tr '\n' ' ' < "$f" | sed 's/ *$//')
echo "D108 reader saw: $got"
[ "$got" = 'D108:a D108:b' ] && exit 0
exit 1
