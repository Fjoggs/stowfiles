alias docompose-local=docompose-local
alias cypress-docker="docker-compose -f docker-compose.cypress.yaml up --exit-code-from cypress"
alias docker-kill-all="docker rm -f $(docker ps -aq)"
alias psdocker="docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.Ports}}\""

alias la="ls -al"

alias pip="pip3"

alias gproxy='ssh -f -nNT gitproxy'
alias gproxy-status='ssh -O check gitproxy'
alias gproxy-off='ssh -O exit gitproxy'

alias bfg='java -jar ~/opt/bfg-1.14.0.jar'

alias k=kubectl
alias ksys="kubectl -n kube-system"
alias klocal="kubectl --context=docker-desktop"
alias kloc="kubectl --context=docker-desktop"

alias kssh="kitty +kitten ssh"

alias dir='eza -l -a --git -o --no-user --no-time -T -I ".git|.DS_Store|node_modules" --icons --header'

