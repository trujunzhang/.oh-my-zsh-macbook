
# https://nixos.org/manual/nix/stable/installation/installation.html
 bash <(curl -L https://nixos.org/nix/install) --daemon


# I will:

#  - make sure your computer doesn't already have Nix files
#    (if it does, I will tell you how to clean them up.)
#  - create local users (see the list above for the users I'll make)
#  - create a local group (nixbld)
#  - install Nix in to /nix
#  - create a configuration file in /etc/nix
#  - set up the "default profile" by creating some Nix-related files in
#    /var/root
#  - back up /etc/bashrc to /etc/bashrc.backup-before-nix
#  - update /etc/bashrc to include some Nix configuration
#  - back up /etc/zshrc to /etc/zshrc.backup-before-nix
#  - update /etc/zshrc to include some Nix configuration
#  - back up /etc/bash.bashrc to /etc/bash.bashrc.backup-before-nix
#  - update /etc/bash.bashrc to include some Nix configuration
#  - create a Nix volume and a LaunchDaemon to mount it
#  - create a LaunchDaemon (at /Library/LaunchDaemons/org.nixos.nix-daemon.plist) for nix-daemon

# sudo launchctl kickstart -k system/org.nixos.darwin-store

# 4. Delete the files Nix added to your system:

#   sudo rm -rf "/etc/nix" "/nix" "/var/root/.nix-profile" "/var/root/.nix-defexpr" "/var/root/.nix-channels" "/var/root/.local/state/nix" "/var/root/.cache/nix" "/Volumes/MacUser/djzhang/.nix-profile" "/Volumes/MacUser/djzhang/.nix-defexpr" "/Volumes/MacUser/djzhang/.nix-channels" "/Volumes/MacUser/djzhang/.local/state/nix" "/Volumes/MacUser/djzhang/.cache/nix"

# and that is it.


# Try it! Open a new terminal, and type:

#   $ nix-shell -p nix-info --run "nix-info -m"

# Thank you for using this installer. If you have any feedback or need
# help, don't hesitate:

# You can open an issue at
# https://github.com/NixOS/nix/issues/new?labels=installer&template=installer.md

# Or get in touch with the community: https://nixos.org/community



# Here's how to clean up the old backup file:

# 1. Back up (copy) /etc/bashrc and /etc/bashrc.backup-before-nix
#    to another location, just in case.

# 2. Ensure /etc/bashrc.backup-before-nix does not have anything
#    Nix-related in it. If it does, something is probably quite
#    wrong. Please open an issue or get in touch immediately.

# 3. Once you confirm /etc/bashrc is backed up and
#    /etc/bashrc.backup-before-nix doesn't mention Nix, run:
#    mv /etc/bashrc.backup-before-nix /etc/bashrc


# error: file 'nixpkgs' was not found in the nix search path (add it using $nix_path or -i)
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update --verbose

echo $NIX_PATH
nix --version



