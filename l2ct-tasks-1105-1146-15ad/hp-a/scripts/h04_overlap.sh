#!/bin/sh
# exit 0 = no two runs overlapped (0, 1 or several sequential runs); exit 1 = two runs were active at the same time; exit 3 = no log
f=/tmp/l2ct_h04_runs
[ -f "$f" ] || { echo 'h04: no runs file'; exit 3; }
awk '$1=="start"{a++; n++; if(a>1)o=1} $1=="end"{a--} END{print "h04 runs:", n, "overlap:", (o?1:0); exit (o?1:0)}' "$f"
