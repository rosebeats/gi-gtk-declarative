{ pkgs ? import ../nixpkgs.nix, doBenchmark ? false
, gi-gtk-declarative
}:

let
  lib = import ../lib.nix { inherit pkgs; };
  haskellPackages = pkgs.haskellPackages.override {
    overrides = self: super: {
      gi-gtk-declarative = gi-gtk-declarative;
    };
  };
  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;
  drv = lib.checkWithGtkDeps
    (variant (haskellPackages.callCabal2nix "gi-gtk-declarative-app-simple" ./. {}));
in
{
  gi-gtk-declarative-app-simple = drv;
}
