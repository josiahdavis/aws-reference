#!/bin/bash
tmux new-session -s TRAIN -n editor -d
tmux split-window -v -p 40 -t TRAIN
tmux split-window -h -p 55 -t TRAIN:0.1
tmux send-keys -t TRAIN:0.1 'watch -n0.5 nvidia-smi' C-m
tmux attach -t TRAIN:0.0
