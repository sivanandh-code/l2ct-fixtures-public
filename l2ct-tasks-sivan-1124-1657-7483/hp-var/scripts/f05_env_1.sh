#!/bin/sh
[ "${L2CT_ENV+set}" = set ] || { echo 'f05: variable not set'; exit 1; }
[ "$L2CT_ENV" = '' ]
