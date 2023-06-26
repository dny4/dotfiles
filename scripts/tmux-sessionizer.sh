#!/bin/bash

session=$(find -L ~/Documents  ~/Projects -mindepth 1 -maxdepth 1 -type d | fzf --print-query)

if [[ $session == '>'* ]]; then
    session=~/Projects/$(echo $session | tr -d '>')
    mkdir $session
else 
    session=$(echo "$session" | tail -n +2)
fi

session_name=$(basename "$session" | tr . _)

if ! tmux has-session -t="$session_name" 2> /dev/null; then
    tmux new-session -s "$session_name" -c "$session" -d
fi

tmux switch-client -t "$session_name" 2> /dev/null 
