# -------------------------------------------------------------------
# use nocorrect alias to prevent auto correct from "fixing" these
# -------------------------------------------------------------------
#alias foobar='nocorrect foobar'
#alias g8='nocorrect g8'

# -------------------------------------------------------------------
# directory movement
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'

# -------------------------------------------------------------------
# directory information
# -------------------------------------------------------------------
alias lh='ls --color=auto -d .*' # show hidden files/directories only
alias lsd='ls --color=auto -aFhlG'
alias l='ls --color=auto -GFhl'
alias ls='ls --color=auto -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls --color=auto -al' # Same as above, but in long listing format
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias dus='du -sckx * | sort -nr' #directories sorted by size
alias wordy='wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias filecount='find . -type f | wc -l' # number of files (not directories) 

# -------------------------------------------------------------------
# remote machines
# -------------------------------------------------------------------
alias 'researchweb=ssh abhinandan.panigrahi@researchweb.iiit.ac.in'

# -------------------------------------------------------------------
# git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1 | sort | uniq -c | sort -nr'

# leverage aliases from ~/.gitconfig
alias gh='git hist'
alias gt='git today'

# curiosities 
# gsh shows the number of commits for the current repos for all developers
alias gsh="git shortlog | grep -E '^[ ]+\w+' | wc -l"

# gu shows a list of all developers and the number of commits they've made
alias gu="git shortlog | grep -E '^[^ ]'"

# -------------------------------------------------------------------
# custom shortcuts / new utilities
# -------------------------------------------------------------------
alias hfree='sudo python ~/.zsh/scripts/ps_mem.py'
alias rename='perl-rename'
alias mplayer='mpv'

#-------------------------------------------------------------------
# gcc/g++ extra options to aid in debugging
# -------------------------------------------------------------------

#alias g++ = 'g++ -Wall -Wextra -pedantic -std=c++11 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wcast-qual -Wcast-align -fwhole-program -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -lmcheck -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fstack-protector'


# pacman alias examples

# Pacman alias examples
alias pacupg='pacaur -Syu' # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacin='pacaur -S' # Install specific package(s) from the repositories
alias pacins='pacaur -U' # Install specific package not from the repositories but from a file
alias pacre='pacaur -R' # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrm='pacaur -Rns' # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacaur -Si' # Display information about a given package in the repositories
alias pacreps='pacaur -Ss' # Search for package(s) in the repositories
alias pacloc='pacaur -Qi' # Display information about a given package in the local database
alias paclocs='pacaur -Qs' # Search for package(s) in the local database
alias pacupd='pacaur -Sy && sudo abs' # Update and refresh the local package and ABS databases against repositories
alias pacinsd='pacaur -S --asdeps' # Install given package(s) as dependencies of another package
alias pacmir='pacaur -Syy' # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

# -------------------------------------------------------------------
# Source: http://aur.archlinux.org/packages/lolbash/lolbash/lolbash.sh
# -------------------------------------------------------------------
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias visible='echo'
alias invisible='cat'
alias moar='more'
alias icanhas='mkdir'
alias donotwant='rm'
alias dowant='cp'
alias gtfo='mv'
alias hai='cd'
alias plz='pwd'
alias inur='locate'
alias nomz='ps aux | less'
alias nomnom='killall'
alias cya='reboot'
alias kthxbai='halt'

# other aliases
#alias vim='gvim'
#alias setdate ='sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"'
alias matlab='/home/ap/bin/matlab_2013b/matlab/bin/matlab'
