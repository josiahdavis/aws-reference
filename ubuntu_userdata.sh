#!/bin/bash
set -e -x

# Download and link dot files
runuser -l ubuntu -c 'git clone https://github.com/josiahdavis/dotfiles.git $HOME/dotfiles'
runuser -l ubuntu -c 'bash $HOME/dotfiles/link_dot.sh'

# Configure vim
pip3 install black
runuser -l ubuntu -c 'git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim'
runuser -l  ubuntu -c 'vim +PluginInstall +qall'

# Configure tmux
runuser -l  ubuntu -c 'git clone https://github.com/jimeh/tmux-themepack.git $HOME/.tmux-themepack'
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/start_tmux.sh -o /bin/stm
chmod +x /bin/stm

apt-get update
apt-get install -y ctags
