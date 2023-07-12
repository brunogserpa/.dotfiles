sudo pacman -S hyprland
    cargo
    sddm
    xdg-desktop-portal-hyprland
    gtk3 
    gtk-layer-shell
    pango 
    cairo 
    glib2 
    gcc-libs 
    glibc
    pkg-config
    hyprpaper
    grim
    slurp

yay -S eww-wayland ttf-ubuntu-nerd socat jq acpi inotify-tools\
  bluez pavucontrol brightnessctl playerctl nm-connection-editor imagemagick \
  gjs gnome-bluetooth-3.0 upower networkmanager gtk3 \
  wl-gammactl wlsunset wl-clipboard hyprpicker hyprshot blueberry \
  polkit-gnome

systemctl enable sddm

git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
