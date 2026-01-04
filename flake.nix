{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      apps.${system}.default = {
        type = "app";
        program = "${home-manager.packages.${system}.default}/bin/home-manager";
      };
      devShells."x86_64-linux".default = pkgs.mkShell {
        buildInputs = [ home-manager.packages.${system}.default ];
      };
      homeConfigurations."doriath" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit inputs pkgs-unstable;
        };
      };
      # nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      #     # Import the previous configuration.nix we used,
      #     # so the old configuration file still takes effect
      #     ./configuration.nix
      #     # make home-manager as a module of nixos
      #     # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
      #     home-manager.nixosModules.home-manager
      #     {
      #       home-manager.useGlobalPkgs = true;
      #       home-manager.useUserPackages = true;
      #       home-manager.users.doriath = import ./home.nix;
      #       home-manager.extraSpecialArgs = {
      #         inherit inputs;
      #       };
      #     }
      #   ];
      # };
      nixosConfigurations = {
        dellxps13 =
          let
            username = "doriath";
            specialArgs = { inherit username; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            system = "x86_64-linux";
            modules = [
              # Import the previous configuration.nix we used,
              # so the old configuration file still takes effect
              ./hosts/dellxps13/configuration.nix

              # make home-manager as a module of nixos
              # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.doriath = import ./home.nix;
                home-manager.extraSpecialArgs = {
                  inherit inputs pkgs-unstable;
                };
              }
            ];
          };
      };
    };
}
