alias zshconfig="vim ~/.zshrc"
alias wttr="curl wttr.in/~Brentwood+UK"
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
alias dkr-clean="docker rm -f $(docker ps -aq) && docker rmi -f $(docker images -aq)"
alias dkr-inspect="docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1"

function mktmpfs() {
  if [ $# -eq 2 ]; then
    if [ -e "$1" ]; then
      echo "File/Folder ${1} already exists"
    else
      mkdir "$1"
      sudo mount tmpfs "$1" -t tmpfs -o size="$2"
      sudo chown -hR dan:dan $1
    fi
  else
    echo "Create a temporary file system"
    echo "e.g. mktmpfs ~/temp 32m"
  fi
}

function wipetmpfs() {
  if [ $# -eq 1 ]; then
    if [ -e "$1" ]; then
      if mount | grep "$1 type tmpfs" > /dev/null; then
        read "REPLY?Are you sure you want to wipe $1? (Y/N) "
        if [[ ! $REPLY =~ ^[Y]$ ]]; then
          echo "Aborted"
          return 1
        else
          sudo umount $1
          rm -rf $1
          echo "Wiped"
        fi
      fi
    else
      echo "There's nothing at $1"
    fi
  else
    echo "Kill a temporary file system"
    echo "e.g. killtmpfs ~/temp"
  fi
}
function listen() {
  case "$1" in
    phoenixfm)
      mplayer 'http://hyades.shoutca.st:8555/stream'
      ;;
    talksport)
      mplayer 'https://radio.talksport.com/stream?awparams=platform:ts-web;&type=.flv&amsparams=playerid:ts-web;'
      ;;
  esac
}
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"
