# Updating packages and installing dependencies for this script
pacman -Syu --needed --noconfirm base-devel git stow rust go

# TODO prompt for hostname

# create group
groupadd wheel

# create user
useradd -m -G wheel jlk
cd /home/jlk

# add myself to sudoers
echo 'jlk  ALL=(ALL:ALL) ALL' >> /etc/sudoers

# installing yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# installing all kinds of stuff
yay -S --needed --noconfirm \
	# Drivers
	intel-ucode nvidia mesa \
	# Network
	networkmanager
	# Audio
	pulseaudio pulseaudio-alsa pamixer
	# Console experience pack
	zsh grml-zsh-config zsh-syntax-highlighting autojump fzf ripgrep ssh gitflow-avh gitflow-zshcompletion-avh
	# Desktop environment
	wayland sway swaylock-blur-bin termite i3blocks redshift-wayland-git dmenu-wayland-git
	# Fonts
	# TODO: Japanese Symbols, Emoji and other symbols
	noto-fonts adobe-source-code-pro-fonts ttf-font-awesome
	# Editor
	# TODO: install packages here as well
	neovim neovim-plug-git python-neovim-git
	# Software
	firefox keepassxc
	# Devlopment tools
	base-devel docker docker-compose nodejs npm make pass-git-helper julia

# installing helpers for zsh config
git clone https://github.com/tronje/git-prompt-helper.git
cargo install --path=git-prompt-helper
git clone https://github.com/tronje/dir-prompt-helper.git
cargo install --path=dir-prompt-helper

# set the default shell to zsh
chsh jlk -s /bin/zsh
stow zsh

# activate networkmanager service
systemctl enable NetworkManager

# install configuration
stow sway termite systemd nvim julia pass-git-helper

# generate SSH keys
# TODO: dynamic comment with username and host name
ssh-keygen -t rsa -b 4096 -C "email@janlucaklees.de"

