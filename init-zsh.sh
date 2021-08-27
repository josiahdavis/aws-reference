#!/bin/bash
# Setting up an Amazon Linux 2 Instance with the Deep Learning AMI with zsh shell
# Run as root:
# sudo bash init-zsh.sh

setup_zsh () {

    echo "SETTING UP ZSH..."
    local DIR=/home/ec2-user
    yum -y update && yum -y install zsh
    # Install oh-my-zsh
    wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O $DIR/install.sh
    chown -R ec2-user:ec2-user $DIR/install.sh
    cd $DIR
    echo pwd
    runuser -l ec2-user 'install.sh'
    # Change the default shell to zsh
    yum -y install util-linux-user
    chsh -s /bin/zsh ec2-user
    # Add conda to end of zshrc
    echo "source ~/.dlamirc" >> $DIR/.zshrc

}

setup_zsh
