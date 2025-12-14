{ pkgs ? import ../nixpkgs.nix }:
pkgs.python3.withPackages (ps: with ps; [
  flit-core
  mkdocs
  mkdocs-material
  pygments
])
