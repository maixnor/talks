{ pkgs ? import <nixpkgs> {}, ... }:

pkgs.testers.runNixOSTest {
  name = "server-client-test";

  nodes = {
    # Define the server node
    server = {
      networking.firewall.allowedTCPPorts = [ 80 ];  # Open HTTP port
      services.nginx = {
        enable = true;
        virtualHosts."server" = {};
      };
    };

    # Define the client node
    client = { config, pkgs, ... }: {
      environment.systemPackages = with pkgs; [ curl ];

      ## env variable
      environment.sessionVariables = {
        TEST_URL = "http://server/";
      };

      # Create the shell script that performs the curl request
      environment.etc."test-curl.sh".text = ''
        #!/bin/sh
        # Fail if TEST_URL is not set
        if [ -z "$TEST_URL" ]; then
          echo "TEST_URL environment variable is not set"
          exit 1
        fi

        # Perform the curl request and check response
        curl $TEST_URL | grep 'Welcome to nginx'
      '';
      
      # Ensure the script is executable
      system.activationScripts.makeCurlExecutable = ''
        chmod +x /etc/test-curl.sh
      '';
    };
  };

  testScript = ''
    # Start the VMs
    server.wait_for_unit("default.target")
    client.wait_for_unit("default.target")

    # Ensure the server is up and running
    server.wait_for_unit("nginx");

    # Set the TEST_URL environment variable in the client
    client.succeed("export TEST_URL=http://server");

    # Execute the shell script on the client
    client.succeed("sh /etc/test-curl.sh");
  '';
}

