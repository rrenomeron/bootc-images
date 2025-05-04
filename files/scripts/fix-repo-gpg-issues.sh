#!/bin/bash

set -oue pipefail 

# We need to download and install the Google signing keys separately, we can't trust
# rpm-ostree (or dnf, apparently) to do it cleanly from the yum repo directly.
# Possibly related to https://github.com/rpm-software-management/rpm/issues/2577

echo "Downloading Google Signing Key"
curl https://dl.google.com/linux/linux_signing_key.pub > /tmp/linux_signing_key.pub

rpm --import /tmp/linux_signing_key.pub
