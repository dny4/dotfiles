#!/usr/bin/bash
#
mkdir "$1"/frontend "$1"/backend 2>/dev/null
tmux new-window -c "$1"/frontend -n frontend
tmux new-window -c "$1"/frontend -n fe
tmux new-window -c "$1"/backend -n backend
tmux new-window -c "$1"/backend -n be
