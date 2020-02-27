#!/bin/bash
tmux new-session -s TRAIN -n EDITOR -d
tmux send-keys -t TRAIN:0 'source activate python3' C-m
tmux new-window -n MONITOR -t TRAIN
tmux send-keys -t TRAIN:1 'watch -n0.5 nvidia-smi' C-m
tmux split-window -h -p 60 -t TRAIN:1
tmux new-window -n JUPYTER -t TRAIN
tmux send-keys -t TRAIN:3 'source activate python3' C-m
tmux attach -t TRAIN:0
