{ inputs, ... }:
{
  perSystem =
    { system, ... }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };
    in
    {
      devShells.android = pkgs.mkShell {
        packages = with pkgs; [
          android-studio
          android-tools
          jdk17
        ];
      };
    };

  den.default.nixos = { user, ... }: {
    # Enable KVM for hardware-accelerated Android emulators
    users.users.${user.name}.extraGroups = [
      "kvm"
      "adbusers"
    ];

    # Ports for external tooling
    networking.firewall.allowedTCPPorts = [
      8081 # Expo Go
    ];
  };
}
