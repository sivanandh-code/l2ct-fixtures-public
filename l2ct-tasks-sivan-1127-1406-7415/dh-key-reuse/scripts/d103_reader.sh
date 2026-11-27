#!/bin/sh
# D103 reader: exit 0 = the marker file is exactly 'D103:a D103:b'; exit 1 = anything else; exit 3 = no marker file
f=/tmp/l2ct_d103
[ -f "$f" ] || { echo 'D103 reader: no marker file'; exit 3; }
got=$(tr '\n' ' ' < "$f" | sed 's/ *$//')
echo "D103 reader saw: $got"
[ "$got" = 'D103:a D103:b' ] && exit 0
exit 1
