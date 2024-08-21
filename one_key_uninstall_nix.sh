#!/usr/bin/env bash

# ref: https://nix.dev/manual/nix/2.18/installation/uninstall

# if [ -f "" ]; then

# 1. put the backups back in place:
if [ -f "/etc/zshrc.backup-before-nix" ]; then
    sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
fi
if [ -f "/etc/bashrc.backup-before-nix" ]; then
    sudo mv /etc/bashrc.backup-before-nix /etc/bashrc
fi
if [ -f "/etc/bash.bashrc.backup-before-nix" ]; then
    sudo mv /etc/bash.bashrc.backup-before-nix /etc/bash.bashrc
fi

# 2. Stop and remove the Nix daemon services:
if [ -f "/Library/LaunchDaemons/org.nixos.nix-daemon.plist" ]; then
    sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist
    sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
fi
if [ -f "/Library/LaunchDaemons/org.nixos.darwin-store.plist" ]; then
    sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist
    sudo rm /Library/LaunchDaemons/org.nixos.darwin-store.plist
fi

# 3. Remove the nixbld group and the _nixbuildN users:
sudo dscl . -delete /Groups/nixbld
for u in $(sudo dscl . -list /Users | grep _nixbld); do sudo dscl . -delete /Users/$u; done

# 4. Edit fstab using sudo vifs to remove the line mounting the Nix Store volume on /nix, which looks like UUID=<uuid> /nix apfs rw,noauto,nobrowse,suid,owners or LABEL=Nix\040Store /nix apfs rw,nobrowse. This will prevent automatic mounting of the Nix Store volume.
sudo vifs

# 5. Edit /etc/synthetic.conf to remove the nix line. If this is the only line in the file you can remove it entirely, sudo rm /etc/synthetic.conf. This will prevent the creation of the empty /nix directory to provide a mountpoint for the Nix Store volume.
if [ -f "/etc/synthetic.conf" ]; then
    sudo rm /etc/synthetic.conf
fi

# 6. Remove the files Nix added to your system:
sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels

# 7. Remove the Nix Store volume:
sudo diskutil apfs deleteVolume /nix

# 8. Uninstall Nix:
# If you have a single-user installation of Nix, uninstall it by running:
sudo rm -rf /nix


