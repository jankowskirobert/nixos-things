{ pkgs, ... }:

let
  claude = pkgs.stdenv.mkDerivation {
    pname = "claude-cli";
    version = "1.0";

    src = pkgs.fetchurl {
      url = "https://example.com/install.sh";
      sha256 = "REAL_HASH";
    };

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
in {
  home.packages = [ claude ];
}
