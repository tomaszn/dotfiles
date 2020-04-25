#!/bin/bash

set -x

params="-sf"

while getopts "vib" args; do
    case $args in
        v)
            params="$params -v"
            ;;
        i)
            params="$params -i"
            ;;
        b)
            params="$params -b"
            ;;
    esac
done

# Store where the script was called from so we can reference it later
script_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update bash-it if it's already installed or download it if it's not
if [ -d $HOME/.bash_it ]; then
  cd $HOME/.bash_it
  git pull
else
  git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME/.bash_it
fi

# Configure bash-it
bash-it enable plugin alias-completion fzf git man 
bash-it enable completion bash-it git kubectl tmux vault
bash-it enable alias ag docker git vim yarn

# Add our custom aliases to bash-it
ln $params $script_home/custom.aliases.bash $HOME/.bash_it/aliases/custom.aliases.bash
ln $params $script_home/custom.lib.bash $HOME/.bash_it/lib/custom.lib.bash

# Configure vim and neovim
mkdir ~/.vim/
ln $params $script_home/vimrc $HOME/.vim/vimrc
mkdir -p ~/.config/
ln $params $HOME/.vim ~/.config/nvim
ln $params $HOME/.vim/vimrc $HOME/.vim/init.vim
pip3 install --user --upgrade neovim  # python for YouCompleteMe

# Add solarized colors for vim if not present
if [ ! -f $HOME/.vim/colors/solarized.vim ]; then
    curl -fLo $HOME/.vim/colors/solarized.vim --create-dirs \
    https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
fi

# configure tmux with plugins
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true

# Symlink all of our dotfiles to the home directory
for i in .dircolors .bashrc .bash_profile .bash_darwin .tmux.conf;
do
  ln $params $script_home/$i $HOME/$i
done
