# Dan Head's dotfiles

A collection of configuration files for frequently used applications, like 
[terminal](https://github.com/thestinger/termite), [zsh](http://www.zsh.org/), 
[Vim](http://www.vim.org/), [i3 (window manager)](https://i3wm.org/) and 
[Irssi](https://irssi.org/) amongst others.

## Contents

Folder | Description
--- | ---
bin | Binary files and scripts
i3 | i3 config files
irssi | Irssi config and theme
polybar | polybar config and associated scripts
termite | Termite config file and terminfo file
vim | vimrc file and colours
zsh | zsh config file and aliases

## Installation
I would recommend against cloning and using this repository as it is heavily 
customised for my use, instead I would fork it and customise to your liking, or 
simply copy out the bits you want.

My setup consists of either updating applications to reference the config files 
directly from the repository, or where that is not possible, I use a symlink to 
the applications default config location.

For example, to configure ZSH:
```
git clone git@github.com:danhead/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/zsh/.zshrc ~/
```
