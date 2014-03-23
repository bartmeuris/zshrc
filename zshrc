# Alice's over-engineered z-shell configuration, released in the public domain.
# Primary loader of external components.

# Update the path for all scripts regardless of interactivity.
path+=(/usr/local/bin /usr/bin /bin)

# The rest of this configuration applies to interactive shells only.
[[ -o nointeractive ]] && return

# Update the path for interactive execution.
#path+=(~/.bin /usr/local/sbin /usr/sbin /sbin)
path=(
~/bin
/usr/local/bin
/usr/bin
/bin
/usr/local/sbin
/usr/sbin
/sbin
/opt/X11/bin
)

# Explicit is better than implicit.
export ZDOTDIR="$HOME/.zsh"

# Helper function used within.
function load {
    if [[ -f $ZDOTDIR/$1.zsh ]]; then
        source $ZDOTDIR/$1.zsh
    else
        echo "WARN: $ZDOTDIR/$1.zsh does not exist!"
    fi
}

# Chain load the various components of our configuration.
#load oh-my-zsh
load lib
load plugins
load shell
load variables
load functions
load aliases
load options
load helpers
load history
load prompt
load completion
load i10n
load os-specific
load local
load ls-colors
load keys

# this shit won't work anywhere else!!!
setopt print_exit_value
