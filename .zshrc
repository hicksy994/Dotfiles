# Path to your oh-my-zsh installation.
  export ZSH=/home/hicksy/.oh-my-zsh


#DONT TOUCH THIS WHATEVER YOU DO BAD THINGS WILL HAPPEN
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

#theme
ZSH_THEME="lambda-mod"

#vi keys
bindkey -v

#hide user rubbish
DEFAULT_USER='hicksy'

#plugins
plugins=(git vi-mode tmux)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
  # export MANPATH="/usr/local/man:$MANPATH"

  export PATH=~/.local/bin:$PATH
  # export RUST_SRC_PATH=/home/hicksy/.rust/src
  export RUST_SRC_PATH=/usr/local/src/rust/src

  source $ZSH/oh-my-zsh.sh

  # if [[ -n ${INSIDE_EMACS} ]]; then
  #     unsetopt zle
  # fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
