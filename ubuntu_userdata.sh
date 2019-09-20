#!/bin/bash
set -e -x
curl -o /home/ubuntu/.tmux.conf https://raw.githubusercontent.com/josiahdavis/aws-reference/master/.tmux.conf
curl -o /home/ubuntu/start_tmux.sh https://raw.githubusercontent.com/josiahdavis/aws-reference/master/start_tmux.sh
