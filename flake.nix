{
  description = "Configuracion NixOS de rimv";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gazelle = {
      url = "github:Zeus-Deus/gazelle-tui";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    llm-agents.url = "github:numtide/llm-agents.nix";
    gentleman-dots = {
      url = "github:Gentleman-Programming/Gentleman.Dots/nix-migration";
      flake = false;
    };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];

      flake.nixosConfigurations = let
        hosts = {
          laptop-dell = {
            username = "rimv";
            system = "x86_64-linux";
          };
        };

        mkHost = hostName: {
          username,
          system,
        }:
          inputs.nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {inherit inputs username hostName;};
            modules = [
              {nixpkgs.config.allowUnfree = true;}
              ./hosts/${hostName}/configuration.nix
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  backupFileExtension = "backup";
                  extraSpecialArgs = {inherit inputs username;};
                  users.${username} = import ./hosts/${hostName}/home.nix;
                };
              }
            ];
          };
      in
        inputs.nixpkgs.lib.mapAttrs mkHost hosts;
    };
}
