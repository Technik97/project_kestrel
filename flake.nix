{
  description = "Rust dev environment with Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ rust-overlay.overlays.default ];
        };

        rustToolchain = pkgs.rust-bin.stable.latest.default;
        
      in {
        devShells.default = with pkgs; mkShell {
          buildInputs = [
            rustToolchain
            rust-analyzer
            pkg-config
          ];

          MSG = "Welcome to Dev Environment !!";
          shellHook = ''
            echo $MSG
            cargo --version
          '';
        };
      });
}
