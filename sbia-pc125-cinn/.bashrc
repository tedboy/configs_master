#|----- Problem with bash complaining "\r command not found" -----|# 
#|http://stackoverflow.com/questions/11616835/cgywin-r-command-not-found-bashrc-bash-profile
# (set -o igncr) 2>/dev/null && set -o igncr; # this comment is needed
# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

#%========================================================================%
# Note: (08/07/2014)
# - for some odd reason, Mint doesn't like to use .bash_alias file.
# - thus stick my customized commands within .bashrc
#%========================================================================%
alias tak='ssh takanori@takanori.eecs.umich.edu'
alias caen='ssh takanori@login.engin.edu'
alias itd='ssh takanori@login.engin.edu'
alias newberry='ssh takanori@newberry.eecs.umich.edu'
alias itd='ssh -Y -l takanori stat.itd.umich.edu'
alias sbia='ssh -Y -l watanabt cbica-cluster.uphs.upenn.edu'
#-------------------------------------------------------------------------%
alias itd2='ssh takanori@stat.itd.umich.edu'
alias tak2='ssh -Y takanori@takanori.eecs.umich.edu'
#-------------------------------------------------------------------------%
alias gitk1='gitk &'
#-------------------------------------------------------------------------%
alias cpucheck='ps uU takanori --sort %cpu'
alias cpucheck2='ps aux --sort %cpu'
#-------------------------------------------------------------------------%
#| http://serverfault.com/questions/62411/how-can-i-sort-du-h-output-by-size
#| The link above provides 2 methods to sort files in human readable way.  
#| [$ sort -h] only works on my eecs computer...doesn't work on caen/slab computers.  so i use the alternate method on those computer
alias dspace='du -h --max-depth=1'
alias dspace2='du --max-depth=1 | sort -n | cut -f2- | xargs du -hs'
alias dspace3='du --max-depth=1 | sort -n | cut -f2- | xargs du -ahs'
#-------------------------------------------------------------------------%
#|----- Moving around directories -----|#
alias gopython='cd ~/Dropbox/python'
alias gogit='cd ~/Dropbox/git'
alias gotex='cd ~/Dropbox/research_dropbox/latex'
alias goconf='cd /home/takanori/Dropbox/git/configs_master'

#-------------------------------------------------------------------------%
# alias goconfig='cd /cygdrive/c/Users/takanori/Dropbox/git/configs'
#alias godrive='cd /cygdrive/c/Users/takanori/Google\ Drive'
#| always colorized with line numbers on the LHS
alias less='less -rN'

# http://superuser.com/questions/109537/unix-ls-how-to-sort-first-directories-then-files-etc
alias ls='ls --color -h --group-directories-first'

#| set path for my custom shell
export PATH=$PATH:~/Dropbox/git/configs_master/bin

#========================================================================#
# Ref: http://pages.physics.cornell.edu/~myers/teaching/ComputationalMethods/python/ipython.html 
# (08/19/2014)
#========================================================================#
export LESS="-R"
export EDITOR="emacs"

#========================================================================#
#========================================================================#
#                        stuffs after June 2015
#========================================================================#
#========================================================================#

#-------------------------------------------------------------------------%
# http://madebynathan.com/2011/10/04/a-nicer-way-to-use-xclip/
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }  
# Copy SSH public key
alias cbssh="cbf ~/.ssh/id_rsa.pub"  
# Copy current working directory
alias cbwd="pwd | cb"  
# Copy most recent command in bash history
alias cbhs="cat $HISTFILE | tail -n 1 | cb"  
#################################### END OF ABOVE (xclip stuffs) #############

#| add itksnap path
export PATH=$PATH:~/mybin/itksnap-3.2.0-20141023-Linux-x86_64/bin/
alias itksnap='itksnap &'
# added by Anaconda 2.2.0 installer
# export PATH="/home/takanori/anaconda/bin:$PATH"

MLM_LICENSE_FILE=27000@olympus.uphs.upenn.edu
# export PATH=$PATH:/usr/local/MATLAB/R2014b/bin
export PATH=$PATH:/usr/local/MATLAB/R2013a/bin
alias mlab='cd ~/Dropbox/2015-work/matlab && matlab &'
alias matlab1='matlab &'

