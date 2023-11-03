export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# Add wisely, as too many plugins slow down shell startup.
plugins=( 
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

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
  file=$HOME/Projects/mkself/daily-logs/$d.md
  time=$(date +%H:%M" "%p)
  head="---\nauthor: Dnyaneshwar\ndate: $d\ntags:\n  - default\n---\n\n**$time**\n"

  if [ -f "$file" ]; then
    echo "\n---\n**$time**\n" >> "$file"
  else
    echo "$head" > "$file"
  fi

  nvim "$file"
}
# mkself dash-f
function dashf() {
  d=$(date +%F)
  file=$HOME/Projects/mkself/dashf/logs/$d.md
  time=$(date +%H:%M" "%p)
  head="---\nauthor: Dnyaneshwar\ndate: $d\ntags:\n  - dashf\n  - nnn\n---\n\n**$time**\n"

  if [ -f "$file" ]; then
    echo "\n---\n**$time**\n" >> "$file"
  else
    echo "$head" > "$file"
  fi

  nvim "$file"
}


# open pdf in zathura, epub in foliate
alias fp='zathura "$(find ~/Courses ~/Downloads ~/Documents ~/Projects -name "*.pdf" | fzf -0)"  --fork'
alias fe='xdg-open "$(find ~/Courses ~/Downloads ~/Documents ~/Projects -name "*.epub" | fzf)" 2>/dev/null'

# play single video with mpv
alias fm='vod="$(find ~/Courses ~/Videos ~/Downloads -regex ".*\.\(mkv\|mp4\)" | fzf)" && mpv "$vod" 1>/dev/null 2>/dev/null &; echo -e "Playing...\n$vod";'

# play folder with mpv 
alias ffm='vod="$(find ~/Courses ~/Videos ~/Downloads -type d | fzf)" && mpv "$vod" 1>/dev/null 2>/dev/null &; echo -e "Playing...\n$vod"'

alias fh="history | awk '{\$1=\"\"; print}' | sort | uniq | fzf"

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
    if [ ! $(tmux has-session -t="default" 2> /dev/null) ]
    then
      tmux new-session -s "default" -d 2> /dev/null
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

################################################################################

eval "$(starship init zsh)"

################################################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


PATH="/home/dny4/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/dny4/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dny4/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dny4/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dny4/perl5"; export PERL_MM_OPT;
