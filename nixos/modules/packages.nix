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
    vesktop
    teams-for-linux
    slack
    firefox
    opera
    barrier

    unzip
    killall
    stylua
    nodePackages.prettier
    
    hyprpaper
    waybar
    wl-clipboard
    grim
    slurp
    htop
    lshw
    xwaylandvideobridge
    ffmpeg
    xdg-desktop-portal-hyprland
    starship

    pulseaudio
    pamixer
    pavucontrol
    alsa-utils

    unstable.neovim
    jetbrains.clion
    vscode
    nodejs
    docker-compose
    awscli2
    clang

    nerdfonts
    jetbrains-mono
    material-icons
    material-design-icons
    noto-fonts
    papirus-icon-theme
    font-awesome

    (let
      python3-with-packages = pkgs.python3.withPackages (p:
        with p; [
          pip
        ]);
    in
      python3-with-packages)
  ];
}

