#!/bin/bash

code $(find ~/ ~/Documents/ ~/Backup ~/Backup/Metamorphoziz/ ~/Projects -mindepth 1 -maxdepth 1 -type d | fzf)
echo "ok"
