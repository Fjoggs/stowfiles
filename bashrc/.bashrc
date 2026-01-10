# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'


# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

parse_git_branch ()
{
  git branch 2> /dev/null | grep '*' | sed 's#*\ \(.*\)#(git::\1)#'
}
parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ")"}'
}
parse_svn_url() {
  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}
set -o vi

# colors
BOLD="\[$(tput bold)\]"
REGULAR="\[$(tput sgr0)\]"
ORANGE="\[$(tput setaf 214)\]"
BLUE="\[$(tput setaf 33)\]"
LIGHT_GREEN="\[$(tput setaf 118)\]"
PINK="\[\e[38;5;201m\]"
WHITE="\[\e[01;37m\]"


# Pinky
# export PS1="\[[${BOLD}${PINK} \u${WHITE}@${PINK}\h ${WHITE}\w ] \$(parse_git_branch)\n-> \]"

# Orange
export PS1="${BOLD}${WHITE}[ ${ORANGE}\u${WHITE}@${BLUE}\h ${WHITE}\w ] \$(parse_git_branch)\n-> ${ORANGE}"
export PS0=${REGULAR}


# Add git and svn branch names
export PS1="$PS1\$(parse_git_branch)\$(parse_svn_branch) "

# Local bin folder
export BIN=$HOME/bin

# PATH
export PATH=$BIN:$PATH

# ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# bash parameter completion for the dotnet CLI

function _dotnet_bash_complete()
{
  local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n'
  local candidates

  read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)
  read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}

complete -f -F _dotnet_bash_complete dotnet

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH


export EDITOR=nvim

. "$HOME/.cargo/env"
eval "$(zoxide init bash)"

# Fast node manager (alternative to nvm)
eval "$(fnm env --use-on-cd --shell bash)"

# Added by Toolbox App
export PATH="$PATH:/home/fjogen/.local/share/JetBrains/Toolbox/scripts"

