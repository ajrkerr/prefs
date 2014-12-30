#!/bin/bash

## Alias Commands ##
alias ls="ls -G"
alias z="zeus"
alias pm="cd ~/src/packmanager"


## Console Prompt Settings ###
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/:\1/"
}
 
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
 
force_color_prompt=yes
 
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
 
PS1='\n\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]$(parse_git_branch)\[\033[00m\]\$ '

unset color_prompt force_color_prompt

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


#export PATH=/usr/local/bin:/usr/local/Cellar/ruby193/1.9.3-p547/bin:$PATH

pskill() {
  if [ "$1" ]
  then 
    psgrep -n $1 | awk '{print $2}' | xargs kill
  else
    echo "No param provided"
  fi
}
