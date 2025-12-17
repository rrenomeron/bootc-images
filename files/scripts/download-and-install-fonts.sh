#!/bin/bash

set -euo pipefail

if ! rpm -q cascadia-code-fonts; then
    CASCADIA_CODE_VERSION=2407.24
    echo "Downloading Cascadia Code fonts from Github Releases"
    curl -L https://github.com/microsoft/cascadia-code/releases/download/v$CASCADIA_CODE_VERSION/CascadiaCode-$CASCADIA_CODE_VERSION.zip > /tmp/cascadia-code.zip
    mkdir -p /tmp/cascadia-code && cd /tmp/cascadia-code
    unzip /tmp/cascadia-code.zip
    echo "Installing Cascadia Code Fonts"
    mkdir -p /usr/share/fonts/cascadia-code-fonts
    rsync -av otf/static/ /usr/share/fonts/cascadia-code-fonts
    fc-cache -f /usr/share/fonts/cascadia-code-fonts
else
    echo "Cascadia Code fonts installed by RPM, skipping ..."
fi

if ! rpm -q intel-one-mono-fonts; then
INTEL_ONE_MONO_VERSION=1.4.0
    echo "Downloading Intel One Mono fonts from Github Releases"
    curl -L https://github.com/intel/intel-one-mono/releases/download/V$INTEL_ONE_MONO_VERSION/otf.zip > /tmp/intel-one-mono.zip
    mkdir -p /tmp/intel-one-mono && cd /tmp/intel-one-mono
    unzip /tmp/intel-one-mono.zip
    echo "Installing Intel One Mono Fonts"
    mkdir -p /usr/share/fonts/intel-one-mono
    rsync -av otf/ /usr/share/fonts/intel-one-mono
    fc-cache -f /usr/share/fonts/intel-one-mono
else
    echo "Intel One Mono fonts installed by RPM, skipping ..."
fi

fc-cache --system-only --really-force --verbose