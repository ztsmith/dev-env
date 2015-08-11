if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# grep with color
alias grep='grep --color=auto'

# git auto-completion
if ! [ -f ~/.git-completion.bash ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi
. ~/.git-completion.bash

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1=export PS1='\[\033[01;30m\]\w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;30m\]$\[\033[00m\] '

cd /code