#!/bin/bash
set -e -x
sudo apt-get install ctags
curl -o /home/ubuntu/.tmux.conf https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.tmux.conf
curl -o /home/ubuntu/start_tmux.sh https://raw.githubusercontent.com/josiahdavis/aws-reference/master/start_tmux.sh
pip3 install black
git clone https://github.com/VundleVim/Vundle.vim.git /home/ubuntu/.vim/bundle/Vundle.vim
curl -o /home/ubuntu/.vimrc https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.vimrc
chown -R ubuntu:ubuntu /home/ubuntu/.vim
chown ubuntu:ubuntu /home/ubuntu/.vimrc
runuser -l  ubuntu -c 'vim +PluginInstall +qall'
