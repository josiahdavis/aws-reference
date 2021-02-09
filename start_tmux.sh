#!/bin/bash
# Checks whether a tmux session is present.
# If not, it creates one for you with the options provided.
# 
# Example usage:
#   ./stm.sh    # single window with two panes, one for editing code, one for execution.
#   ./stm.sh -j # two windows, the second one for a jupyter notebook.
#   ./stm.sh -m # two windows, the second one for monitoring with htop.
#   ./stm.sh -j -m # three windows, see above

tmux has-session -t DEV 2>/dev/null
if [ "$?" -eq 1 ] ; then
    # No session found
    echo "Starting tmux session $@"
    COUNT=1
    tmux new-session -s DEV -n DEV -d
    tmux send-keys -t DEV:0 'source activate python3' C-m
    tmux split-window -v -p 30 -t DEV:0
    tmux send-keys -t DEV:0.1 'source activate python3' C-m

    for i in "$@"; do
        case $i in 
        "-j" )
            tmux new-window -n JUPYTER -t DEV:${COUNT}
            tmux send-keys -t DEV:${COUNT} 'source activate python3' C-m
            tmux send-keys -t DEV:${COUNT} 'jupyter notebook' C-m
            ;;
        "-m" )
            tmux new-window -n MONITOR -t DEV:${COUNT}
            tmux send-keys -t DEV:${COUNT} 'htop' C-m
            ;;
        "-n" )
            tmux new-window -n MONITOR -t DEV:${COUNT}
            tmux send-keys -t DEV:${COUNT} 'watch -n0.5 nvidia-smi' C-m
            tmux split-window -v -p 60 -t DEV:${COUNT}
            tmux send-keys -t DEV:${COUNT}.1 'htop' C-m
            ;;
        *) echo "The option $i is not supported"
        esac
        let COUNT=$COUNT+1
    done
fi
tmux attach -t DEV:0
