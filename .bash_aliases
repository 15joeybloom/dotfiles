alias vpn='/opt/cisco/anyconnect/bin/vpn'
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

alias wdiff="wdiff -n -w $'\033[30;41m' -x $'\033[0m' -y $'\033[30;42m' -z $'\033[0m'"
# … | less -R

alias path="echo $PATH | tr ':' '\n'"

alias isabelle="/home/joey/Desktop/Isabelle2017/Isabelle2017"

alias fd=fd-find

alias kickemacs='pkill -SIGUSR2 Emacs'
#alias emacs='emacs -nw'
alias emacsd='emacs --daemon'
alias emacsc=emacsclient
#alias emacsclient='emacsclient -nw'
alias magit='emacsclient --eval "(progn (magit-status) (delete-other-windows))"'
alias sbp='source ~/.bash_profile'
alias sp='source ~/.profile'
alias scrb='[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" ; rvm use 2.4.0'
alias dockerprune='docker container prune --filter "until=48h"'
alias dockerkillall='ps ax | grep -i docker | egrep -iv '\''grep|com.docker.vmnetd'\'' | awk '\''{print $1}'\'' | xargs kill'
alias fd=fdfind
alias ssh-dev-vm='ssh -Y jbloom@localhost -p 2200'
alias ssh-zzz-vm='ssh -Y joey@localhost -p 2201'

alias frontstart="npm --prefix front start"
alias npmfront="npm --prefix front"
alias astart="cd ~/perfalytics/analytics/posthog && bin/start-frontend"

alias c="docker compose"

alias psqllocaldb="psql -h localhost -p 7432 -U postgres"
alias psqllocalsummary="psql -h localhost -p 7433 -U postgres"
alias psqllocaldadb="psql -h localhost -p 7435 -U postgres"
alias s2prod='mysql -u joey_login -h svc-3b4c6844-9695-4ac5-8fba-568a477b414f-dml.aws-oregon-2.svc.singlestore.com -P 3306 --ssl-ca ~/Downloads/singlestore_bundle.cer --ssl-mode=VERIFY_CA --default-auth=mysql_native_password'
alias s2ingestdb='mysql -u joey_login -h svc-3b4c6844-9695-4ac5-be8a-cc8ae9ba2434-dml.aws-oregon-2.svc.singlestore.com -P 3306 --ssl-ca ~/Downloads/singlestore_bundle.cer --ssl-mode=VERIFY_CA --default-auth=mysql_native_password'

function prune_old_branches() {
    for k in $(git branch | sed /\*/d); do
        if [ -z "$(git log -1 --since='1 week ago' -s $k)" ]; then
            git branch -D $k
        fi
    done
}
alias prune_old_branches="prune_old_branches"
