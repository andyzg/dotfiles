GIT_PS1_SHOWDIRTYSTATE=true
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)
CK=$(tput setaf 0)

export PS1='\[${POWDER_BLUE}\]\u@\[${LINE_YELLOW}\]mbp \[${BLUE}\]\w\[${RED}\]$(__git_ps1) \[${GREEN}\]\$ \[${NORMAL}\]'
