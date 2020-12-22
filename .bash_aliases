alias vpn='/opt/cisco/anyconnect/bin/vpn'
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

alias wdiff="wdiff -n -w $'\033[30;41m' -x $'\033[0m' -y $'\033[30;42m' -z $'\033[0m'"
# … | less -R

alias path="echo $PATH | tr ':' '\n'"

alias isabelle="/home/joey/Desktop/Isabelle2017/Isabelle2017"

alias fd=fd-find

alias kickemacs='pkill -SIGUSR2 Emacs'
alias emacs='emacs -nw'
alias emacsd='emacs --daemon'
alias emacsc=emacsclient
alias emacsclient='emacsclient -nw'
alias magit='emacsclient --eval "(progn (magit-status) (delete-other-windows))"'
alias sbp='source ~/.bash_profile'
alias sp='source ~/.profile'
alias scrb='[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" ; rvm use 2.4.0'
alias dockerprune='docker container prune --filter "until=48h"'
alias fd=fdfind
