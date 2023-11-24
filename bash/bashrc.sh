# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ===========================================================================
# Sources
# ===========================================================================

PATH=$PATH:$HOME/Dotfiles/bash/helpers
PATH=$PATH:$HOME/Dotfiles/bash/helpers/term-dmenu

# ===========================================================================
# Editor controls
# ===========================================================================

EDITOR='vi'
set -o vi

# ===========================================================================
# History Management
# ===========================================================================

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# append to the history file, don't overwrite it
shopt -s histappend

# ===========================================================================
# Window management
# ===========================================================================

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# ===========================================================================
# Alias'es
# ===========================================================================

# Directory processing
alias sl='ls'
alias c='clear'
alias cl='clear; ls --group-directories-first --color=always'
alias la='ls -a --group-directories-first --color=always'
alias ls='ls --group-directories-first --color=always'
alias l='ls --group-directories-first --color=always'
alias ll='ls -AlgGh --group-directories-first --color=always'
alias ..='cd ..'
alias ...='.. ; ..'
alias h='cd ~'
alias dirsize='du -hc --max-depth=1'
alias pcsize='df -h | grep "Filesystem\|nvme0n1p2"'

# Programs
export EDITOR='emacs'
export VISUAL='emacs'

alias vim='vim.gtk3'
alias em='emacsclient -c'
alias za='zathura'
alias bluetooth='blueman-manager'
alias outlook='prospect-mail'
alias tex='pdflatex'
alias bib='biber'
alias lisp='sbcl'
alias lisprun='sbcl --script'
alias matlab='matlab &'
alias python='python3'
alias py='python'
alias pip='pip3'
alias ur5sim='/home/th/Libraries/ur5sim/ursim-5.12.4.1101661/start-ursim.sh'
alias cal='ncal -3w'
alias mark='dirmark -m'
alias jmp='cd $(dirmark)'
alias listmark='dirmark -i'
alias mcm='make clean; make'

# Dual screen setup
alias hdmishare='xrandr --output HDMI-1 --auto --same-as eDP-1'
alias hdmistop='xrandr --output HDMI-1 --off && xrandr -s 0'
alias hdmihome='xrandr --output HDMI-1 --auto --left-of eDP-1 --rotate left'

# File processing
alias valgrind='valgrind --leak-check=full \
         --show-leak-kinds=all \
         --track-origins=yes \
         --verbose \
         --log-file=valgrind-out.txt'
alias mv='mv -i'
alias rm='rm -i'
alias process='pgrep -i -l'
alias grep='grep -irn --color=auto'
alias todo='grep "TODO:"'
alias mcm='make clean; make'


alias ros2staticbuild='cd ~/ros2_colcon_ws/ ; colcon build ; source ~/.bashrc'
alias ros2build='cd ~/ros2_colcon_ws/ ; colcon build --symlink-install ; source ~/.bashrc'
alias ros2clean='cd ~/ros2_colcon_ws/ ; rm -rf build/ install/ log/'

## alias ros1source='source /opt/ros/noetic/setup.sh && '
##ros1source

alias ros1source='source /opt/ros/noetic/setup.bash && source ~/ros1_catkin_ws/devel/setup.bash'


## Setup Ros2 enviroment
#source "/opt/ros/foxy/setup.bash"
## Source colcon ros2 workspace manager
#source "/usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash"
## Source colcon ros2 workspace
#source "$HOME/ros2_colcon_ws/install/setup.bash"
## Source Gazebo
#source "/usr/share/gazebo/setup.sh"

alias coppeliasim='cd /home/th/Libraries/CoppeliaSim/ ; ./coppeliaSim.sh'
alias cdros2hand='cd ~/ros2_colcon_ws/src/th_hand_controller/th_hand_controller/'

# Security
alias purge='shred -fvuz'
alias tarenc='tar -zcvf'
alias tardec='tar -xvf'
alias gpgenc='gpg -c --no-symkey-cache --cipher-algo AES256'
# gpgdec='gpg'

# University
alias thesis='cd ~/Dropbox/University/Thesis/ ; ls'

#https://askubuntu.com/questions/1017249/samsung-tv-mirror-screen
alias tv='flatpak run org.gnome.NetworkDisplays & pavucontrol &'

# ===========================================================================
# Greeter
# ===========================================================================

#  \j = amount of jobs running in background
#  \w = path to current directory
#  green and white colors
PS1='[\j]\[\033[1;32m\]\w >\[\033[00m\] '

# a more simple greeter
#PS1="\w > "

# ===========================================================================
# Minor program dependencies
# ===========================================================================

# Import ssh keys (Unsafe i guess)
ssh-add "$HOME/.ssh/id_github" ; clear

# Fix matlab rendering
export _JAVA_AWT_WM_NONREPARENTING=1

# Setup gazebo enviroment
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/model_editor_models/

[ -f "/home/th/.ghcup/env" ] && source "/home/th/.ghcup/env" # ghcup-env