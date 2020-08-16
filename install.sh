# Updating packages and installing dependencies for this script
# pacman -Syu --needed --noconfirm base-devel git stow rust go

# Installing xcode in order for brew to work
xcode-select --install

# Install package manager
echo "Installing brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null

# installing all kinds of stuff
echo "Installing packages..."
brew install stow rust go wget python cmake \
  # Console experience pack
  zsh zsh-syntax-highlighting autojump fzf ripgrep git-flow-avh fortune
  # neovim neovim-plug-git python-pynvim python2-pynvim ruby-neovim nvim-yarp-git
  neovim
  # Developer experience stuff
  nvm

# installingbrew install helpers for zsh config
echo "Installing Tronjes zsh helpers..."
# Git Prompt Helper
git clone https://github.com/tronje/git-prompt-helper.git
cargo install --path=git-prompt-helper
rm -rf git-prompt-helper
# Dir Prompt Helper
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

# Make nvim work
# Installing Vim Plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install python support for nvim
/usr/local/bin/pip install neovim
/usr/local/bin/pip install --upgrade neovim
# Install config
stow nvim
# Install plugins
nvim +PlugInstall +qall

# generate SSH keys
# TODO prompt for hostname
# TODO: dynamic comment with username and host name
# ssh-keygen -t rsa -b 4096 -C "email@janlucaklees.de"

