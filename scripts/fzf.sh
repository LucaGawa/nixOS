#!/usr/bin/env bash


selected_file=$(fzf --preview="bat --color=always --style=plain {}" --bind K:preview-up,J:preview-down --prompt "Please select a file to edit: ")

if [ -n "$selected_file" ]; then
    nvim "$selected_file"
fi


# todo implement them
# hf='history -100 |fzf'
# mpf='cd ~/Videos && mpv "$(fzf)"'
# pf='fzf --preview='\''bat --color=always --style=plain {}'\'' --bind k:preview-up,j:preview-down'
# sqf='sqlite3 "$(fzf --prompt "Please select a database: ")"'
# vf='vim "$(fzf --preview="bat --color=always --style=plain {}" --bind K:preview-up,J:preview-down --prompt "Please select a file to edit: ")"'
