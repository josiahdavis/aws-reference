#!/bin/bash
# Set up git config on a fresh instance

USER=$1
EMAIL=$2

if [ $# -eq 0 ]
  then
    echo "Please supply your username and email address"
    echo "Example: ./setup-git.sh John John@me.com"
fi

git config --global user.name "$USER"
git config --global user.email "$EMAIL"
git config credential.helper "cache --timeout=604800"
git config --global alias.co checkout
git config --global alias.st status
# Reference: 
# https://github.com/verdimrc/pyutil/blob/98e90cd070b46768bbd1280c249641d2c491da8e/sagemaker-notebook/adjust-sm-git.sh#L37
git config --global alias.lol "log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
