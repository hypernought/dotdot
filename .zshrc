# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=998
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hypernought/.zshrc'

autoload -Uz compinit
compinit

#include hidden files
_comp_options+=(globdots)

# End of lines added by compinstall
source ~/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/git/zsh-clipboard/clipboard.plugin.zsh

# newline on prompt & git branch indicator
function precmd {
    if [[ "$NEW_LINE" = true ]] then
		print ""
    else
        NEW_LINE=true
    fi
	vcs_info
}
autoload -Uz vcs_info
alias clear='NEW_LINE=false && clear' # no preceeding newline after clear
zstyle ':vcs_info:git:*' formats '%b '

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%F{cyan}${vcs_info_msg_0_}%F{red}%1~%F{white} %# %f%b'

function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)   tar xvjf ./$1    ;;
                *.tar.gz)    tar xvzf ./$1    ;;
                *.tar.xz)    tar xvJf ./$1    ;;
                *.lzma)      unlzma ./$1      ;;
                *.bz2)       bunzip2 ./$1     ;;
                *.rar)       unrar x -ad ./$1 ;;
                *.gz)        gunzip ./$1      ;;
                *.tar)       tar xvf ./$1     ;;
                *.tbz2)      tar xvjf ./$1    ;;
                *.tgz)       tar xvzf ./$1    ;;
                *.zip)       unzip ./$1       ;;
                *.Z)         uncompress ./$1  ;;
                *.7z)        7z x ./$1        ;;
                *.xz)        unxz ./$1        ;;
                *.exe)       cabextract ./$1  ;;
                *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}
# Atajos
alias ..="cd .."
alias ls="ls -a"
alias pac='sudo pacman -S'
alias clima='curl wttr.in/temuco'
alias gtk="lxappearance"
alias fontsi="sudo fc-cache -fv"


source ~/git/zsh/dracula.zsh-theme
