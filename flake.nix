{
  description = "Nixos config flake";

  inputs = {
    # nixpkgs.url = "github:lilyinstarlight/nixpkgs/tmp/cosmic";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
			devShells.x86_64-linux.default = pkgs.mkShell {
				nativeBuidInputs = with pkgs; [
					nixd
					lua-language-server
					nixpkgs-fmt
				];
			};
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
    };
}
