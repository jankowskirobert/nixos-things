
{ pkgs ? import <nixpkgs> {} }:

let
  claude = pkgs.stdenv.mkDerivation {
    pname = "claude-cli";
    version = "1.0.0";

    src = ./install.sh;

    nativeBuildInputs = [
      pkgs.bash
      pkgs.git
      pkgs.curl
    ];

    unpackPhase = "true";

    installPhase = ''
      export HOME=$TMPDIR
      mkdir -p $out/bin

      bash $src --prefix=$out
    '';
  };
in
pkgs.mkShell {
  buildInputs = [ claude ];
}
