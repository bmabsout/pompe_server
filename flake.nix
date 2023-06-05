{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-23.05;
  inputs.disko.url = github:nix-community/disko;
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, disko, ... }@attrs: {
    nixosConfigurations.pompe = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = attrs;
      modules = [
        ./hardware-configuration.nix
        ./configuration.txt
        ({modulesPath, ... }: {
          imports = [
            disko.nixosModules.disko
          ];
          disko.devices = import ./disk.nix {
            lib = nixpkgs.lib;
          };
        })
      ];
    };
  };
}
