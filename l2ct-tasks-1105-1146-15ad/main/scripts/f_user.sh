#!/bin/sh
u=$(id -un)
echo "f02 user: $u"
[ "$u" = "nobody" ]
