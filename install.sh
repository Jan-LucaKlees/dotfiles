# Updating packages and installing dependencies for this script
# pacman -Syu --needed --noconfirm base-devel git stow rust go

# Installing xcode in order for brew to work
xcode-select --install

# Install package manager
echo "Installing brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null

# installing all kinds of stuff
echo "Installing packages..."
brew install stow rust go wget
# Console experience pack
brew install zsh zsh-syntax-highlighting autojump fzf ripgrep git-flow-avh
# neovim neovim-plug-git python-pynvim python2-pynvim ruby-neovim nvim-yarp-git
brew install neovim
# Developer experience stuff
brew install nvm

# installingbrew install helpers for zsh config
echo "Installing Tronjes zsh helpers..."
git clone https://github.com/tronje/git-prompt-helper.git
cargo install --path=git-prompt-helper
rm -rf git-prompt-helper
git clone https://github.com/tronje/dir-prompt-helper.git
cargo install --path=dir-prompt-helper
rm -rf dir-prompt-helper

# install zsh grml theme
echo "Installing zsh grml theme..."
wget -O ~/.zshrc.grml https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc

# set the default shell to zsh
echo "Make zsh default shell..."
chsh -s $(which zsh)
stow zsh

# install nvim plugins
# nvim +PlugInstall +qall
stow nvim

# generate SSH keys
# TODO prompt for hostname
# TODO: dynamic comment with username and host name
# ssh-keygen -t rsa -b 4096 -C "email@janlucaklees.de"

