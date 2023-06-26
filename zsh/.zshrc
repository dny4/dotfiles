export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# Add wisely, as too many plugins slow down shell startup.
plugins=( 
    git
    zsh-autosuggestions
)

#
################################################################################
#
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias vi="nvim"

alias wt="ps -x | grep waydroid"
alias ws="sudo waydroid session stop && sudo systemctl stop waydroid-container.service"
alias wr="sudo waydroid session stop && sudo systemctl restart waydroid-container.service"

alias tk="tmux kill-server"
alias ta="tmux attach"
alias ts="tmux ls"
alias tw="tmux neww"

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
     
################################################################################

j(){
    cd $(find ~ -mindepth 1 -maxdepth 4 -type d | fzf)
}
zle -N j
bindkey '^j' j

rn () {
    echo
    ranger $1 --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=`cat $HOME/.rangerdir`
    cd "$LASTDIR"
    zle reset-prompt
}
zle -N rn
bindkey '^r' rn

tmux_ses() {
    echo
    tmux-sessionizer.sh 
    zle reset-prompt
}
zle -N tmux_ses
bindkey "^f" tmux_ses

function  vs {
    vs.sh
}

function hg {
    history | grep $1
}


function session {
    tmux attach -t $(tmux ls -F {#S} | tr -d "{}" | fzf)
}
alias s=session 
################################################################################
#
bindkey -v  


if [ -z "$TMUX" ]
then 
    tmux attach -t default || tmux new -s default
fi  
