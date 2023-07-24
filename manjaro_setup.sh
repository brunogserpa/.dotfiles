# Fix dual boot clock
timedatectl set-local-rtc 1 --adjust-system-clock

# Install apps
pacman -Syu
pacman -S opera
	hyprland 
	hyprpaper   # wallpaper
	rofi        # app launcher
    alacritty   # terminal
    sddm        # window manager (login)
    waybar      # status bar
    grim        # screenshot
    slurp       # select region to screenshot
    unzip
    docker
    snap
    yay

# Enable sddm to substitute default i3
systemctl enable sddm --force

# Start and enable docker
systemctl start docker.service
systemctl enable docker.service

# Enable snap
systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# Install snap packages
snap install clion --classic

# Install Yay packages
yay -S teams

# Change bash to zsh
chsh -s /bin/zsh

# Create Repo directories
cd ~/
mkdir Repo && cd Repo
mkdir Pvt && mkdir OptimumG && mkdir tmp

# install AWS CLI
cd tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm -rf aws
rm awscliv2.zip
usermod -a -G docker ec2-user # Set ec2-user to run docker commands without sudo

# Set Up AWS
aws configure
docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 276193334308.dkr.ecr.us-east-1.amazonaws.com

# Set Up Git
git config --global user.name "Bruno Serpa"
git config --global user.email "brunogserpa@gmail.com"

# Ssh setup
ssh-keygen -t ed25519 -C "brunogserpa@gmail.com"
cat ~/.ssh/id_ed25519.pub
