# If not running interactively, don't do anything
[ -z "$PS1" ] && return

set -o vi

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

parse_git_branch() {
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    echo "($branch)"
  fi
}

# colors
BOLD="\[$(tput bold)\]"
REGULAR="\[$(tput sgr0)\]"
ORANGE="\[$(tput setaf 214)\]"
BLUE="\[$(tput setaf 33)\]"
LIGHT_GREEN="\[$(tput setaf 118)\]"
PINK="\[\e[38;5;201m\]"
WHITE="\[\e[01;37m\]"
LIGHT_GRAY="\[\e[0;37m\]"
PS_COLOR="\[\e[38;5;252m\]"

# Oceanic theme colors
MAIN="\[\e[38;5;252m\]"        # soft light gray
ACCENT="\[\e[38;5;114m\]"      # mint green (git branch)
SYMBOL="\[\e[38;5;110m\]"      # cyan arrow
PS_COLOR="\[\e[38;5;252m\]"       # soft light gray
LIGHT_GREEN="\[\e[38;5;114m\]"    # nice readable green
PATH_COLOR="\[\e[1;38;5;110m\]" # bold cyan gray
RESET="\[\e[0m\]"



# Pinky
# export PS1="\[[${BOLD}${PINK} \u${WHITE}@${PINK}\h ${WHITE}\w ] \$(parse_git_branch)\n-> \]"

# Orange
# export PS1="${BOLD}${WHITE}[ ${ORANGE}\u${WHITE}@${BLUE}\h ${WHITE}\w ] \$(parse_git_branch)\n-> ${ORANGE}"

export PS1="${PATH_COLOR}\w ${ACCENT}\$(parse_git_branch) ${SYMBOL}${MAIN}"
export PS0=${REGULAR}




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

