
function gemdir {
    if [[ -z "$1" ]] ; then
	echo "gemdir expects a parameter, which should be a valid RVM Ruby selector"
    else
	rvm "$1"
	cd $(rvm gemdir)
	pwd
    fi
}

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
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

PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]${NEW_PWD}\[\e[0m\]\n\$ '
#PS1="${W}[\u@\h \${NEW_PWD}]${W}\\$ ${NONE}"

# @ToDo: Add git bash completion
# Git tab completion
#source ~/git-completion.bash
# Show branch in status line
#PS1='[\W$(__git_ps1 " (%s)")]\$ '
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'


EDITOR="emacs"

# Global Aliases
alias ls="ls -aF"
alias ducks='du -cks * | sort -rn | head -11'

alias be="bundle exec"

## Load External Configurations

# OSX-specific configuration
OSX_BASH_CONFIG="$HOME/.config-osx/bashrc-osx"
[[ -s "$OSX_BASH_CONFIG" ]] && source "$OSX_BASH_CONFIG"

# Cygwin-specific configuration
CYGWIN_BASH_CONFIG="$HOME/.config-cygwin/bashrc-cygwin"
[[ -s "$CYGWIN_BASH_CONFIG" ]] && source "$CYGWIN_BASH_CONFIG"

 # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
