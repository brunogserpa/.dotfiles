{
  inputs,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  home.packages = with pkgs; [
    spotify
    discord
    vesktop
    unzip
    killall
    opera
    jetbrains.clion
    clang
    unstable.neovim
    starship
    barrier
    
    hyprpaper
    waybar
    wl-clipboard
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
    nodejs
    docker-compose
    awscli2

    nerdfonts
    jetbrains-mono
    material-icons
    material-design-icons
    noto-fonts
    papirus-icon-theme
    font-awesome
  ];
}

