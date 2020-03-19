alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias eb="vim ~/.bash_aliases"
alias rb="source ~/.bash_aliases"
alias check_start="vim /var/log/cloud-init-output.log"
alias c='clear'
alias make_ctags='ctags -R -f ./.git/tags .'
alias a='tmux attach'

mcd(){
  mkdir -p $1 && cd $1
}

largest(){
  du -ah $1 | sort -n -r | head -n 20
}

untar(){
  tar zxvf $1 -C $2
}
