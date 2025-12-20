{ pkgs ? import ./nixpkgs.nix, doBenchmark ? true, doCheck ? true }:
let
  fontsConf = pkgs.makeFontsConf {
    fontDirectories = [ pkgs.cantarell-fonts ];
  };
  haskellPackages = pkgs.haskellPackages;
  project = import ./. { inherit doBenchmark doCheck pkgs; };
in
  haskellPackages.shellFor {
    withHoogle = true;
    packages = p: [
      project.gi-gtk-declarative
      project.gi-gtk-declarative-app-simple
      project.examples
    ];
    buildInputs = [
      project.docs
      pkgs.cabal-install
      haskellPackages.haskell-language-server
    ];
    FONTCONFIG_FILE = fontsConf;
  }
