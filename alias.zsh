#!/bin/bash
alias ls="ls -G"

# Git shortcuts
alias gsh="git show "
alias gst="git status "
alias gsd="git checkout -- "
alias gl="git log"
alias gpush="git push"
alias gpom="git push origin master"
alias gpull="git pull"
alias grebase="git rebase"
alias gstash="git stash "
alias gdrop="git stash drop"
alias gpop="git stash pop "
alias gdiff="git diff"
alias gb="git checkout -B "
alias gc="git checkout "
alias gaa="git add -A"
alias gcm="git commit -m "
alias gca="git commit --amend"
alias ggr="git grep "

alias git-alias="cat ~/.bash/alias.bash | grep git | cut -d ' ' -f 2- | sed '$ d'"
alias editalias="vim ~/.bash/alias.bash"

alias vim="mvim"
alias vi="vi"

alias 3b="3B"
alias 3B="cd /Users/andyzg/Dropbox/University\ of\ Waterloo/3B/"
alias 4a="4A"
alias 4A="cd /Users/andy/Dropbox/University\ of\ Waterloo/4A/"
alias 4B="cd /Users/andy/Dropbox/University\ of\ Waterloo/4B/"
alias 4b="4B"
alias 358="cd /Users/andy/Dropbox/University\ of\ Waterloo/4A/ECE\ 358/programming\ asn/ECE358"

alias templatelatex="cp ~/.templates/latex.tex "

alias ea="vim ~/.zsh/alias.zsh"
alias refresh="source ~/.zshrc"

alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

alias se='cd ~/Documents/Github/se-2018-class-profile'
alias web='cd ~/Documents/Github/class-profile'

alias python='python3'
alias pip='pip3'
