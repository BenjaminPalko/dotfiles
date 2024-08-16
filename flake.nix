{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { home-manager, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "benjamin";
      hostname = "nixos";
    in
    {
      # nixos config
      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit hostname;
        };
        modules = [
          ./nixos/nixos.nix
          home-manager.nixosModules.home-manager
          { networking.hostName = "${hostname}"; }
        ];
      };
    };
}
