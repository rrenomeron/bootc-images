#/usr/bin/bash

# This hot-patches (cringe!) the xdg-icon-resource command in order to work around
# https://issues.redhat.com/browse/RHEL-72199 until we can get a patched 
# xdg-utils into stream 10.

set -eou pipefail

# The AlmaLinux atomic desktop doesn't include xdg-utils,
# but Chrome itself pulls it in.  Therefore we have to install
# it manually if it's not there and patch it before we try
# to install Chrome.

if [ ! -f /usr/bin/xdg-icon-resource ]; then
    dnf install -y xdg-utils
fi

patch /usr/bin/xdg-icon-resource << "END_PATCH"
981c981
<   path="$(xdg_realpath "$1")" 2> /dev/null` # Normalize path
---
>   path="$(xdg_realpath "$1")" 2> /dev/null # Normalize path
END_PATCH