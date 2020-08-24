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
	zsh grml-zsh-config zsh-syntax-highlighting autojump fzf ripgrep \
	neovim neovim-plug-git python-pynvim python2-pynvim ruby-neovim nvim-yarp-git

# installing helpers for zsh config
git clone https://github.com/tronje/git-prompt-helper.git
cargo install --path=git-prompt-helper
rm -rf git-prompt-helper
git clone https://github.com/tronje/dir-prompt-helper.git
cargo install --path=dir-prompt-helper
rm -rf dir-prompt-helper

# set the default shell to zsh
chsh jlk -s /bin/zsh
stow zsh

# install configuration
stow terminte nvim

# install nvim plugins
nvim +PlugInstall +qall

