#! /bin/bash
#
# Runs a Docker container from the image shared_terminal_workshops/sandbox.

tmux -S /var/tmux/"$USER" unbind-key -a

tmux -S /var/tmux/"$USER" set-option -q -g status off

cd /home/vagrant/exercises-sandbox

umask 0000

if [ ! -d exercises-"$USER" ]; then
  cp -r exercises exercises-"$USER"
  find exercises-"$USER" -name "*.sh" | xargs --no-run-if-empty chmod a+x
fi

docker run -t -i --rm -v "$PWD"/exercises-"$USER":/home/dev/exercises --name="$USER" \
  shared_terminal_workshops/sandbox su - dev
