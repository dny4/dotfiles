export ZSH="$HOME/.oh-my-zsh"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

################################################################################

alias wt="ps -x | grep waydroid"
alias ws="sudo waydroid session stop && sudo systemctl stop waydroid-container.service"
alias wr="sudo waydroid session stop && sudo systemctl restart waydroid-container.service"

alias tk="tmux kill-server"
alias ta="tmux attach"
alias ts="tmux ls"
alias tw="tmux neww"
alias trw="tmux rename-window"

# mkself 
function note() {
  d=$(date +%F)
  file=$HOME/Projects/mkself/daily-logs/2024/$d.md
  time=$(date +%H:%M" "%p)
  head="---\nauthor: Dnyaneshwar\ndate: $d\ntags:\n  - six\n---\n\n**$time**\n"

  if [ -f "$file" ]; then
    echo "\n---\n**$time**\n" >> "$file"
  else
    echo "$head" > "$file"
  fi

  nvim "$file"
}

################################################################################

export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
#export RUSTC_WRAPPER=s"$HOME/.cargo/bin/sccache"
export PATH="/squashfs-root/usr/bin/:$PATH"

set -o vi;
export VISUAL=nvim;
export EDITOR=nvim;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export DENO_INSTALL="/home/dny4/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#ff7b72 \
--color=fg:#cdd6f4,header:#ff7b72,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#ff7b72 \
--color=border:#b4befe \
--layout=reverse --border=sharp \
--height=15"



################################################################################
#start tmux default session, if there is not one already

if [ -z "$TMUX" ]
then 
    if [ ! $(tmux has-session -t="base" 2> /dev/null) ]
    then
      tmux new-session -s "base" -d 2> /dev/null
    fi
fi

################################################################################

function _ranger() {
    ranger $1 --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=`cat $HOME/.rangerdir`
    cd "$LASTDIR"
    zle reset-prompt
}
zle -N _ranger
bindkey '^j' _ranger

function _tmux_session {
  bash ~/.local/scripts/tmux-sessionizer.sh
  zle reset-prompt
}
zle -N _tmux_session
bindkey "^f" _tmux_session

function ses() {
  target=$(find $(pwd) -depth -mindepth 1 -maxdepth 5 -type d | fzf)
  tmux new-session -s "$1" -c "$target" -d
  tmux switch-client -t "$1"
  echo "switched to $1"
}

lfcd(){
  lf
  DIR=$(cat ~/.lfdir)
  cd $DIR
  zle reset-prompt
}
zle -N lfcd
bindkey '^k' lfcd

# colorful manpages
man() {
    env \
    LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
    LESS_TERMCAP_md="$(printf "\e[1;31m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[1;4;34m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[1;32m")" \
    man "${@}"
}

book() {
  file="$(find ~/Courses ~/Downloads ~/Documents ~/Projects -regextype posix-extended -regex '.*\.(epub|pdf)$' | fzf)"
  if [[ $file ]]; then
    xdg-open "$file" 2>/dev/null
  fi
  zle reset-prompt
}
zle -N book
bindkey '^b' book

# play single video with mpv
fm(){
  vod="$(find ~/Courses ~/Videos ~/Downloads -regex ".*\.\(mkv\|mp4\)" | fzf)"
  if [[ $vod ]]; then
    mpv "$vod" 1>/dev/null 2>/dev/null &;
    echo -e "Playing...\n$vod";
  fi
  zle reset-prompt
}
zle -N fm
bindkey '^v' fm

# play folder with mpv 
ffm() {
  vod="$(find ~/Courses ~/Videos ~/Downloads -type d | fzf)"
  if [[ $vod ]]; then
    mpv "$vod" 1>/dev/null 2>/dev/null &;
    echo -e "Playing...\n$vod"
  fi
  zle reset-prompt
}

run_script() {
  # sh $(gum file ~/.local/scripts/)
  sh ~/.local/scripts/$(ls ~/.local/scripts | gum filter --height 20 --indicator=">")
  zle reset-prompt
}
zle -N run_script
bindkey '^s' run_script

editor() {
  nvim
  zle reset-prompt
}
zle -N editor
bindkey '^e' editor

################################################################################

eval "$(starship init zsh)"

################################################################################

PATH="/home/dny4/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/dny4/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dny4/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dny4/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dny4/perl5"; export PERL_MM_OPT;
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

export PATH="$HOME/.config/composer/vendor/bin:$PATH"

alias six="kitty --detach --hold nvim /home/dny4/Projects/mkself/challenges/self.transformation/six-months-form-june-24.md"
alias note="six && note"
alias kd='kitty --detach "$PWD"'

alias tn='nvim ~/Documents/"$(date +%F)".md'
export PATH=/home/dny4/.config/composer/vendor/bin:/home/dny4/.rbenv/plugins/ruby-build/bin:/home/dny4/.rbenv/shims:/home/dny4/.rbenv/bin:/home/dny4/perl5/bin:/home/dny4/.deno/bin:/home/dny4/.nvm/versions/node/v20.10.0/bin:/squashfs-root/usr/bin/:/home/dny4/.cargo/bin/:/home/dny4/.local/scripts/:/home/dny4/.local/bin/:/home/dny4/.local/kitty.app/bin:/home/dny4/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/dny4/.local/share/tj-nvim/lazy/fzf/bin:/usr/local/go/bin:/home/dny4/go/bin:/opt/nvim-linux64/bin
eval #compdef sqlite-utils

_sqlite_utils_completion() {
    local -a completions
    local -a completions_with_descriptions
    local -a response
    (( ! $+commands[sqlite-utils] )) && return 1

    response=("${(@f)$(env COMP_WORDS="${words[*]}" COMP_CWORD=$((CURRENT-1)) _SQLITE_UTILS_COMPLETE=zsh_complete sqlite-utils)}")

    for type key descr in ${response}; do
        if [[ "$type" == "plain" ]]; then
            if [[ "$descr" == "_" ]]; then
                completions+=("$key")
            else
                completions_with_descriptions+=("$key":"$descr")
            fi
        elif [[ "$type" == "dir" ]]; then
            _path_files -/
        elif [[ "$type" == "file" ]]; then
            _path_files -f
        fi
    done

    if [ -n "$completions_with_descriptions" ]; then
        _describe -V unsorted completions_with_descriptions -U
    fi

    if [ -n "$completions" ]; then
        compadd -U -V unsorted -a completions
    fi
}

compdef _sqlite_utils_completion sqlite-utils;
