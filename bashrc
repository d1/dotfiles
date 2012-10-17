
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

function gemdir {
    if [[ -z "$1" ]] ; then
	echo "gemdir expects a parameter, which should be a valid RVM Ruby selector"
    else
	rvm "$1"
	cd $(rvm gemdir)
	pwd
    fi
}

GIT_PS1_SHOWDIRTYSTATE='true'
source ~/.dotfiles/git-prompt.sh

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
##################################################
bash_prompt_command() {
	    # How many characters of the $PWD should be kept
	    local pwdmaxlen=32
	    # Indicate that there has been dir truncation
	    local trunc_symbol=".."
	    local dir=${PWD##*/}
	    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
	    NEW_PWD=${PWD/$HOME/~}
	    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
	    if [ ${pwdoffset} -gt "0" ]; then
	        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
	        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
	    fi
}
PROMPT_COMMAND=bash_prompt_command

PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]${NEW_PWD}$(__git_ps1 " (%s)")\[\e[0m\]\n\$ '

# Ignore ^D
set -o ignoreeof
# Use case-insensitive filename globbing
shopt -s nocaseglob
# Automatically fix sloppy spelling in paths
shopt -s cdspell

EDITOR="emacs"

# Global Aliases
alias ls='ls -aF'
alias df='df -h'
alias du='du -h'

alias ducks='du -cks * | sort -rn | head -11'
alias be='bundle exec'
alias ec='emacsclient -n'

## Load External Configurations

# OSX-specific configuration
OSX_BASH_CONFIG="${HOME}/.config-osx/bashrc-osx"
[[ -s "$OSX_BASH_CONFIG" ]] && source "$OSX_BASH_CONFIG"

# Cygwin-specific configuration
CYGWIN_BASH_CONFIG="${HOME}/.config-cygwin/bashrc-cygwin"
[[ -s "$CYGWIN_BASH_CONFIG" ]] && source "$CYGWIN_BASH_CONFIG"


## Setup Paths

# Set PATH so it includes private bin if it exists
if [ -d "${HOME}/bin" ]; then
  PATH="${HOME}/bin:${PATH}"
fi

# Set MANPATH so it includes private man if it exists
if [ -d "${HOME}/man" ]; then
  MANPATH="${HOME}/man:${MANPATH}"
fi

# Set INFOPATH so it includes private info if it exists
if [ -d "${HOME}/info" ]; then
  INFOPATH="${HOME}/info:${INFOPATH}"
fi


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