alias godrop='cd ~/Dropbox'
alias gomat='cd ~/Dropbox/2015-work/matlab'
alias godeep='cd ~/Dropbox/2015-work/deep-learning'
alias gopy='cd ~/Dropbox/2015-work/python'
# alias gowork='cd ~/Dropbox/2015-work/tak-ace-ibis'

export PATH=$PATH:~/abin

alias m2014='/usr/local/MATLAB/R2014b/bin/matlab &'
alias ipynb='ipython notebook'
# alias ipynb='ipython notebook --browser=/usr/bin/firefox'
# LD_LIBRARY_PATH=/usr/local/MATLAB/R2013a/sys/os/glnxa64:/usr/local/MATLAB/R2013a/bin/glnxa64

export PATH=$PATH:/usr/local/cuda-6.5/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-6.5/lib64
export CUDA_ROOT=/usr/local/cuda-6.5

# added by Anaconda 2.3.0 installer
#export PATH="/home/takanori/anaconda/bin:$PATH"

export BLAS=/usr/local/lib/libopenblas.a
export LAPACK=/usr/local/lib/libopenblas.a
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/

# export PYTHONPATH=/home/takanori/work-local/external-pymodules
# export PYTHONPATH=$PYTHONPATH:/home/takanori/work-local/tak-ace-ibis/python/modules
export PYTHONPATH=/home/takanori/Dropbox/work/external-pymodules
export PYTHONPATH=$PYTHONPATH:/home/takanori/Dropbox/work/sbia_work/python/modules

# https://bbs.archlinux.org/viewtopic.php?id=180833
export GLPATH=/usr/lib make

alias spyder='spyder --new-instance &'

export PATH=$PATH:/home/takanori/mybin/Slicer-4.4.0-linux-amd64
export PATH=$PATH:/home/takanori/mybin/ImageJ

alias twsource='source ~/.bashrc'
alias gosnip='cd ~/Dropbox/git/snippet_book/python'
alias gowork='cd ~/Dropbox/work/sbia_work/'
# alias gowork='cd ~/work-local/tak-ace-ibis/python/'
alias goipynb='cd ~/Dropbox/work/ipynb-notes'


#=============================================================================#
# trying to get deepnet working
# https://github.com/nitishsrivastava/deepnet/blob/master/INSTALL.txt
#=============================================================================#
export CUDA_ROOT=/usr/local/cuda-6.5
export CUDA_BIN=/usr/local/cuda-6.5/bin
export CUDA_LIB=/usr/local/cuda-6.5/lib64
export PATH=${CUDA_BIN}:$PATH
export LD_LIBRARY_PATH=${CUDA_LIB}:$LD_LIBRARY_PATH

# protocole buffer (type $ which protoc)
export PATH=/usr/local/bin/protoc:$PATH

# (3) SET ENVIRONMENT VARIABLES
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/takanori/work-local/external-python-modules/deepnet/cudamat
export PYTHONPATH=$PYTHONPATH:/home/takanori/work-local/external-python-modules/deepnet

#=============================================================================#
# mozi stuff
# https://github.com/hycis/Mozi
#=============================================================================#
export PYTHONPATH=~/work-local/external-python-modules/Mozi:$PYTHONPATH
export MOZI_DATA_PATH=~/data/mozi/data
export MOZI_SAVE_PATH=~/data/mozi/database
export MOZI_DATABASE_PATH=~/data/mozi/save

export PYLEARN2_DATA_PATH=/home/takanori/data/deep_learning/pylearn2

alias gcc='/sbia/sbiasfw/external/gcc/4.7.1/bin/gcc'


#=============================================================================#
# stuffs after mar29_2016
#=============================================================================#
tw_csvhead(){
  head -1 $1 | tr ',' '\n'
}

# cudnn shit: see http://deeplearning.net/software/theano/library/sandbox/cuda/dnn.html
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/takanori/data/cuda/lib64
# export CPATH=$CPATH:/home/takanori/data/cuda/include
# export LIBRARY_PATH=$LD_LIBRARY_PATH:/home/takanori/data/cuda/lib64
# added by Anaconda2 4.0.0 installer
export PATH="/home/takanori/anaconda2/bin:$PATH"

# added by Anaconda 2.3.0 installer
# export PATH="/home/takanori/anaconda/bin:$PATH"
