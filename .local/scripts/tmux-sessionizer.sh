#!/bin/bash

path=$(
  find -L ~/Documents ~/Projects -mindepth 1 -maxdepth 4 -type d |
    fzf --print-query \
      --height=15 --layout=reverse --border=sharp \
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
      --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
      --color=border:#b4befe
)

name=$(basename "$path")

if [[ $path == '>'* ]]; then
  # create new project
  path=~/Projects/$(echo $path | tr -d '>')
  name=$(basename "$path")
  mkdir "$path"
elif [[ $path == '<'* ]]; then
  # create new sesion with <name, given, let user select folder form pwd
  name=$(echo "$path" | tr -d '<')

else
  path=$(echo "$path" | tail -n +2)
fi

if ! tmux has-session -t="$name"; then
  tmux new-session -s "$name" -c "$path" -d
fi

tmux switch-client -t "$name"
