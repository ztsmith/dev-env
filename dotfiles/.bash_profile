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
if ! [ -f ~/.git-completion.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.sh
fi
. ~/.git-completion.sh

# git prompt
if ! [ -f ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi
. ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1=export PS1='\[\033[01;30m\]\w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;30m\]$\[\033[00m\] '

export VISUAL=nano
export EDITOR="$VISUAL"
export PATH="/usr/local/bin:$PATH"

if [ $(brew --prefix nvm)/nvm.sh ]; then
  source $(brew --prefix nvm)/nvm.sh
fi

export SBUX_NPM_TOKEN="8a6f9fa5-0b81-497f-84a0-1ea8f0866577"
