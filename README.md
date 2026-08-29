# ❄️ SteamNix OS ❄️
SteamOS like experience on NixOS. Clean quiet boot like on SteamDeck. Two second shutdown time. Meant for those who primarily use SSH, but would like a SteamOS experience for games. Ditch your expensive laptop and use your gaming PC for VS-Code development! VS-Code server, Docker and libvirt preinstalled.

      
# Download ISO
    https://nixos.org/download/

# Install with liveiso (Use GUI iso)
* Clone repo
    ```
    git clone -b holonix --single-branch https://github.com/megaUwU-ui/HoloNix.git
    cd HoloNix
    ```
* Use Disko to partitions and mount (READ)
    https://github.com/nix-community/disko/blob/master/docs/quickstart.md
    My default is btrfs with subvolumes
* Edit user password in HoloNix/modules/user.nix
    https://wiki.nixos.org/wiki/User_management#User_Password
* Copy all files in HoloNix to /mnt/etc/nixos/
* Complete the NixOS installation (Copy line-by-line)
    ```
    sudo -i
    nix-channel --add https://channels.nixos.org/nixpkgs-unstable
    nix-channel update
    export NIX_CONFIG="experimental-features = flakes"
    nixos-rebuild --switch
    nixos-install --flake /mnt/etc/nixos#nixos
    ```
# Keeping System Up-to-date
```
sudo nix flake update
sudo nixos-rebuild boot
sudo reboot
```
# Notes
* Device config is SteamDeck, for other devices check Jovian-NixOS
    https://github.com/Jovian-Experiments/Jovian-NixOS
* Get ready for hours compiling software and kernel









