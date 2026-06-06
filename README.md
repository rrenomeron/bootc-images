# Bootc Operating System Images

These are
[Bootable Container](https://developers.redhat.com/articles/2024/09/24/bootc-getting-started-bootable-containers)
 images built with [BlueBuild](https://bulue-build.org)'s tools.  These containers consist of
 various operating systems in the Fedora/RHEL family with my personal preferences baked in.

## Available Images

- [Bluefin](https://projectbluefin.io/) DX (Developer Experience): ``ghcr.io/rrenomeron/bluefin-dx-tr:stable``
- [Bazzite](https://bazzite.gg) DX (Stable branch only): ``ghcr.io/rrenomeron/bazzite-tr``

There are additional recipes for images that are no longer built, but remain in the repo for historical interest.

Non x86-64 architectures are not supported.

## Desktop Image Features

- Google Chrome RPM installed and set as default browser
- Clocks set to AM/PM view with Weekday Display
- Curated selection of Flatpak apps installed automatically
- Single click to open items in Nautilus
- Nautilus icons [match accent
  color](https://extensions.gnome.org/extension/7535/accent-directories/)
- [System monitor applet](https://github.com/mgalgs/gnome-shell-system-monitor-next-applet) in
  top panel next to Gnome system menu
- [DeskChanger](https://github.com/BigE/desk-changer/) wallpaper manager
- [Weather applet](https://gitlab.gnome.org/somepaulo/weather-or-not)
- Use smaller icons in Nautilus icon view
- Sort directories first in Nautilus and GTK file choosers
- Dark styles enabled by default
- [System76 wallpaper collection](https://system76.com/merch/desktop-wallpapers)
- [Framework 12](https://frame.work/laptop12) wallpapers
- [Intel One Mono](https://www.intel.com/content/www/us/en/company-overview/one-monospace-font.html) set as
  default monospace font

### Bluefin Changes & Overrides:

- Starship disabled by default (users can enable if needed)
- Rootful Docker disabled.  Users can set up 
  [rootless Docker](https://docs.docker.com/engine/security/rootless/) for themselves.
- A different list of default flatpaks

### Bazzite Changes & Overrides:

- GNOME desktop with Bluefin mods
- Developer mode enabled (i.e. based on ``bazzite-dx-gnome``)
- Steam does not autostart on login


## Installation

A work in progress.

- Use ``build-iso.sh`` script in this directory, which calls
  [``bootc-image-builder``](https://osbuild.org/docs/bootc/) in an opinionated way (will
  reformat the first disk it sees and install the OS)
- Use Podman Desktop, which allows you to call ``bootc-image-builder`` with different options
- Try methods in the [Fedora/CentOS ``bootc`` documentation](https://docs.fedoraproject.org/en-US/bootc/bare-metal/)

For the Fedora-based images (Silverblue, Bluefin non-LTS, Bazzite), you can do the following:

 - Install any [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) or
  [Universal Blue](https://universal-blue.org) desktop edition that features GNOME
 - Use ``bootc switch`` to switch to the image you want.  For example:
   ```
   sudo bootc switch ghcr.io/rrenomeron/silverblue-tr:stable --enforce-container-sigpolicy
   ```
 - Reboot
   ```
   systemctl reboot
   ```
