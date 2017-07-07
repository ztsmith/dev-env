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

. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# \033 = escape sequence
# [38;5;249m\] = 256 color, selection of light gray
# \w = current working directory
# [\033[34m\] = 8/16 color: selection of blue
# $(__git_ps1 " %s") = display git branch status
# \n = newline
# \[\033[01;30m\] = change color back to dark gray
# $ = display prompt char
# \[\033[00m\] = change color back to white
export PS1=export PS1='\[\033[38;5;249m\]\w\[\033[34m\]$(__git_ps1 " %s") \n\[\033[01;30m\]$\[\033[00m\] '

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_default-dark

export VISUAL=nano
export EDITOR="$VISUAL"
export PATH="/usr/local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.bash.inc ]; then source ~/google-cloud-sdk/path.bash.inc; fi

# The next line enables shell command completion for gcloud.
if [ -f /~/google-cloud-sdk/completion.bash.inc ]; then source ~/google-cloud-sdk/completion.bash.inc; fi
