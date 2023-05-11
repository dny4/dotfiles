#!/bin/bash
session_name=$(tmux list-sessions -F \{#S\} | tr -d "{}" | fzf)
tmux switch-client -t $session_name 2> /dev/null
