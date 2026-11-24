#!/bin/sh
# H04: logs start and end of every run, so the reader can tell OVERLAPPING runs from sequential re-runs
echo "start $(date +%s%N)" >> /tmp/l2ct_h04_runs
sleep 3
echo "end $(date +%s%N)" >> /tmp/l2ct_h04_runs
exit 1
