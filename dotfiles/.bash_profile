if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# better file listing
alias ll='ls -laFh'

# grep with color
alias grep='grep --color=auto'

# force npm cache
alias npminstall='npm install --cache-min Infinity'

# git auto-completion
if ! [ -f ~/.git-completion.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.sh
fi
. ~/.git-completion.sh

# git prompt
if ! [ -f ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1=export PS1='\[\033[01;30m\]\w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;30m\]$\[\033[00m\] '
fi

export VISUAL=nano
export EDITOR="$VISUAL"
export PATH="/usr/local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.bash.inc' ]; then source '~/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/~/google-cloud-sdk/completion.bash.inc' ]; then source '~/google-cloud-sdk/completion.bash.inc'; fi
