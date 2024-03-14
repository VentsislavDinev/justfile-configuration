{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11"; # Dependency on the Nixpkgs repository from GitHub
    flake-parts.url = "github:hercules-ci/flake-parts"; # Dependency on the flake-parts repository from GitHub
  };

  # Define the outputs of the flake as function that:
  # * given an attribute set containing the outputs of each of the input flakes keyed by their identifier
  # * yields the an attribute set containing the outputs of this flake
  outputs = inputs @ {
    #
    nixpkgs,
    flake-parts,
    # Use more inputs if necessary
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      ###Create a flake with parts from flake-parts library
      systems = ["x86_64-linux"]; ###Define the systems supported by this flake
      perSystem = {pkgs, ...}: {
        ###Define configurations per system
        devShells.default = import ./shell.nix {pkgs = pkgs;}; ###Define a default devShell pointing to shell.nix
        ####Additional per system configurations if any
      };
      flake = {
        nixosConfigurations.my-nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [./configuration.nix];
        };
      };
    };
}
