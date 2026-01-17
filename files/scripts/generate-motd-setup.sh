#!/usr/bin/bash
set -eoux pipefail

mkdir -p /usr/share/ublue-os/motd
cat > /usr/share/ublue-os/motd/env.sh << EOF
#!/usr/bin/env sh
# KEEP THIS SMALL
# This will run on every shell that a user starts up.
export MOTD_IMAGE_NAME=$IMAGE_NAME
export MOTD_IMAGE_TAGE=$OS_VERSION
EOF
