# Enterprise Linux Bootc Images

These are Enterprise Linux (EL)
[``bootc``](https://developers.redhat.com/articles/2024/09/24/bootc-getting-started-bootable-containers) container images meant to be deployed on VMs or bare metal.  They are currently focused on
the desktop/workstation use case, although there is currently an experimental server base image.

While EL itself is stable, these images are still under development. Be on the lookout for problems.

## Desktop Features

- Installed on image:
    - Google Chrome
    - Visual Studio Code
    - Docker (Rootful Docker disabled by default)
    - Cockpit
    - Libvirt

- GNOME UI Fixes inspired by [Bluefin](https://projectbluefin.io)
    - Maximize/Minimize buttons enabled
    - Dash To Dock, App Indicators, Blur My Shell, GNOME Tweaks installed on image
    - Logo Menu on CentOS Stream 10
    - Clocks set to AM/PM with weekday display
    - Nautilus: single click to open, smaller icons, full delete and symlink creation enabled
    - [Intel One Mono](https://www.intel.com/content/www/us/en/company-overview/one-monospace-font.html) as default monospace font, [Cascadia Code](https://learn.microsoft.com/en-us/windows/terminal/cascadia-code) available

## Supported Distributions

- AlmaLinux 10.1
- CentOS Stream 10
- [Bluefin LTS](https://docs.projectbluefin.io/lts/)

Non x86-64 architectures are not supported.

## Installation

A work in progress.  Some options:

- Use ``build-iso.sh`` script in this directory, which calls
  [``bootc-image-builder``](https://osbuild.org/docs/bootc/) in an opinionated way (will
  reformat the first disk it sees and install the OS)
- Use Podman Desktop, which allows you to call ``bootc-image-builder`` with different options
- Try methods in the [Fedora/CentOS ``bootc`` documentation](https://docs.fedoraproject.org/en-US/bootc/bare-metal/)

## TODO:

- Test applications installed by RPMs to see if they actually work
- Fully [refactor recipes in terms of
  "features"](https://github.com/rrenomeron/ublue-tr/commit/59c87c711777aa29a8939d88ebd4320b4e6998bc)
- Review CentOS Stream 10 workstation base image layer efficiency after a few updates
- Add workstation base image version in ``/etc/os-release``
- Create installer ISOs using [Titanboa](https://github.com/ublue-os/titanboa) and
  [Readymade](https://github.com/FyraLabs/readymade)

