{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  inputs.disko.url = github:nix-community/disko;
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, disko, ... }@attrs: {
    nixosConfigurations.freedom = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = attrs;
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
        ./wireguard.nix
        ./fish.nix
        disko.nixosModules.disko
        (import ./disk.nix {})
      ];
    };
  };
}
