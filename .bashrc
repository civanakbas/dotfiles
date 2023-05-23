#coloring for directories and stuff
source ~/.ssh_stuff
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export LS_OPTIONS='--color=auto'
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/
eval "#(dircolors -b)"
alias ls='ls $LS_OPTIONS'

#Default editor
export EDITOR=nvim
export TERMINAL=alacritty

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

#My aliases
alias steamapps='cd ~/.local/share/Steam/steamapps/common'
alias cv='cd ~/Desktop/"Machine learning"/CV/'
alias carla='DISPLAY= ./CarlaUE4.sh /Game/Carla/Maps/Town07 -windowed -quality-level=Low'  
alias click='xdotool click --repeat 10000 --delay 10 1'
alias gpustat='gpustat -c'
alias jn='jupyter-notebook'
alias tls='tmux ls'
alias ide='tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50'
alias kat='tmux kill-pane -a'
alias killkde='killall plasmashell && kstart5 plasmashell'
alias ta='tmux attach -t 0'
alias lvim='/home/civan/.local/bin/lvim'
alias vim='lvim'
alias gt='cd ~/Desktop/Machine\ learning/Graduation\ Thesis && conda activate gt'
alias ivydocker='docker run --rm -it -v "$(pwd)":/ivy unifyai/ivy:latest'
alias ls='lsd'
alias pacman='sudo pacman'
alias optst='optimus-manager --status'
alias nvidiasw='optimus-manager --switch nvidia'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/civan/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/civan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/civan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/civan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init bash)"
