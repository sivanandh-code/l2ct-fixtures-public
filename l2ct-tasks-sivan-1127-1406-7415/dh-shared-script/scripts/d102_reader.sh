#!/bin/sh
# D102 reader: exit 0 = the marker file is exactly 'D102:A D102:B'; exit 1 = anything else; exit 3 = no marker file
f=/tmp/l2ct_d102
[ -f "$f" ] || { echo 'D102 reader: no marker file'; exit 3; }
got=$(tr '\n' ' ' < "$f" | sed 's/ *$//')
echo "D102 reader saw: $got"
[ "$got" = 'D102:A D102:B' ] && exit 0
exit 1
