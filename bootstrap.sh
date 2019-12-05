#!/usr/bin/env bash

# cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

# function doIt() {
#     # rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
#     #     --exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
#     source ~/.bash_profile;
# }

# if [ "$1" == "--force" -o "$1" == "-f" ]; then
#     doIt;
# else
#     read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
#     echo "";
#     if [[ $REPLY =~ ^[Yy]$ ]]; then
#         doIt;
#     fi;
# fi;
# unset doIt;

set -e

# setup hostname
# sudo scutil --set LocalHostName hk-mba

# setup dotfiles
cp .bash_profile .bashrc ~/

# init git
cp .gitconfig ~/.gitconfig


#### After brew
# make zsh default
sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./zsh/gentoo_minimal.zsh-theme ~/.oh-my-zsh/themes/
cp ./zsh/.zshrc ~/
source ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# link to vscode
mkdir -p ~/Applications/
sudo ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code

cp .vimrc ~/
cp -r .vim ~/