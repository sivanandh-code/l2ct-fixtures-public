#!/bin/sh
# D101 reader: exit 0 = the marker file is exactly 'D101:Install D101:install'; exit 1 = anything else; exit 3 = no marker file
f=/tmp/l2ct_d101
[ -f "$f" ] || { echo 'D101 reader: no marker file'; exit 3; }
got=$(tr '\n' ' ' < "$f" | sed 's/ *$//')
echo "D101 reader saw: $got"
[ "$got" = 'D101:Install D101:install' ] && exit 0
exit 1
