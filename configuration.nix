{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModule
    ./hardware-configuration.nix
    ./programs
    ./system
  ];

  environment.systemPackages = with pkgs; [
    vscode
    librewolf
    kate
    latte-dock
    discord
    wget
    element-desktop
    libimobiledevice
    tldr
    ark
    file
    gcc
    jetbrains.rider
    bat
  ];

  services.usbmuxd.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  fonts.fonts = with pkgs; [
    fira-code
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
