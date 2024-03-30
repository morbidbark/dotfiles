# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=5000
SAVEHIST=10000
setopt autocd nomatch
unsetopt beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ryan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Configure prompt
setopt PROMPT_SUBST
prompt_path() {
    pwd | awk -v FS='/' '{ for(i=1; i<NF; i++){ printf substr($i, 1, 1) "/" } printf $NF}'
}
export PROMPT="%F{cyan}\$(prompt_path)
%F{yellow}>%f "

# Setup aliases
source ~/.config/zsh/aliases

