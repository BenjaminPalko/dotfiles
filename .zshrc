# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/benjamin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias rebuild="sudo nixos-rebuild switch"
alias dotfiles="cd ~/dotfiles/"
alias nv="nvim"

neofetch --ascii /home/benjamin/dotfiles/aperture.txt
