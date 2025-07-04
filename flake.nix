{
  description = "ESP-IDF development environment with ESP Zigbee SDK";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs-esp-dev.url = "github:mirrexagon/nixpkgs-esp-dev";
  };

  outputs = { self, nixpkgs, flake-utils, nixpkgs-esp-dev }:
    flake-utils.lib.eachDefaultSystem (system:

      {
        # Default shell is ESP32-C6
        devShells.default = nixpkgs-esp-dev.devShells.${system}.esp32c6-idf;
        
        # Expose other ESP chip variants for convenience
        devShells.esp32 = nixpkgs-esp-dev.devShells.${system}.esp32-idf;
        devShells.esp32c3 = nixpkgs-esp-dev.devShells.${system}.esp32c3-idf;
        devShells.esp32s2 = nixpkgs-esp-dev.devShells.${system}.esp32s2-idf;
        devShells.esp32s3 = nixpkgs-esp-dev.devShells.${system}.esp32s3-idf;
        devShells.esp32c6 = nixpkgs-esp-dev.devShells.${system}.esp32c6-idf;
        devShells.esp32h2 = nixpkgs-esp-dev.devShells.${system}.esp32h2-idf;
        devShells.full = nixpkgs-esp-dev.devShells.${system}.esp-idf-full;
      });
}
