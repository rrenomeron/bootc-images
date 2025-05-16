#/usr/bin/bash

# This hot-patches (cringe!) the xdg-icon-resource command in order to work around
# https://issues.redhat.com/browse/RHEL-72199 until we can get a patched 
# xdg-utils into stream 10.

set -eou pipefail

patch /usr/bin/xdg-icon-resource << "END_PATCH"
981c981
<   path="$(xdg_realpath "$1")" 2> /dev/null` # Normalize path
---
>   path="$(xdg_realpath "$1")" 2> /dev/null # Normalize path
END_PATCH