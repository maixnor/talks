{
  description = "Nix development environments for legacy JavaFX and bleeding-edge Spring Boot";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        legacy_maven = "3.3.9";
      in {
        devShells = {
          # Legacy JavaFX project using Java 8
          legacy = pkgs.mkShell {
            buildInputs = [
              # Old Java 8 with JavaFX support
              pkgs.jdk8

              # Fetching and installing Maven 3.3.9 manually
              (pkgs.stdenv.mkDerivation {
                pname = "maven";
                version = legacy_maven;
                src = pkgs.fetchurl {
                  url = "https://archive.apache.org/dist/maven/maven-3/${legacy_maven}/binaries/apache-maven-${legacy_maven}-bin.tar.gz";
                  sha256 = "sha256-bj6clJq0aVogT3QDhxeqeyaJsb6Uh1iZrBs/5CgA/4I=";
                };
                nativeBuildInputs = [ pkgs.unzip ];

                installPhase = ''
                  mkdir -p $out
                  cp -r * $out
                '';

                # Setting up Maven in PATH
                meta = with pkgs.lib; {
                  description = "Apache Maven 3.3.9";
                  license = licenses.asl20;
                };
              })
            ];
                       # Setting JAVA_HOME to Java 8
            shellHook = ''
              export JAVA_HOME=${pkgs.jdk8}/lib/openjdk;
              echo "Legacy JavaFX environment with Java 8 and Maven 3.3.9 ready!"
            '';
          };

          # Bleeding-edge Spring Boot project using the latest JDK and Maven
          spring = pkgs.mkShell {
            buildInputs = [
              # Latest stable 
              pkgs.jdk22

              # Latest Maven version from the Nixpkgs
              pkgs.maven

              # Latest Spring Boot CLI (optional)
              pkgs.spring-boot
            ];

            # Setting JAVA_HOME to the latest JDK
            shellHook = ''
              export JAVA_HOME=${pkgs.jdk22}/lib/openjdk;
              echo "Bleeding-edge Spring Boot environment with JDK 22 and latest Maven ready!"
            '';
          };
        };
      });
}

