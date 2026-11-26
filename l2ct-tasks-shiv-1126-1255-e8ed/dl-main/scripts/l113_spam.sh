#!/bin/sh
# L113: logs start and end of every run, so the reader can tell OVERLAPPING runs from sequential re-runs
echo "start $(date +%s%N)" >> /tmp/l2ct_l113_runs
sleep 2
echo "end $(date +%s%N)" >> /tmp/l2ct_l113_runs
exit 0
