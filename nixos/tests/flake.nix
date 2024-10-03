{
  description = "A flake with a simple NixOS server-client VM test";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs { inherit system; };
  in {
    # Here we define the NixOS tests
    nixosModules.hello-world-server = import ./vm-test.nix;

    # Allow running the test via `nix flake check`
    checks = {
      server-client-test = import ./vm-test.nix pkgs;
    };

    # Optionally, provide a development shell for working on the flake
    devShells.default = pkgs.mkShell {
      buildInputs = [ pkgs.curl ];
    };
  });
}
