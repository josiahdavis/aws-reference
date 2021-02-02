#!/bin/bash
tmux new-session -s DEV -n EDITOR -d
tmux send-keys -t DEV:0 'source activate python3' C-m
tmux split-window -v -p 30 -t DEV:0
tmux attach -t DEV
