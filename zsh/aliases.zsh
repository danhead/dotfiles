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
  if [ -e /dev/md1 ]; then
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
