# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Terminal setup
#  background = #151515
#  foreground = #16ff16
#  Inconsolata, 15pts

# ANSI colors: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
RED="\[\033[0;31m\]"
YELLOW='\033[1;33m' #fce94f
GREEN="\[\033[0;32m\]"
BLUE='\033[0;34m' #2f588d
PURPLE="\[\033[0;35m\]"
LIGHT_GREY="\[\033[0;37m\]"
DARK_GREY="\[\033[1;30m\]"
NO_COLOR='\033[0m'

# Is the Internet on fire?
RESPONSE=$(dig +short txt istheinternetonfire.com | sed -e 's/\\; /\n/' -e 's/"//'g  -e 's/"//'g -e 's/  / /g' -e 's/\n/ /g')
echo -e "${YELLOW}Is the Internet on fire yet?${BLUE} $RESPONSE${NC}\n"

# Pretty colors (#ad7fa8 user, #729fcf files)
PS1="\[\033[01;35m\]\u\[\033[00m\]\[\033[35m\]@\[\033[01;35m\]\h\[\033[00m\] \[\033[01;34m\]\$(pwd | sed 's/^.//g' | sed 's/\(.\)[^\/]*\//\1\//g' | sed 's/^\(.\)/\/\1/g' | sed 's/^$/\//')\[\033[00m\] \\$ "

# Pretty colors (#ef2929 root)
#PS1="\[\033[01;31m\]\u\[\033[00m\]\[\033[31m\]@\[\033[01;31m\]\h\[\033[00m\] \[\033[01;34m\]\$(pwd | sed 's/^.//g' | sed 's/\(.\)[^\/]*\//\1\//g' | sed 's/^\(.\)/\/\1/g' | sed 's/^$/\//')\[\033[00m\] \\$ "

# Exports
export PATH=$PATH:~/.packer
export EDITOR=/usr/bin/nano
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# SSH Aliases
# removed for github

# Aliases for VirtualBox
alias vbsetup='/etc/init.d/vboxdrv setup'  # Recompile vbox kernel module for dkms

# Aliases for Packer (JSONs build on VirtualBox)
alias packer='packerio'
alias p-centos7cis='packer build centos7-cis.json'
alias p-centos7='packer build centos7-minimal.json'
alias p-centos6='packer build centos6-minimal.json'
alias p-ubuntu1404='packer build ubuntu1404-minimal.json'
alias p-ubuntu1504='packer build ubuntu1504-minimal.json'
alias p-fedora22='packer build fedora22.json'

# Aliases for general use
alias dl='curl -OJL'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias c='clear'
alias wget='wget -c'
alias nocomment='grep -Ev '\''^(#|$)'\'''
alias ls='ls -lhaF --color'
alias df='df -h -x tmpfs -x devtmpfs'
alias youtube='youtube-dl --newline'

# Aliases for SaltStack
alias highstate="salt -b 5 '*' state.highstate"
alias highstate-json="salt -b 5 '*' state.highstate --output=json --out-indent=2 --output-file=$(date +"%m_%d_%Y")-highstate.json"
alias salt-ping="salt '*' test.ping"
alias update-ubuntu="salt -G 'os_family:Debian' cmd.run 'apt-get upgrade -y'"
alias update-rhel="salt -G 'os_family:RedHat' cmd.shell 'yum clean all && yum update -y'"
alias update-sles="salt -G 'os_family:Suse' cmd.run 'zypper update --non-interactive'"
alias salt-ip="salt '*' network.ip_addrs"

# Aliases for administration
alias updates='dnf clean all && dnf update -y'
alias pwgen='openssl rand -base64 12'
alias sshgen='ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)-$(date -I)"'
alias free='free -h'
alias du='du -chs'
alias updatehosts='cp /home/natalie/Code/config/hosts /etc/hosts && restorecon -v "/etc/hosts"'

# Aliases for git
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gcol="git checkout live"
alias gcom="git checkout master"
alias gcos="git checkout stable"
alias gd="git diff"
alias gl="git lg"
alias gm="git merge"
alias gp="git pull --ff"
alias gpol="git push origin live"
alias gpom="git push origin master"
alias gpos="git push origin stable"
alias gs="git status"
alias gitgraph="git log --graph --color --oneline --decorate --date=relative --all"
alias git-yolo='git commit -am "`curl -s http://whatthecommit.com/index.txt`"'
alias git-friday-afternoon='git commit -a -m "obviously not a read-only friday"; git push --force'

# Functions
function extract() {
	if [ "${1}" = "-h" ]; then
    echo "Usage: extract [filename]"
		echo "Extracts specified archive."
    return
	fi
	if [ -f "$1" ] ; then
		case "$1" in
			*.tar.bz2) tar xjf "$1" ;;
			*.tar.gz) tar xzf "$1" ;;
			*.tar.Z) tar xzf "$1" ;;
			*.bz2) bunzip2 "$1" ;;
			*.rar) unrar x "$1" ;;
			*.gz) gunzip "$1" ;;
			*.jar) unzip "$1" ;;
			*.tar) tar xf "$1" ;;
			*.tbz2) tar xjf "$1" ;;
			*.tgz) tar xzf "$1" ;;
			*.zip) unzip "$1" ;;
			*.Z) uncompress "$1" ;;
			*) echo "'$1' cannot be extracted." ;;
		esac
		else
			echo "'$1' is not a file."
	fi
}

