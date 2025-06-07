#/usr/bin/bash

set -eo pipefail

if [ -z "$1" ]; then
    echo "Usage:"
    echo "build_vm_disk.sh IMAGE [CONFIG] [OUTPUT_DIR]"
    exit 1
fi
BOOTC_IMAGE=$1
IMAGE_NAME=${BOOTC_IMAGE%:*}
TAG=${BOOTC_IMAGE#*:}
IMAGE_CONFIG=${2:-./config.toml}
OUTPUT_DIR=${3:-./builder-output/$IMAGE_NAME}

if [ ! -d $OUTPUT_DIR ]; then
    mkdir -p $OUTPUT_DIR
fi

# Run bootc-image-builder
sudo podman run --rm --tty --privileged --security-opt label=type:unconfined_t \
    -v $OUTPUT_DIR:/output/ \
    -v /var/lib/containers/storage:/var/lib/containers/storage \
    -v $IMAGE_CONFIG:/config.toml:ro \
    --label bootc.image-builder=true \
    quay.io/centos-bootc/bootc-image-builder:latest \
    $BOOTC_IMAGE \
    --output /output \
    --progress term \
    --type anaconda-iso \
    --target-arch amd64 \
    --rootfs xfs \
    --chown $UID:$UID