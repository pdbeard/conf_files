###-----------------------------
# pdbeard .bashrc
# Manjaro
# Last update: Nov 2014
###-----------------------------


if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell          # Fixes minor spelling errors in cd args
shopt -s checkwinsize     # Checks for window size after each command (for correct formating)
shopt -s cmdhist          # Saves multi-line commands as one history entry
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob          # Enables pattern matching (?, *, +, @, !)
shopt -s histappend       # Appends instead of overwrites old HISTFILE on shell exit
shopt -s hostcomplete
shopt -s nocaseglob       # Case-insensitive file expansion. (Not working???)

export HISTSIZE=1000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth        # Remove Extra Commands
export HISTCONTROL=erasedups         # Erase duplicates across the whole history
export HISTTIMEFORMAT="%d/%m/%y %T " # History list shows digital time and date
#export HISTTIMEFORMAT="%h %d %H:%M:%S> "

HISTCONTROL=ignorespace     # Space follow by a cmd,will not be saved in history
HISTCONTROL=ignoredups      # Rm Dupes, the continuous repeated entry from history
HISTFILESIZE=3000           # Bash history size limit
HISTSIZE=1000


# General
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias sysinfo='~/dev/bash/sysinfo.sh'
alias recent='find -maxdepth 1 -type f -mtime -1 -printf "%T@-%Tk:%TM - %f\n | sort -rn | cut -d- -f2-'   # recently changed files
alias drivespace='echo "Drive      Size  Used  Avail Use  Mounted on";df -h|grep sd|column -t|sort && df -h --total|cut -c 1-11,17-37|tail -n1'
alias copy='rsync -avhW --no-compress --progress' #add src / dest

# Config Files 
alias scust='vim ~/.bashrc'
alias vcust='vim ~/.vimrc.after'

# Package Management
alias ranksync=' sudo pacman-mirrors -g && sudo pacman -Syy'
alias pkglist=' comm -13 <(pacman -Qmq | sort) <(pacman -Qqe | sort) > pkglist'
alias whatinstalled='cat /var/log/pacman.log | grep "\[PACMAN] installed\ "'

alias yaconf='yaourt -C'         # Fix all configuration files with vimdiff
alias yaupg='yaourt -Syua'       # Synchronize with repositories before upgrading packages (AUR packages too) that are out of date on the local system.
alias yasu='yaourt --sucre'      # Same as yaupg, but without confirmation
alias yain='yaourt -S'           # Install specific package(s) from the repositories
alias yains='yaourt -U'          # Install specific package not from the repositories but from a file
alias yare='yaourt -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias yarem='yaourt -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias yarep='yaourt -Si'         # Display information about a given package in the repositories
alias yareps='yaourt -Ss'        # Search for package(s) in the repositories
alias yaloc='yaourt -Qi'         # Display information about a given package in the local database
alias yalocs='yaourt -Qs'        # Search for package(s) in the local database
alias yalst='yaourt -Qe'         # List installed packages, even those installed from AUR (they're tagged as "local")
alias yaorph='yaourt -Qtd'       # Remove orphans using yaourt
alias yaupd='yaourt -Sy && sudo abs'   # Update and refresh the local package and ABS databases against repositories
alias yainsd='yaourt -S --asdeps'      # Install given package(s) as dependencies of another package
alias yamir='yaourt -Syy'              # Force refresh of all package lists after updating 
alias pacupg='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'              # Display information about a given package in the repositories
alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman -Qi'              # Display information about a given package in the local database
alias paclocs='pacman -Qs'             # Search for package(s) in the local database
alias pacupd='sudo pacman -Sy && sudo abs'     # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'

#PYTHON VIRTUAL ENVIRONMENT
# ...


#-------------------------------
# Color & Prompt Custimization
#-------------------------------

# Prompt
source ~/dotfiles/extras/colors_org
FANCY="\342\226\270"
#PS1="\[$Cyan\]\h: \[$Red\]\W \[$Yellow\]$FANCY \[$Color_Off\] "
#PS1="\[\e[0;36m\]┌─\[\e[0;39m \u$FANCY\h \e[0;36m\]─ \[\e[1;31m\]\w\[\e[0;36m\]\[\e[0;36m\]\n\[\e[0;36m\]└──╼\[\e[0;34m\] \[\e[39m\]"
PS1='\e[1;32m┌── \e[1;36m[\e[m\u@\h\e[1;36m]\e[1;31m \W\n\[\e[1;32m└\e[0;34m\] \e[39m'

# Color Manpages
export LESS_TERMCAP_mb=$'\E[01;31m'    # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # end mode
export LESS_TERMCAP_se=$'\E[0m'        # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'        # end underline
export LESS_TERMCAP_us=$'\E[01;32m'    # begin underline
#export MANPAGER="/usr/bin/most -s"     # color using most

# Color Grep Search
export GREP_COLORS='0;31'

