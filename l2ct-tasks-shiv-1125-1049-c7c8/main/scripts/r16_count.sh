#!/bin/sh
n=$( { wc -l < /tmp/l2ct_r16_count; } 2>/dev/null | tr -d ' ')
echo "r16 run count: ${n:-missing}"
[ -z "$n" ] && exit 3
[ "$n" -eq 1 ] && exit 0
[ "$n" -gt 1 ] && exit 1
exit 3
