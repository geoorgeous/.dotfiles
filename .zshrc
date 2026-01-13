# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/george/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz colors
colors

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
setopt prompt_subst

zstyle ':vcs_info:git*' formats "%{$fg[white]%}%s:%{$reset_color%}%r:%b%u%c "
zstyle ':vcs_info:git*' actionformats "%s:%r:%b <%{$fg[blue]%}%a%{$reset_color%}>%u%c "
zstyle ':vcs_info:git*' stagedstr " %{$fg[green]%}[s]%{$reset_color%}"
zstyle ':vcs_info:git*' unstagedstr " %{$fg[red]%}[u]%{$reset_color%}"

#RPROMPT= '${vcs_info_msg_0_}' %3~
PROMPT="%n@%M %{$fg[green]%}"$'\U276F'"%{$reset_color%} "
RPROMPT='${vcs_info_msg_0_}%3~'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# git:cx:main <rebase>  [u] [s]

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
