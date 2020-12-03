#!/bin/bash
tmux new-session -s DEV -n EDITOR -d
tmux send-keys -t DEV:0 'source activate python3' C-m
tmux new-window -n JUPYTER -t DEV
tmux send-keys -t DEV:1 'source activate python3' C-m
tmux send-keys -t DEV:1 'jupyter notebook' C-m
tmux attach -t DEV
