#!/bin/bash
set -ex
# Download vim plugins and transfer to EC2 instance.
# Requirements: 
#   EC2 has scp access and is aliased in ~/.ssh/config
#   There is a dir on EC2 ~/.vim/pack/vendor/start
# 
# Sources: 
#   Regex in bash: https://riptutorial.com/bash/example/19469/regex-matching

inst=$1 # the EC2 instance alias (e.g. dlami)

if [ -z ${inst+x} ]; then 
    echo "EC2 instance is unset, please specify."
    exit 1
fi


declare -a packs=(
    "https://github.com/morhetz/gruvbox.git"
    "https://github.com/tpope/vim-commentary.git"
    "https://github.com/preservim/nerdtree.git"
)

pat="\/([a-z\-]*)\.git"
for pack in "${packs[@]}"; do
    [[ $pack =~ $pat ]] # $pat must be unquoted
    echo "Transferring ${BASH_REMATCH[1]} to ${inst}"
    git clone --depth 1 ${pack} /tmp/${BASH_REMATCH[1]}
    scp -r /tmp/${BASH_REMATCH[1]} ${inst}:~/.vim/pack/vendor/start/
done 
