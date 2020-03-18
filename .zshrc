# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="gozilla"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(vi-mode git tmux rails history)
plugins=(git history virtualenv pass terraform vagrant)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# Customize to your needs...
bindkey '^R' history-incremental-search-backward
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^U' backward-kill-line

alias be='bundle exec'
alias rss='rbenv shell system'

alias vppp='vagrant provision --provision-with puppet'
alias vpps='vagrant provision --provision-with shell'
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vst='vagrant status'

alias o='openstack'
alias vim='/usr/bin/nvim'
alias tfm=terraform
alias d=docker
alias mol=molecule

alias tun5900='ssh -D 5900 -f -C -q -N gw'

function osrc {
  base_dir=$HOME/workspace/.openstackrc

  if [ -z ${1} ]
  then
    ls ${base_dir}
    return
  fi

  export OS_PASSWORD=$(PASSWORD_STORE_DIR=${base_dir} pass show osrc)
  source <(sed '/password/Id' ${base_dir}/hpc-rcp-${1}-openrc.sh)
}

[[ -s "/etc/profile.d/vte.sh" ]] && . "/etc/profile.d/vte.sh"

eval $(keychain --eval --agents gpg,ssh id_rsa)
eval "$($HOME/.rbenv/bin/rbenv init -)"

unset GREP_OPTIONS
unset VIRTUAL_ENV_DISABLE_PROMPT
export EDITOR=/usr/bin/nvim
export BC_ENV_ARGS=$HOME/.bcrc
export PROMPT="%{$fg_bold[yellow]%}%T %{$reset_color%}${PROMPT}"
export PASSWORD_STORE_DIR=$HOME/.password-store
export PATH="$HOME/.local/bin:$HOME/.rbenv/bin:$PATH"
