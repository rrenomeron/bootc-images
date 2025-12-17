#!/bin/bash

# This adds the key from https://github.com/rrenomeron/ublue-tr
# as a valid sigstore signing key for our image, so we can trust builds
# from that repository too.
#
# Remove 90 days after ublue-tr is not longer producing builds,
# and its builds are no longer available on ghcr

set -eou pipefail

if [ "$IMAGE_NAME" ~= "bluefin-dx-tr" ||  "$IMAGE_NAME" == "bazzite-tr" ]; then
    echo "Updating Container Policy for $IMAGE_NAME"
    jq  -f $(dirname "$0")/add-bootc-images-sigstore-key-$IMAGE_NAME.jq \
        /etc/containers/policy.json > /tmp/policy.json
    cp /tmp/policy.json /etc/containers/policy.json
else
    echo "Not updating container policy for $IMAGE_NAME"
fi