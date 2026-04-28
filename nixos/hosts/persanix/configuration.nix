# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports =
    [
      ../common.nix
      ./hardware-configuration.nix
    ];

  networking = {
    hostName = "persanix";
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };

  # Override bootloader to default to Windows
  boot.loader.grub.default = 2;

  services.xserver = {
    videoDrivers = ["amdgpu"];
  };
}
