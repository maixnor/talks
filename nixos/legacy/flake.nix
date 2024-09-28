{
  description = "Development shell for a legacy Java 8 and PostgreSQL 8.4.22 project";

  inputs = {
    # nixpkgs from 2021-05-03
    nixpkgs.url = "nixpkgs/nixos-20.03"; # Older Nixpkgs for compatibility
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs { inherit system; };

    # We need to build PostgreSQL 8.4 from source since it's deprecated
    postgres84 = pkgs.stdenv.mkDerivation rec {
      pname = "postgresql";
      version = "8.4.22";

      src = pkgs.fetchurl {
        url = "https://ftp.postgresql.org/pub/source/v${version}/postgresql-${version}.tar.bz2";
        sha256 = "sha256-XB1WzndEhwbZ3QOyiWrxnZqxubjc25bDlwfHRnXKOCY=";
      };

      nativeBuildInputs = [ pkgs.bison pkgs.flex ];
      buildInputs = [ pkgs.zlib ];

      configureFlags = [ 
        # without openssl, did not get that to build
        # "--with-openssl"
        "--with-zlib" 
        "--without-readline" 
      ];

      installPhase = ''
        make install DESTDIR=$out
      '';
    };

  in {
    devShells.default = pkgs.mkShell {
      packages = [
        pkgs.jdk8 # Old Java 8
        pkgs.postgresql95
        postgres84 # Custom built PostgreSQL 8.4.22
      ];

      shellHook = ''
        export JAVA_HOME=${pkgs.jdk8}/lib/openjdk
        export PATH=${postgres84}/bin:$PATH
        echo "Development shell loaded with Java 8 and PostgreSQL 8.4.22"
      '';
    };
  });
}