# Add Clock to terminal
#while sleep 1
#do tput sc
#  tput cup 0 $(($(tput cols)-29))
#  date
#  tput rc
#done &


#-------------------------------
# Functions
#-------------------------------



# Quick Config command
conf() {
  case $1 in
    bspwm)vim ~/.config/bspwm/bspwmrc ;;bspwmrcsxhkd)vim ~/.config/sxhkd/sxhkdrc ;;
    conky)vim ~/.conkyrc ;;
    menu)vimdiffim ~/.config/openbox/menu.xml ;;
    mpd)vim ~/.mpd/mpd.conf ;;
    mutt)vim    ~/.mutt/muttrc ;;
    ncmpcpp)vim ~/.ncmpcpp/config ;;
    pacman)vim /etc/pacrmorphanscman.conf ;;
    ranger)vim ~/.config/ranger/rc.conf ;;
    rifle)vim ~/.config/ranger/rifle.conf ;;
    tmux)vim ~/.tmux.conf ;;
    vim)vim ~/.vimrc ;;
    xinit)vim ~/.xinitrc ;;
    xresources)vim ~/.Xresources && xrdb ~/.Xresources ;;
    zathura)vim ~/.config/zathura/zathurarc ;;
    tint2)vim ~/.config/tint2/tint2rc ;;
    bashrc)vim ~/.bashrc && source ~/.bashrc ;;
    *)echo "Unknown application: $1" ;;
    esac
    }


# Simple Notes
note() {
 if [[ ! -f $HOME/.notes ]]; then         # if file doesn't exist, create it
   touch "$HOME/.notes"
 fi

 if ! (($#)); then
   cat "$HOME/.notes"                     # no arguments, print file
 elif [[ "$1" == "-c" ]]; then 
   > "$HOME/.notes"                       # clear files
 else
   printf "%s\n" "$*" >> "$HOME/.notes"   # add all arguments to file
 fi
}

# cd and ls in one
cl() {
  dir=$1
  if [[ -z "$dir" ]]; then
    dir=$HOME
  fi
  if [[ -d "$dir" ]]; then
    cd "$dir"
    ls
  else
    echo "bash: cl: '$dir': Directory not found"
  fi
}

# Search history for typed command
myip() {
  /sbin/ifconfig | grep "inet 156" #set for IU : normally would be 192
  curl ifconfig.me |sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
}

# History Grep search
hs(){
  history | grep "$1" 
}


# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Vim discover using locate
vdiscover (){
  #---
  # usage: vdiscover <search>
  # example: vdiscover man vs wild
  # OR operator: vdiscover 'man vs wild (mkv|avi)'
  # $ ending in: vdiscover 'man vs wild (mkv|avi)$'
  # vdiscover '(naruto|shingeki) (mkv|avi)$'
  # vdiscover naruto shippudden mkv$
  #---

  keyword=$(echo "$@" |  sed -e 's/ /.*/g' -e 's:|:\\|:g' -e 's:(:\\(:g' -e 's:):\\):g')
  locate -ir "$keyword" | vim -R -
}

# Aspell Quick change
spellword (){
  keyword=$(echo "$@")
  aspell -a <<< "$keyword"
}


# Upload image to imgur
imgur-upl() {
  curl -s -F image=@"$1" -F "key=1913b4ac473c692372d108209958fd15" \
  http://api.imgur.com/2/upload.xml | grep -Eo "<original>(.)*</original>" \
  | grep -Eo "http://i.imgur.com/[^<]*"
}

# Upload to sprunge
sprunge() { 
  cat "$1" | curl -F 'sprunge=<-' http://sprunge.us  
}

# Check AUR comments on package 
aurcomment () {
  lynx -dump https://aur.archlinux.org/packages/$1/?comments=all | grep --max-count=5 --after-context=99 --color=never "Comment by" | sed -n '/AUR v2.2.0/q;p' | grep --color=always -E '^|Comment by .*|'
}

#---
# Test if a file should be opened normally, or as root (vim) 
# NEEDS TO BE TESTED WITH JANUS >>> with /usr/bin/vim
#---


#argc () {
#    count=0;
#    for arg in "$@"; do
#        if [[ ! "$arg" =~ '-' ]]; then count=$(($count+1)); fi;
#    done
#    echo %count;
# }

# vim () { if [[ 'argc "$@"' > 1 ]]; then /usr/bin/vim $@;
#                   elif [ $1 ='' ]; then /usr/bin/vim;
#                   elif [ ! -f $1 ] || [ -w $1 ]; then usr/bin/vim $@; 
#                   else
#                      echo -n "File is readonly. Edit as root? (Y/n): "
#                      read -n 1 yn; echo; 
#                    if [ "$yn" = 'n' ] || [ "$yn" = 'N' ]
#                       then /usr/bin/vim $*
#                       else sudo /usr/bin/vim $*
#                    fi
#            fi
#}


#-------------------------------
# Init
#-------------------------------


# FASD Init
# z to quickly move
eval "$(fasd --init auto)"

# DavMail
#davmail &

