#!/bin/sh
# D102: ONE script file used by two tasks; each task sets its own L2CT_ID (A passes, B fails)
echo "D102:${L2CT_ID:-unset}" >> /tmp/l2ct_d102
echo "D102 marker: D102:${L2CT_ID:-unset}"
[ "$L2CT_ID" = "A" ]
