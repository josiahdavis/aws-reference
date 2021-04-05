#!/bin/bash
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

# Source repos
declare -a packs=(
    "https://github.com/itchyny/lightline.vim.git"
    "https://github.com/morhetz/gruvbox.git"
    "https://github.com/tpope/vim-commentary.git"
    "https://github.com/preservim/nerdtree.git"
)

# Pattern to get the package name
#    \/                   Search for '/'
#      ([a-z\.\-]*)       Capture 'a-z', '.' or '-'
#                  \.git  Search for exact match '.git'
pat="\/([a-z\.\-]*)\.git" 
for pack in "${packs[@]}"; do
    [[ $pack =~ $pat ]] # $pat must be unquoted
    echo "Checking ${BASH_REMATCH[1]}..."
    # Clone repo if doesn't exist locally
    if [ ! -d /tmp/${BASH_REMATCH[1]} ]; then
        git clone --depth 1 ${pack} /tmp/${BASH_REMATCH[1]}
        transfer="Y"
    else
        # If repo exists locally, ask whether you would like to transfer it to 
        # remote instance 
        echo "/tmp/${BASH_REMATCH[1]} already exists. Skipping download." 
        echo "Would you like to transfer ${BASH_REMATCH[1]} to your instance (Y/N)?"
        read transfer
        while [ $transfer != "Y" ] && [ $transfer != "N" ]; do
            echo "Input needs to be 'Y' 'N', please try again!"
            read transfer
        done
    fi
    # Transfer repo to remote instance
    if [ $transfer == "Y" ]; then
        scp -r /tmp/${BASH_REMATCH[1]} ${inst}:~/.vim/pack/vendor/start/
    fi
done 

echo "Process completed successfully."
echo "You may need to perform some manual steps on the EC2 instance."
echo "mv .vim/pack/vendor/start/{lightline.vim,lightline}"
