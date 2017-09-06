alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias wttr="curl wttr.in/~Brentwood+UK"
alias phoenixfm="mpv 'http://hyades.shoutca.st:8555/stream'"
alias cl="find . -type f -name '$1' | xargs wc -l"
alias fif="find . -type f -print | xargs grep '$1'"
alias hcf="sudo shutdown -h now"
alias swh="tmux split-window -h"
alias swv="tmux split-window -v"
function rp() {
    tmux resize-pane -$1 $2
}
function android-backup() {
  filename=Full_Backup_$(date +%Y-%m-%d_%T).ab
  adb backup -f "${filename}" --twrp system cache data boot recovery --compress
}
