source $HOME/.dotfiles/zsh/aliases.zsh
source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  emoji
  git
EOBUNDLES
antigen theme muse
antigen apply

export PATH=$HOME/.dotfiles/bin:$PATH
export VISUAL=vim
export EDITOR=vim
export BROWSER=firefox
export NVM_DIR="/usr/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
