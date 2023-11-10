#!/usr/bin/bash
#
mkdir frontend backend 2>/dev/null
tmux new-window -c frontend -n frontend
tmux new-window -c frontend -n fe
tmux new-window -c backend -n backend
tmux new-window -c backend -n be