function rtfm() {
	if [ "${1}" = "-h" ]; then
    echo "Usage: rtfm [command]"
		echo "Returns [command] -h, or then the man page, or then Google search results"
    return
  fi
	"$@" --help 2> /dev/null || man "$@" 2> /dev/null || open 'http://www.google.com/search?q="$@"';
}

function listening {
  if [ "${1}" = "-h" ]; then
    echo "Usage: listening [t|tcp|u|udp] [ps regex]"
    return
  fi
  DISP="both"
  NSOPTS="tu"
  if [ "${1}" = "t" -o "${1}" = "tcp" ]; then
    DISP="tcp"
    NSOPTS="t"
    shift
  elif [ "${1}" = "u" -o "${1}" = "udp" ]; then
    DISP="udp"
    NSOPTS="u"
    shift
  fi
  FILTER="${*}"
  PORTS_PIDS=$(netstat -"${NSOPTS}"lnp | tail -n +3 | tr -s ' ' | sed -n 's/\(tcp\|udp\) [0-9]* [0-9]* \(::\|0\.0\.0\.0\|127\.[0-9]*\.[0-9]*\.[0-9]*\):\([0-9]*\) .* \(-\|\([0-9-]*\)\/.*\)/\3 \1 \5 \2/p' | sed 's/\(::\|0\.0\.0\.0\)/EXTERNAL/' | sed 's/127\.[0-9]*\.[0-9]*\.[0-9]*/LOCALHOST/' | sort -n | tr ' ' ':' | sed 's/::/:-:/' | sed 's/:$//' | uniq)
  PS=$(ps -e --format '%p %a')
  echo -e '   Port - Protocol - Interface - Program\n-----------------------------------------------'
  for PORT_PID in ${PORTS_PIDS}; do
    PORT=$(echo "${PORT_PID}" | cut -d':' -f1)
    PROTOCOL=$(echo "${PORT_PID}" | cut -d':' -f2)
    PID=$(echo "${PORT_PID}" | cut -d':' -f3)
    INTERFACE=$(echo "${PORT_PID}" | cut -d':' -f4)
    if [ "${PROTOCOL}" != "${DISP}" -a "${DISP}" != "both" ]; then
      continue
    fi
    if [ "${PID}" = "-" ]; then
      if [ "${FILTER}" != "" ]; then
        continue
      fi
      printf "%7s - %8s - %9s - -\n" "${PORT}" "${PROTOCOL}" "${INTERFACE}"
    else
      PROG=$(echo "${PS}" | grep "^ *${PID}" | grep -o '[0-9] .*' | cut -d' ' -f2-)
      if [ "${FILTER}" != "" ]; then
        echo "${PROG}" | grep -q "${FILTER}"
        if [ $? -ne 0 ]; then
          continue
        fi
      fi
      printf "%7s - %8s - %9s - %s\n" "${PORT}" "${PROTOCOL}" "${INTERFACE}" "${PROG}"
    fi
  done
}

function openfiles {
  if [ "${1}" = "-h" ]; then
    echo -e "Usage: openfiles [r|w|m|R|W] regex\n    -r    opened for reading or read/write\n    -w    opened for writing or read/write\n    -m    accessed from memory (includes running command)\n    -R    opened for reading only\n    -W    opened for writing only"
    return
  fi
  if [ "$#" = "0" ]; then
    echo "Process signature/regex required."
    return
  fi
  MODE="(w|u)"
  ACTION="for writing"
  if [ "${1}" = "r" ]; then
    MODE="(r|u)"
    ACTION="for reading"
    shift
  elif [ "${1}" = "R" ]; then
    MODE="r"
    ACTION="for reading (only)"
    shift
  elif [ "${1}" = "W" ]; then
    MODE="w"
    ACTION="for writing (only)"
    shift
  elif [ "${1}" = "m" ]; then
    MODE="(txt|mem)"
    ACTION="in memory"
    shift
  elif [ "${1}" = "w" ]; then
    shift
  fi
  if [ "${MODE}" != "(txt|mem)" ]; then
    MODE="[0-9]+${MODE}"
  fi
  PIDS=$(pgrep -d "," -f "${@}")
  if [ "${PIDS}" = "" ]; then
    echo "No processes found matching '${@}'."
    return
  fi
  OPENFILES=$(lsof -PXn -p "${PIDS}" | egrep "${MODE}[A-Za-z]* +REG" | awk '{print $9}' | egrep -v "^\[" | sort | uniq);
  if [ "${OPENFILES}" = "" ]; then
    echo "No files opened ${ACTION}."
  else
    echo "Files opened ${ACTION}:"
    ls -ahl "$OPENFILES"
  fi
}
