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

# Keybinds
bindkey "^P" up-history
bindkey "^N" down-history
bindkey "^[[3~" delete-char
bindkey "^?" backward-delete-char
bindkey "^Y" autosuggest-accept
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Configure prompt
setopt PROMPT_SUBST
prompt_path() {
    pwd | awk -v FS='/' '{ for(i=1; i<NF; i++){ printf substr($i, 1, 1) "/" } printf $NF}'
}
git_branch() {
    if git status > /dev/null 2>&1; then
        echo "%F{green}[$(git branch --show-current)]%f" 
    fi
}
export PROMPT="%F{cyan}\$(prompt_path) \$(git_branch)
%F{yellow}>%f "

# Setup aliases
source ~/.config/zsh/aliases

# add plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
