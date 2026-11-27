#!/bin/sh
if [ -s /tmp/l2ct_r11_count ]; then echo 'r11 counter present'; exit 0; fi
echo 'r11 counter missing or empty'
exit 1
