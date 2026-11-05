#!/bin/sh
echo "f05 env: ${L2CT_ENV:-unset}"
[ "$L2CT_ENV" = "l2ct-value" ]
