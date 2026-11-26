#!/bin/sh
n=$( { wc -l < /tmp/l2ct_r11_count; } 2>/dev/null | tr -d ' ')
echo "r11 check run count: ${n:-missing}"
[ "${n:-0}" -gt 1 ] 2>/dev/null && exit 1
exit 0
