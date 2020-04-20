#!/bin/bash
set -e -x

# Configure vim
pip3 install black
git clone https://github.com/VundleVim/Vundle.vim.git /home/ubuntu/.vim/bundle/Vundle.vim
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.vimrc -o /home/ubuntu/.vimrc
chown -R ubuntu:ubuntu /home/ubuntu/.vim
chown ubuntu:ubuntu /home/ubuntu/.vimrc
runuser -l  ubuntu -c 'vim +PluginInstall +qall'

# Configure tmux
runuser -l  ubuntu -c 'git clone https://github.com/jimeh/tmux-themepack.git /home/ubuntu/.tmux-themepack'
runuser -l  ubuntu -c 'curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.tmux.conf -o /home/ubuntu/.tmux.conf'
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/start_tmux.sh -o /bin/stm
chmod +x /bin/stm

# Configure bash
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.bash_aliases -o /home/ubuntu/.bash_aliases
chown ubuntu:ubuntu /home/ubuntu/.bash_aliases
echo 'PS1="\W: "' >> /home/ubuntu/.bashrc

# Configure git
# todo: add git template in here for ctags hooks
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.gitconfig -o /home/ubuntu/.gitconfig
chown ubuntu:ubuntu /home/ubuntu/.gitconfig

# Additional packages
apt-get install ctags
apt-get install tree
