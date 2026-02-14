{
  description = "Configuracion NixOS de rimv";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # El nombre "rimv" aqui es el que usas en el comando .#rimv
    nixosConfigurations."rimv" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # Esto jala tu configuration.nix
        ./configuration.nix

        # Esto configura Home Manager dentro de NixOS
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # Esto jala tu home.nix
          home-manager.users.rimv = import ./home.nix;
        }
      ];
    };
  };
}
