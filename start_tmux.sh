#!/bin/bash
tmux new-session -s TRAIN -n editor -d
tmux split-window -v -p 40 -t TRAIN
tmux split-window -h -p 65 -t TRAIN:0.0
tmux split-window -h -p 65 -t TRAIN:0.2
tmux send-keys -t TRAIN:0.2 'watch -n0.5 nvidia-smi' C-m
tmux send-keys -t TRAIN:0.3 'htop' C-m
tmux new-window -n console -t TRAIN
tmux attach -t TRAIN:0.0
