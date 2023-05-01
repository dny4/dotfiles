#!/bin/bash

session=$(find -L ~/Documents/ ~/Backup/ ~/Projects -mindepth 1 -maxdepth 2 -type d | fzf)

session_name=$(basename "$session" | tr . _)

command tmux
if ! tmux has-session -t="$session_name" 2> /dev/null; then
    tmux new-session -ds "$session_name" -c "$session" -d
fi

tmux switch-client -t "$session_name" 2> /dev/null 
