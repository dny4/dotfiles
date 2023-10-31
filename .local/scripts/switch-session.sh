#!/bin/bash
session_name=$(
	tmux list-sessions -F \{#S\} |
		tr -d "{}" |
		fzf \
			--height=15 --layout=reverse --border=sharp \
			--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#ff7b72 \
			--color=fg:#cdd6f4,header:#ff7b72,info:#cba6f7,pointer:#f5e0dc \
			--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#ff7b72 \
			--color=border:#b4befe
)

tmux switch-client -t $session_name 2>/dev/null
