# TODO: create user

# Updating packages and installing dependencies for this script
pacman -Syu --needed --noconfirm git stow rust

# installing yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# installing hardware stuff
yay -S --needed --noconfirm intel-ucode nvidia mesa

# installing console experience pack
yay -S --needed --noconfirm zsh grml-zsh-config zsh-syntax-highlighting autojump fzf ripgrep ssh
chsh jlk -s /bin/zsh

# TODO install nmcli and activate service?

# installing graphical user interface
yay -S --needed --noconfirm wayland sway swaylock-blur-bin termite i3blocks redshift-wayland-git dmenu-wayland-git

# installing fonts
yay -S --needed --noconfirm noto-fonts adobe-source-code-pro-fonts

# Neovim
# TODO: install neovim packages here as well
yay -S --needed --noconfirm neovim neovim-plug-git python-neovim-git

# software
yay -S --needed --noconfirm firefox keepassxc

# Development stuff
yay -S --needed --noconfirm base-devel docker docker-compose nodejs npm make

