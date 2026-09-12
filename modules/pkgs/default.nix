{ config, pkgs, ... }:

{

  nixpkgs.config.packageOverrides = pkgs: {
    #suwayomi = pkgs.callPackage ./suwayomi.nix { };
    xdman = pkgs.callPackage ./xdman.nix { };
    syncyomi = pkgs.callPackage ./syncyomi.nix { };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    helium
    #spun
    #suwayomi
    syncyomi
    xdman
  ];

}
