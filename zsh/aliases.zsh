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
function mountrepo() {
  if [ -e /dev/md0 ]; then
    sudo cryptsetup luksOpen /dev/md0 repo
    if [ ! -d /mnt/repo ]; then
      sudo mkdir /mnt/repo
      sudo chown -hR dan:dan /mnt/repo
    fi
    sudo mount /dev/mapper/repo /mnt/repo
    echo "/mnt/repo successfully unlocked and mounted"
  else
    echo "Device /dev/md0 not found"
  fi
}
function unmountrepo() {
  if [ -e /dev/md0 ]; then
    if grep '/mnt/repo' /etc/mtab > /dev/null 2>&1; then
      sudo umount -l /mnt/repo
      sudo cryptsetup luksClose /dev/mapper/repo
      echo "/mnt/repo successfully unmounted and locked"
    else
      echo "/mnt/repo is not mounted"
    fi
  else
    echo "Device /dev/md0 not found"
  fi
}
#alias dkr-clean="docker rm -f $(docker ps -aq) && docker rmi -f $(docker images -aq)"
#alias dkr-inspect="docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1"

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

function virtualenv_prompt_info(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}
