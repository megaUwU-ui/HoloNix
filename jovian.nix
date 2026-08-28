# Jovian Experiments
# NixOS on the Steam Deck

{ config, lib, pkgs, ... }:

{
# Jovian NixOS config
  jovian = {
    steam.enable = true;
    steam.autoStart = true;
    steam.desktopSession = "plasma";
    devices.steamdeck.enable = true;
    steamos.useSteamOSConfig = true;
    decky-loader.enable = true;
    decky-loader.user = "deck";
    steam.user = "deck";

  };

  # Enable CEF debugging for decky-loader
  systemd.services.steam-cef-debug = lib.mkIf config.jovian.decky-loader.enable {
    description = "Create Steam CEF debugging file";
    serviceConfig = {
      Type = "oneshot";
      User = config.jovian.steam.user;
      ExecStart = "/bin/sh -c 'mkdir -p ~/.steam/steam && [ ! -f ~/.steam/steam/.cef-enable-remote-debugging ] && touch ~/.steam/steam/.cef-#enable-remote-debugging || true'";
    };
    wantedBy = [ "multi-user.target" ];
  };

}
