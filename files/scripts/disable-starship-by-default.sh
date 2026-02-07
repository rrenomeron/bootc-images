#!/usr/bin/bash

set -eou pipefail

STARSHIP_ENABLE_SCRIPT=/etc/profile.d/90-bluefin-starship.sh 

echo "Removing default Starship prompt"

if [ -f $STARSHIP_ENABLE_SCRIPT ]; then
    rm $STARSHIP_ENABLE_SCRIPT
fi