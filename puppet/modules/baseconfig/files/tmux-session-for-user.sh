#! /bin/bash
#
# Starts a new tmux session running docker-exercises-sandbox.sh. The session uses the socket
# /var/tmux/$USER.

tmux -S /var/tmux/$(whoami) new -s $(whoami) /home/vagrant/docker-exercises-sandbox.sh
