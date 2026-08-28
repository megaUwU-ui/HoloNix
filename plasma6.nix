# KDE Plasma desktop environment.

{ config, pkgs, ... }:

{
  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.plasma-login-manager.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect.enable = true;

  # Excluding KDE Plasma applications.
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kwin-x11
    khelpcenter
    elisa
  ];

  # KDE Plasma applications.
  environment.systemPackages = with pkgs.kdePackages; [
    yakuake
  ];

  # Fcitx5 input method framework.

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
    fcitx5-bamboo
    ];
  };

}
