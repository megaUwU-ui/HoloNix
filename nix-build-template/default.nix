# nix-build -A test

let
    pkgs = import <nixpkgs> { };
in
{
    test = pkgs.callPackage ./test.nix { };
}
