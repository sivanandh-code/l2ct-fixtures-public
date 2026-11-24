#!/bin/sh
n=$( { wc -l < /tmp/l2ct_walk_count; } 2>/dev/null | tr -d ' ')
echo "walk run count: ${n:-missing} (allowed 1)"
[ -z "$n" ] && exit 3
[ "$n" -le 1 ] && exit 0
[ "$n" -gt 1 ] && exit 1
exit 3
