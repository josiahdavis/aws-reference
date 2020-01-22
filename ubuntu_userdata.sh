#!/bin/bash
set -e -x

# Configure tmux
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.tmux.conf -o /home/ubuntu/.tmux.conf
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/start_tmux.sh -o /bin/start_tmux
chmod +x /bin/start_tmux

# Configure vim
pip3 install black
git clone https://github.com/VundleVim/Vundle.vim.git /home/ubuntu/.vim/bundle/Vundle.vim
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.vimrc -o /home/ubuntu/.vimrc
chown -R ubuntu:ubuntu /home/ubuntu/.vim
chown ubuntu:ubuntu /home/ubuntu/.vimrc
runuser -l  ubuntu -c 'vim +PluginInstall +qall'

# Configure bash
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.bash_aliases -o /home/ubuntu/.bash_aliases
echo 'PS1="\W: "' >> /home/ubuntu/.bashrc

# Additional packages
apt install ctags
apt install ack
apt install tree
