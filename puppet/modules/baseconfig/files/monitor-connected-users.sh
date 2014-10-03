#! /bin/bash
# 
# Monitor users logging in and out, and add/remove tmux windows accordingly.

while tmux list-sessions -F '#{session_name}' | grep -q workshop; do
  users_without_windows=$(comm -23 <(who -u | cut -d ' ' -f 1 | grep -v '^vagrant$' | sort) \
                                   <(tmux list-windows -F '#{window_name}' -t workshop | sort))
  
  for user in $users_without_windows; do
    sudo chmod -R a+rw /var/tmux

    tmux new-window -d -t workshop -n "$user" "tmux -S /var/tmux/$user attach -t $user"
    
    # For read-only sessions, use the line below instead
    # tmux new-window -d -t workshop -n $user "tmux -S /var/tmux/$user attach -t $user -r"
  done

  windows_without_users=$(comm -13 <(who -u | cut -d ' ' -f 1 | grep -v '^vagrant$' | sort) \
                                   <(tmux list-windows -F '#{window_name}' -t workshop | grep -v bash | sort))
  for user in $windows_without_users; do
    tmux kill-window -t "$user"
    rm -f /var/tmux/"$user"
  done

  sleep 2
done
