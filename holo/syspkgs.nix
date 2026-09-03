# List packages installed in system profile. To search, run:
# $ nix search wget

{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Enable AppImages
  programs.appimage = {
    enable = true;
    binfmt = true;
    package = pkgs.appimage-run.override
    {
      extraPkgs = pkgs:
        [
          pkgs.icu
          pkgs.libxcrypt-legacy
        ];
    };
  };

  # Firefox
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  fish
  git
  fastfetch
  btop
  jre
  python3
  cloudflare-warp
  ];
}
