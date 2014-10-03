#! /bin/bash

sudo chmod -R a+rwx /var/tmux

tmux new-session -d -s workshop

tmux bind-key -n PageUp previous-window
tmux bind-key -n PageDown next-window

tmux set-option -g status-fg white
tmux set-option -g status-bg black
tmux set-option -g status-attr default

tmux set-option -g allow-rename off
tmux set-option -g automatic-rename off

tmux set-window-option -g window-status-fg cyan
tmux set-window-option -g window-status-bg default
tmux set-window-option -g window-status-attr dim
 
tmux set-window-option -g window-status-current-fg white
tmux set-window-option -g window-status-current-bg red
tmux set-window-option -g window-status-current-attr bright

tmux set-window-option -g monitor-activity off

./monitor-connected-users.sh &

tmux attach-session -d -t workshop

tmux kill-session -t workshop
