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

# installing hardware stuff
yay -S --needed --noconfirm intel-ucode nvidia mesa

# installing console experience pack
yay -S --needed --noconfirm zsh grml-zsh-config zsh-syntax-highlighting autojump fzf ripgrep ssh
git clone https://github.com/tronje/git-prompt-helper.git
cargo install --path=git-prompt-helper
git clone https://github.com/tronje/dir-prompt-helper.git
cargo install --path=dir-prompt-helper
chsh jlk -s /bin/zsh
stow zsh

# TODO install nmcli and activate service?

# installing graphical user interface
yay -S --needed --noconfirm wayland sway swaylock-blur-bin termite i3blocks redshift-wayland-git dmenu-wayland-git
stow sway termite systemd

# installing fonts
yay -S --needed --noconfirm noto-fonts adobe-source-code-pro-fonts

# Neovim
# TODO: install neovim packages here as well
yay -S --needed --noconfirm neovim neovim-plug-git python-neovim-git
stow nvim

# software
yay -S --needed --noconfirm firefox keepassxc

# Development stuff
yay -S --needed --noconfirm docker docker-compose nodejs npm make pass-git-helper julia
stow julia pass-git-helper

# generate SSH keys
# TODO: dynamic comment with username and host name
ssh-keygen -t rsa -b 4096 -C "email@janlucaklees.de"

