# User

{ config, pkgs, ... }:

{

  # Define a user account. Don't forget to set a password with https://wiki.nixos.org/wiki/User_management#User_Password.
  users.users."deck" = {
    isNormalUser = true;
    description = "deck";
    hashedPassword = "$y$j9T$ZNVqwOtvAy2l1LFM2kkH10$uF/ozROPiAkJK0jBL5xMrcyqXFla6SYQyhbYMNYx/DC";
    extraGroups = [ "networkmanager" "wheel" "podman" ];
    packages = with pkgs; [
    # kdePackages.kate
    #  thunderbird
    android-tools
    scrcpy
    spicetify-cli
    element-desktop
    qbittorrent
    vlc
    libreoffice-qt
    github-desktop
    suwayomi
    ];
  };

  nixpkgs.config.packageOverrides = pkgs: {
    suwayomi = pkgs.callPackage ./my-pkgs/suwayomi.nix { };
  };

  # Fish shell
  programs.fish.enable = true;
  users.extraUsers."deck" = {
    shell = pkgs.fish;
  };

}
