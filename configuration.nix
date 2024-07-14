{ inputs, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>
    ./nixos/nixos.nix
  ];
}
