# If not running interactively, exit early
[[ $- != *i* ]] && return

# EDITOR
export EDITOR=nvim

# History
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
shopt -s checkwinsize

# Limit recursive functions
export FUNCNEST=100

# Load aliases
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases

# ---------------------------
# OCEANIC THEME COLORS
# ---------------------------
RESET="\[\e[0m\]"
MAIN="\[\e[38;5;252m\]"          # soft light gray
ACCENT="\[\e[38;5;114m\]"        # mint green (git branch)
SYMBOL="\[\e[38;5;110m\]"        # cyan arrow
PATH_COLOR="\[\e[1;38;5;110m\]"  # bold oceanic cyan gray

# Git branch
parse_git_branch() {
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if ! git diff --quiet 2>/dev/null; then
    dirty="*"
  fi

  [[ -n $branch ]] && echo "(${branch}${dirty})"
}

# Prompt
# Detect SSH session
is_ssh() {
    [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]
}

export PS1="${PATH_COLOR}\w ${ACCENT}\$(parse_git_branch) ${MAIN}"

# PATH setup
export BIN="$HOME/bin"
export PATH="$BIN:$HOME/.bun/bin:$PATH"

# ssh-agent (systemd)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Cargo
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# zoxide
eval "$(zoxide init bash)"

# fnm (fast node manager)
eval "$(fnm env --use-on-cd --shell bash)"

# dotnet completion
_dotnet_bash_complete() {
  local cur="${COMP_WORDS[COMP_CWORD]}" IFS='\n'
  local candidates
  read -d '' -ra candidates < <(dotnet complete --position "$COMP_POINT" "$COMP_LINE" 2>/dev/null)
  read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}
complete -f -F _dotnet_bash_complete dotnet

