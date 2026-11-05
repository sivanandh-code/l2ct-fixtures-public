#!/bin/sh
g=$(id -gn)
echo "f03 group: $g"
[ "$g" = "daemon" ]
