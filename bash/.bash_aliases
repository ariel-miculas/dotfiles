shopt -s expand_aliases

alias cls="tput reset"
alias mc='EDITOR=vim mc'
alias tmux="tmux -2"
alias cb='xclip -sel clip'
alias pie='perl -pi -e'
alias graph='git log --graph --oneline --all'
alias weather='curl "https://wttr.in/Cluj-Napoca?m"'
alias nmap_all='nmap -sS -sU -p- -sC -sV -O -Pn -v -oN output 137.74.202.89'
alias cat=bat
alias gcb='git checkout "$(git branch -a | sed "s/  //" | grep -v "^*" | fzf)"'
alias gct='git checkout "$(git tag | fzf)"'
alias fda="fd -H -I"
