# AlmaLinux/Universal Blue Bootc Images

These are
[``bootc``](https://developers.redhat.com/articles/2024/09/24/bootc-getting-started-bootable-containers)
container images meant to be deployed on VMs or bare metal.  

## Available Images

- AlmaLinux 10.1
  - Desktop: ``ghcr.io/rrenomeron/almalinux-bootc-workstation-tr``
  - Server: ``ghcr.io/rrenomeron/almalinux-bootc-server-tr``
- [Bluefin DX](https://docs.projectbluefin.io/lts/)
  - LTS: ``ghcr.io/rrenomeron/bluefin-dx-tr:lts``
  - Stable: ``ghcr.io/rrenomeron/bluefin-dx-tr:stable``
  - GTS: ``ghcr.io/rrenomeron/bluefin-dx-tr:gts``
- [Bazzite](https://bazzite.gg) DX (Stable branch only): ``ghcr.io/rrenomeron/bazzite-tr``
- Fedora Silverblue (43 only): ``ghcr.io/rrenomeron/silverblue-tr``

Non x86-64 architectures are not supported.

## Desktop Image Features

- Google Chrome RPM installed and set as default browser
- [Variety](https://peterlevi.com/variety/) wallpaper changer (except for Bluefin LTS & AlmaLinux)
- Clocks set to AM/PM view with Weekday Display
- Curated selection of Flatpak apps installed automatically at runtime (this overrides Bluefin's
  default flatpak choices)
- Single click to open items in Nautilus
- Use smaller icons in Nautilus icon view
- Sort directories first in Nautilus and GTK file choosers
- Dark styles enabled by default
- [System76 wallpaper collection](https://system76.com/merch/desktop-wallpapers)
- [Framework 12](https://frame.work/laptop12) wallpapers
- Historical Ubuntu wallpapers, mostly from the LTS versions
- [Intel One Mono](https://www.intel.com/content/www/us/en/company-overview/one-monospace-font.html) set as
  default monospace font

Bluefin Changes & Overrides:

- Starship disabled by default (users can enable if needed)
- Rootful Docker disabled.  Users can set up 
  [rootless Docker](https://docs.docker.com/engine/security/rootless/) for themselves.
- A different list of default flatpaks

Bazzite Changes & Overrides:

- GNOME desktop with simliar UI to the other images
- Developer mode enabled (i.e. based on ``bazzite-dx-gnome``)
- Steam does not autostart on login

Silverblue/AlmaLinux Changes & Overrides:

- Visual Studio Code RPM installed
- Libvirt/Virt-Manager installed on host
- Docker CE installed with rootful Docker disabled
- Dash-to-Dock enabled by default, skipping Overview on login
- Appindicators enabled by default
- Logo Menu enabled by default (like Bluefin)
- Windows have minimize and maximize buttons (like Ubuntu and Bluefin)
- Additional packages (e.g. Firewall GUI, rclone/restic, Universal Blue enhancements)
- ``<CTRL><ALT>t`` opens a terminal
    
## Server Image Features

- All the advantages of atomic updates
- Docker (Rootful Docker disabled by default)
- Cockpit

## Installation

A work in progress.  Some options:

- Use ``build-iso.sh`` script in this directory, which calls
  [``bootc-image-builder``](https://osbuild.org/docs/bootc/) in an opinionated way (will
  reformat the first disk it sees and install the OS)
- Use Podman Desktop, which allows you to call ``bootc-image-builder`` with different options
- Try methods in the [Fedora/CentOS ``bootc`` documentation](https://docs.fedoraproject.org/en-US/bootc/bare-metal/)

## TODO:

- Create installer ISOs using [Titanboa](https://github.com/ublue-os/titanboa) and
  [Readymade](https://github.com/FyraLabs/readymade)
- Refactor recipies for further efficiency
- Figure out how to use renovate to start builds when base images change

