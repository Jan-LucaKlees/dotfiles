# Updating packages and installing dependencies for this script
pacman -Syu --needed --noconfirm git stow

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
	# Console experience pack
	zsh manjaro-zsh-config autojump fzf ripgrep ssh
	# Editor
	neovim neovim-plug-git python-pynvim python2-pynvim ruby-neovim nvim-yarp-git
	# Software
	firefox keepassxc
	# Devlopment tools
	base-devel docker docker-compose nodejs npm make julia

# Install zsh
chsh jlk -s /bin/zsh
stow zsh

# Install nvim
stow nvim
nvim +PlugInstall +qall

# generate SSH keys
ssh-keygen -t ed25519 -a 512 -C "email@janlucaklees.de"

