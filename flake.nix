{
  description = "NixOS on the Steam Deck";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  inputs.disko = {
    url = "github:nix-community/disko/latest";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, chaotic, disko, ... }:
    let
      inherit (chaotic.vendored) jovian;
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            jovian.nixosModules.default
            chaotic.nixosModules.default
            disko.nixosModules.disko
          ];
        };
      };
    };
}
