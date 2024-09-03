{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    spotify
    discord
    vesktop
    unzip
    killall
    opera
    docker
    teams
    jetbrains.clion

    hyprpaper
    waybar
    wl-clipboard
    grim
    slurp
    htop
    xwaylandvideobridge
    ffmpeg
    xdg-dektop-portal-hyprland

    pulseaudio
    pamixer
    pavucontrol
    alsa-utils

    vscode
    docker-compose
  ];
}

