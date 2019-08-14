# TODO: create user

# Updating packages and installing dependencies for this script
pacman -Syu --needed --noconfirm git stow rust

# installing yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
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
	zsh grml-zsh-config zsh-syntax-highlighting autojump fzf ripgrep ssh
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
	base-devel docker docker-compose nodejs npm make

# set the default shell to zsh
chsh jlk -s /bin/zsh

# activate networkmanager service
systemctl enable NetworkManager

