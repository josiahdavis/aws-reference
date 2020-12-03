#!/bin/bash
set -e -x

# Download and link dot files
runuser -l ec2-user -c 'git clone https://github.com/josiahdavis/dotfiles.git $HOME/dotfiles'
runuser -l ec2-user -c 'bash $HOME/dotfiles/link_dot.sh'

# Configure vim
pip3 install black
runuser -l ec2-user -c 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
runuser -l  ec2-user -c 'vim +PlugInstall +qall'

# Configure tmux
runuser -l  ec2-user -c 'git clone https://github.com/jimeh/tmux-themepack.git $HOME/.tmux-themepack'
curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/start_tmux.sh -o /bin/stm
chmod +x /bin/stm

