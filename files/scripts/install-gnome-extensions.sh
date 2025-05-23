#!/usr/bin/bash
# Get the Accent Icons extension to allow Nautilus icons to follow the Gnome
# accent color

# See https://github.com/taiwbi/gnome-accent-directories

function install_extension() {
    if [ -z "$1" ]; then
        echo "No extension named"
        exit 1
    fi 
    if [ -z "$2" ]; then
        echo "No extension version"
        exit 1
    fi
    EXTENSION_ID=$1
    EXTENSION_VERSION=$2

    echo "Downloading $EXTENSION_ID Version $EXTENSION_VERSION"
    EXTENSION_URL_NAME=${EXTENSION_ID//@}
    DOWNLOAD_URL=https://extensions.gnome.org/extension-data/$EXTENSION_URL_NAME.v$EXTENSION_VERSION.shell-extension.zip
    echo "Downloading from $DOWNLOAD_URL"
    curl -L  $DOWNLOAD_URL \
        > /tmp/extension.zip

    EXTENSION_DIR=/usr/share/gnome-shell/extensions/$EXTENSION_ID
    mkdir -p $EXTENSION_DIR && cd $EXTENSION_DIR
    unzip /tmp/extension.zip
    rm /tmp/extension.zip

    # The metadata.json is stored in the zip with access mode 600 for some reason
    chmod ugo+r $EXTENSION_DIR/metadata.json
}
set -eou pipefail

. /etc/os-release

if [[ $VERSION_ID == 9* ]]; then
    install_extension system-monitor-next@paradoxxx.zero.gmail.com 55
    install_extension blur-my-shell@aunetx 29
    install_extension desk-changer@eric.gach.gmail.com 25
    install_extension dash-to-dock@micxgx.gmail.com 84

elif [[ $VERSION_ID == 10* ]]; then
    install_extension system-monitor-next@paradoxxx.zero.gmail.com 80
fi

