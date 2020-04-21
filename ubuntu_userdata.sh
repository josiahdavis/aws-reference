#!/bin/bash
set -e -x

# Download and link dot files
runuser -l ubuntu -c 'git clone https://github.com/josiahdavis/dotfiles.git /home/ubuntu/dotfiles'
runuser -l ubuntu -c 'bash /home/ubuntu/dotfiles/link_dot.sh'

# Configure vim
pip3 install black
runuser -l ubuntu -c 'git clone https://github.com/VundleVim/Vundle.vim.git /home/ubuntu/.vim/bundle/Vundle.vim'
runuser -l  ubuntu -c 'vim +PluginInstall +qall'

# Configure tmux
runuser -l  ubuntu -c 'git clone https://github.com/jimeh/tmux-themepack.git /home/ubuntu/.tmux-themepack'
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/start_tmux.sh -o /bin/stm
chmod +x /bin/stm

apt-get update
apt-get install -y ctags
