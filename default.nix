{ pkgs ? import ./nixpkgs.nix, doBenchmark ? false, doCheck ? false }:
rec {
  docs = import ./docs/requirements.nix { inherit pkgs; };
  gi-gtk-declarative = (import ./gi-gtk-declarative { inherit doBenchmark doCheck pkgs; }).gi-gtk-declarative;
  gi-gtk-declarative-app-simple = (import ./gi-gtk-declarative-app-simple { inherit doBenchmark gi-gtk-declarative pkgs; }).gi-gtk-declarative-app-simple;
  examples = (import ./examples { inherit doBenchmark gi-gtk-declarative gi-gtk-declarative-app-simple pkgs; }).examples;
}
