# Enterprise Linux Bootc Images

These are Enterprise Linux (EL)
[``bootc``](https://developers.redhat.com/articles/2024/09/24/bootc-getting-started-bootable-containers) container images meant to be deployed on VMs or bare metal.  They are currently focused on
the desktop/workstation use case, but we might expand into server use cases at some other point.

While EL itself is stable, these images are still under development. Be on the lookout for problems.

## Features

- Installed on image:
    - Google Chrome
    - Visual Studio Code
    - Docker (Rootful Docker disabled by default)
    - Cockpit
    - Libvirt

- GNOME UI Fixes inspired by [Bluefin](https://projectbluefin.io)
    - Maximize/Minimize buttons enabled
    - Dash To Dock, App Indicators, Blur My Shell, GNOME Tweaks installed on image
    - Clocks set to AM/PM with weekday display
    - Nautilus: single click to open, smaller icons, full delete and symlink creation enabled
    - Intel One Mono as default monospace font, Cascadia Code available

## Supported Distributions

- AlmaLinux 9.6
- AlmaLinux Kitten 10 (will switch to AlmaLinux 10.x when released)
- CentOS Stream 9
- CentOS Stream 10
- [Bluefin LTS](https://docs.projectbluefin.io/lts/)

Non x86-64 architectures are not supported.

EL 9 might be supported until 2032, but its desktop is a little long in the tooth.  It's 
likely we'll drop AlmaLinux 9 and Centos Stream 9 in the near future.  Preliminary testing
shows that doing a ``bootc swtich`` to an EL 10 image "just works". (!)

## Installation

A work in progress.  Some options:

- Use Podman Desktop to create an (non-interactive) Anaconda disk
- Use
  [``bootc-image-builder``](https://github.com/osbuild/bootc-image-builder/blob/main/README.md)
  which is what Podman desktop does behind the scenes anyway (see ``build-vm-disk.sh`` for some
  marginally workable ideas)
- Try methods in the [Fedora/CentOS ``bootc`` documentation](https://docs.fedoraproject.org/en-US/bootc/bare-metal/)

## TODO:

- Test applications installed by RPMs to see if they actually work
- Fully [refactor recipes in terms of "features"](https://github.com/rrenomeron/ublue-tr/commit/59c87c711777aa29a8939d88ebd4320b4e6998bc)
- Create installer ISOs using [Titanboa](https://github.com/ublue-os/titanboa) and
  [Readymade](https://github.com/FyraLabs/readymade)
- Figure out how to support different sets of default flatpaks on the same image
  for different desktop use cases (e.g. home, work, digitial artist, writer)
- Headless server use cases
- Include Universal Blue "batteries"
- Figure out auditd service fails on EL 9
