{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  programs.alacritty.enable = true;

  # You can import other home-manager modules here
  imports = [
    ./config.nix
    ./packages.nix
  ];

  nixpkgs = {
    overlays = [
    #  outputs.overlays.additions
    #  outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      # allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "persa";
    homeDirectory = "/home/persa";
  };

  #systemd.user.services.notifd = {
  #  Unit = {
  #    Description = "NotifD - Notification Watcher Service";
  #  };

  #  Service = {
  #    ExecStart = "${pkgs.notifd}/bin/notifd run";
  #    KillSignal = "SIGKILL";
  #  };

  #  Install = {
  #    WantedBy = ["default.target"];
  #  };
  #};

  # Enable home-manager and git
  programs.home-manager.enable = true;
  # Nicely reload system units when changing configs
  #systemd.user.startServices = "sd-switch";
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
