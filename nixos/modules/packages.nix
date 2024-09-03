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
    jetbrains.clion
    clang
    unstable.neovim
    
    hyprpaper
    waybar
    wl-clipboard
    rofi
    grim
    slurp
    htop
    xwaylandvideobridge
    ffmpeg
    xdg-desktop-portal-hyprland

    pulseaudio
    pamixer
    pavucontrol
    alsa-utils

    vscode
    docker-compose
  ];
}

