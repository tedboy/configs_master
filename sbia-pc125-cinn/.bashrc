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

#=============================================================================#
# https://gist.github.com/marioBonales/1637696
#=============================================================================#
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

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
# alias grep='grep --color'                     # show differences in colour
alias grep='grep -P --color=always'              # show differences in colour (also use perl engine as default)
alias egrep='egrep --color=always'              # show differences in colour
alias fgrep='fgrep --color=always'              # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
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
# alias gopython='cd ~/Dropbox/python'
alias gogit='cd ~/Dropbox/git'
alias gotex='cd ~/Dropbox/research_dropbox/latex'
alias goconf='cd /home/takanori/Dropbox/git/configs_master'

#-------------------------------------------------------------------------%
# alias goconfig='cd /cygdrive/c/Users/takanori/Dropbox/git/configs'
#alias godrive='cd /cygdrive/c/Users/takanori/Google\ Drive'
#| always colorized with line numbers on the LHS
alias less='less -rN'
# alias less='less -r'

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
# alias itksnap='itksnap &'
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
# alias gopy='cd ~/Dropbox/2015-work/python'
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

# alias twsource='source ~/.bashrc'
# alias gosnip='cd ~/Dropbox/git/snippet_book/python'
alias gowork='cd ~/Dropbox/work/sbia_work/'
# alias gowork='cd ~/work-local/tak-ace-ibis/python/'
alias goipynb='cd ~/Dropbox/work/ipynb-notes'
alias gosnippets='cd ~/Dropbox/git/snippet'

#=============================================================================#
# modify snippets via sublime text 14 June 2016 (Tuesday)
#=============================================================================#
alias subl_snip='subl -n -a ~/Dropbox/git/snippet'
subl_bashrc(){
  subl -n ~/Dropbox/git/configs_master/sbia-pc125-cinn/.bashrc
  subl ~/Dropbox/git/configs_master/sbia-pc125-cinn/.bash_aliases
  subl -a ~/Dropbox/git/configs_master/sbia-pc125-cinn/
}
subl_(){ # open both snippets and configs
  subl ~/Dropbox/git/configs_master/sbia-pc125-cinn/.bashrc
  subl ~/Dropbox/git/configs_master/sbia-pc125-cinn/.bash_aliases
  subl -a ~/Dropbox/git/snippet
  subl -a ~/Dropbox/git/configs_master/sbia-pc125-cinn/
  subl -a ~/Dropbox/git/configs_master/trouble-shooting/
  subl -a ~/.config/sublime-text-3/Packages/User/
}
#=============================================================================#
# Convenience alias (Post 06-14-2016 (13:06))
# (most scripts are created in accordance with ``cs-bash-commands.rst`` in my
#  ``snippets`` repository
#=============================================================================#
#http://stackoverflow.com/questions/1412423/display-only-files-and-folders-that-are-symbolic-links-in-tcsh-or-bash
alias ls_sym='ls -l $(find ./ -maxdepth 1 -type l -print)'

#http://stackoverflow.com/questions/17066250
alias print_time='echo $(date +"%Y-%m-%d_%H:%M:%S")'

#http://stackoverflow.com/questions/7110119 (history with no line-numbers)
alias hist_nonum='history | cut -c 8-'

# alias sync_snippets='cp -f /home/takanori/.config/sublime-text-3/Packages/User/*.sublime-snippet /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/sublime-text/sublime-snippets-sbia/'
#| -z = compress, -v = verbose, u=update only
alias sync_snippets='rsync -z /home/takanori/.config/sublime-text-3/Packages/User/*.sublime-snippet /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/sublime-text/sublime-snippets-sbia/'

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
# export PYTHONPATH=~/work-local/external-python-modules/Mozi:$PYTHONPATH
# export MOZI_DATA_PATH=~/data/mozi/data
# export MOZI_SAVE_PATH=~/data/mozi/database
# export MOZI_DATABASE_PATH=~/data/mozi/save

# export PYLEARN2_DATA_PATH=/home/takanori/data/deep_learning/pylearn2

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



#=============================================================================#
# git related
#=============================================================================#
#http://stackoverflow.com/questions/7066325/list-git-aliases
alias git_alias='git config --get-regexp alias | pygmentize -l sh'


#| added 08-24-2016 (16:11)
# remove color from stdou (wow, harder than i expected) 
#http://stackoverflow.com/questions/17998978/removing-colors-from-output
#http://unix.stackexchange.com/questions/111899/how-to-strip-color-codes-out-of-stdout-and-pipe-to-file-and-stdout
alias stripcolors='sed "s/\x1B\[\([0-9]\{1,2\}\(;[0-9]\{1,2\}\)\?\)\?[mGK]//g"'

#=============================================================================#
# to get colored output from ``less`` on scripts
# http://superuser.com/questions/117841/get-colors-in-less-command
#=============================================================================#
myless(){
  pygmentize $1 | less
}

alias tree='tree -C'
# export LESS='-R'
# export LESSOPEN='|~/.lessfilter %s'

# used for sphinx (from directory of Makeile
alias open_sphinx_html='firefox _build/html/index.html'

# location of the python modules from anacaonda 23 June 2016 (Thursday)
alias gopymodules='cd ~/anaconda2/lib/python2.7/site-packages'
alias golocalpymod='cd ~/.local/lib/python2.7/site-packages'
export PATH=$PATH:/home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/bin

# include pyspark to my python module 07-31-2016 (16:17)
export PYTHONPATH=$PYTHONPATH:/home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/python/
export PYTHONPATH=$PYTHONPATH:/home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/python/pyspark

# http://stackoverflow.com/questions/5130968/how-can-i-copy-the-output-of-a-command-directly-into-my-clipboard
alias c="xclip -selection clipboard" 
alias v="xclip -o -selection clipboard"

alias nojekyll='touch .nojekyll'

#=============================================================================#
# SNIPPETS to print out (as a self reminder)
#=============================================================================#
# just a bunch of reminder snippets i can print out in the shell
___bookmark_snip___(){
  echo 'no functionality. just a bookmark for sublime (use ctrl+r to navigate)'
}


_snip_find(){
  echo '
  find $DIR # recursively print out file directories
  find $PWD | grep helper.md
  find $PWD | grep helper.html | xclip
  find $PWD -maxdpeth 1
  find . -iname "*chrome*" # case insensitive
  find . -name "*chrome*" # case sensitive
  find . -iname "*chrome*" # print filenames, followed by a NULL character instead of the "newline" chracter that -print uses

  # ignore any file containing "est" (even in the directory name) and print out rest
  # (note: -o is the OR operator...see "operator" list below)
  find . -wholename '*est*' -prune -o -print

  # stuffs with -type option
  find . d # list directories
  find . f # list regular files
  find . l # list symlinks

  #=====================================================================#
  # name vs. whilename
  # - suppose i have file /Data_Science/test.txt
  #=====================================================================#
  find . -iwholename "*Sci*.txt"
      # this will find the above file
  find . -iname "*Sci*.txt"
      # this will NOT find the above file
  List filenames ending in .mp3, searching in the music folder and subfolders:
  $ find ./music -name "*.mp3"

  Find .doc files that also start with 'questionnaire' (AND)
  $ find . -name '*.doc' -name questionnaire*

  Find .doc files that do NOT start with 'Accounts' (NOT)
  $ find . -name '*.doc' ! -name Accounts*
  ' | pygmentize -l sh
}

_snip_for(){
  echo '
  for run in {1..10}
  do
    command
  done

  # single line
  for run in {1..30}; do ipython t_0809c_enet_tobpnc_age.py; done
  ' | pygmentize -l sh
}

_snip_rename(){
    echo '
    #http://unix.stackexchange.com/questions/146743/processing-multiple-extensions
    #https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html

    # rename the filename part "Array" with "_PCA" for all files ending with extension .mat
    rename Array _PCA *.mat

    # rename png "prefix" with "normalized" in files with .png extensions
    rename '"'"'s/prefix/normalized/'"'"' *.png

    # rename files with either .png or .pkl extension (see link on brack expansion above)
    # (-n will do a dry run, letting me check the rename will do what i want it to do )
    rename -n '"'"'s/normalized/test/'"'"' *.{png,pkl}

    # use -n to check rename will do what i want it to do
    rename -n '"'"'s/graphnet/elasticnet/;'"'"' *.m # check
    rename -v '"'"'s/graphnet/elasticnet/;'"'"' *.m # run verbosely after checking

    #=========================================================================#
    # add suffix/prefix to files
    # see 2nd answer in http://stackoverflow.com/questions/208181/how-to-rename-with-prefix-suffix
    #=========================================================================#
    # rename files with extensions (to avoid directory...not robust, but does what i want most of the time)
    for filename in *\.*; do echo $filename; done;
    for filename in *; do echo $filename; done; # <- this includes directory, which me not like

    for filename in *\.*; do mv "${filename}" "prefix_${filename}"; done;
    ' | pygmentize -l sh
}

_snip_scp(){
    echo '
    #========================================================================#
    # relevant options
    #========================================================================#
    #| -r : recursive
    #| -v : verbose (i probably won'"''"'t need)
    #| -q : quiet

    #========================================================================#
    # demos
    #========================================================================#
    # Copy dummy.txt to home directory in remote host:
    touch ~/dummy.txt
    scp ~/dummy.txt watanabt@cbica-cluster.uphs.upenn.edu:~/

    # copy dummy.txt on server as dummy_cp.txt to local home folder
    scp watanabt@cbica-cluster.uphs.upenn.edu:~/dummy.txt ~/dummy_cp.txt
    ' | pygmentize -l sh
}

_snip_mogrify(){
    echo '
    mogrify -resize 50% *.png
    mogrify -resize 500! *.png     => changes only x-axis
    mogrify -resize 500 *.png      => changes (x,y) axis in proportion
    mogrify -trim *.png

    #| http://arcoleo.org/dsawiki/Wiki.jsp?page=Recursively%20run%20Mogrify%20on%20a%20Directory
    #| Mogrify is an image tool that comes with ImageMagick. It is useful for resizing, compressing, etc. If you have a set of subdirectories to run it on, run
    $ find ./ -name "*.png" -exec mogrify -some_option {} \;
    $ find ./ -name "*.png" -exec mogrify -resize 40% {} \;
    ' | pygmentize -l sh
}

_snip_pipedream(){
    echo '
    #http://unix.stackexchange.com/questions/41740/find-exec-vs-find-xargs-which-one-to-choose

        the -exec "{}" \; approach seems to be specific to find (i prefer unity with xargs)

    #http://stackoverflow.com/questions/4509624/how-to-limit-depth-for-recursive-file-list
    # http://ss64.com/bash/find.html
    find . -maxdepth 1 -type d -exec ls -ld "{}" ";"
    find . -maxdepth 1 -type d -exec ls -ld \{\} \;  # same as above
    find . -maxdepth 1 -type d | xargs ls -ld # same as above (i find this the most intuitive)
    ls -ld $(find . -maxdepth 1 -type d) # same as above

    # this doesnt give the same result as "xargs" approach...figure out why later
    find . -maxdepth 1 -type d | ls -ld
    ' | pygmentize -l sh
}

_snip_grep_recursively(){
    echo '
    grep -r "texthere" .

    # You can also mention files to exclude with --exclude.
    grep -r --include "*.txt" texthere .

    # use brace expansion to allow multiple extension
    grep -r --include=*.{py,m} test .
    ' | pygmentize -l sh
}

_snip_demo_sed(){
    echo '
    # replace white-string with newline
    bash 0622_2016_rename_tobvols.sh | sed '"'"'s/ /\n/g'"'"'

    echo $PYTHONPATH
    /home/takanori/Dropbox/work/external-pymodules:/home/takanori/Dropbox/work/sbia_work/python/modules:/home/takanori/work-local/external-python-modules/deepnet:/home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/python/pyspark

    # recall, g for global replacement
    echo $PYTHONPATH | sed '"'"'s/:/\n/g'"'"'
    /home/takanori/Dropbox/work/external-pymodules
    /home/takanori/Dropbox/work/sbia_work/python/modules
    /home/takanori/work-local/external-python-modules/deepnet
    /home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/python/pyspark
    ' | pygmentize -l sh
} 

_snip_demo_awk(){
    echo '
    ls -l | awk '"'"'{printf $5 "\t" $9"\n"}'"'"'
    
        http://stackoverflow.com/questions/2021982/awk-without-printing-newline
        http://askubuntu.com/questions/231995/how-to-separate-fields-with-space-or-tab-in-awk
        http://www.catonmat.net/blog/awk-one-liners-explained-part-one/
        http://www.staff.science.uu.nl/~oostr102/docs/nawk/nawk_41.html
    ' | pygmentize -l sh
}

_snip_computer_info(){
    echo '
    # get cpu information
    cat /proc/cpuinfo

    #-- see gnome version ---
    gnome-shell --version
    lsb_release -a

    # to figure out which linux distribution you are using
    # (ref: http://www.cyberciti.biz/faq/find-linux-distribution-name-version-number/)
    cat /etc/*-release

    locate libfortran.so
    ' | pygmentize -l sh
}

_snip_demo_timestamp(){
    echo '
    echo $(date +"%Y-%m-%d_%H:%M:%S")
    ' | pygmentize -l sh
}

_snip_ls_symlink_only(){
    echo '
    # aliased as ls_sym
    ls -l $(find ./ -maxdepth 1 -type l -print)
    ' | pygmentize -l sh
}

_snip_github_clone_branch(){
    echo '
    #http://stackoverflow.com/questions/1911109/clone-a-specific-git-branch
    # skeleton
    git clone -b my-branch git@github.com:user/myproject.git local_folder_name

    # actual run
    git clone -b minimalist https://github.com/wtak23/sphinx_skeleton.git jinja2
    ' | pygmentize -l sh
}

_snip_moving_and_copying(){
  echo '
  # rename a directory (note '/' after directory name has NO impact here,  there are cases I should be careful of the backslash)
  mv /home/user/oldname /home/user/newname

  #=== cp helper ===#
  # copy files *inside* the folder "test/" inside folder "target"
  gosnippets; cd tests; mkdir source target; cd source; touch a b c; cd ..

  # copy files *inside* the folder "test/" inside folder "target" (note: -R and -r are the same here)
  cp -r source/* target

  # copy entire folder *source* into *target* (without ``-r``, the subdirectories wont get copied)
  cp -r source* target

  #--- cleanup test files from above---#
  cd ..; rm -r tests/*


  #--- remove entire directory including files inside recursively ---#
  rm -rf test/
  ' | pygmentize -l sh
} 

_snip_ps(){
    echo '
    # a <- includes ``root`` in userprocess
    # u <- include ``username`` column
    # x <- list all processes owned by me
    ps aux
    ' | pygmentize -l sh
}

_snip_git_localname(){
    echo '
    # change user name in local repository
    # https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration
    git config user.name "noname"
    git config user.email noname@example.com
    ' | pygmentize -l sh
}

_snip_stdout_stderr(){
    echo '
    #************************************************
    # Output stdout and stderr to terminal and logfile
    #
    # http://stackoverflow.com/questions/418896/how-to-redirect-output-to-a-file-and-stdout
    # http://stackoverflow.com/questions/18460186/writing-outputs-to-log-file-and-console
    #************************************************
    # save stdout and stderr to a file
    bash mymake.sh >> log.txt 2>&1

    # save logfile like above, but also print on terminal screen
    bash mymake.sh 2>&1 | tee log.txt
    ' | pygmentize -l sh
}  

_snip_logout(){ # just a wrapper to _snip_stdout_stderr (this one may have better mneumonic)
    _snip_stdout_stderr
}  

_snip_python_simple_http_server(){
    echo '
    # for status messages, see: http://www.w3schools.com/tags/ref_httpmessages.asp
    python -m SimpleHTTPServer 8000 &
    firefox "http://localhost:8000/"
    ' | pygmentize -l sh  
}



git_anonymize(){
  git config user.name "noname"
  git config user.email noname@example.com
}
alias twsphinx_check='firefox build/html/index.html' # 08-17-2016 (13:33)
alias twalias='alias | pygmentize -l sh' # 08-17-2016 (13:37)

git_clear_author_history(){
  git filter-branch -f --env-filter '

  CORRECT_NAME="your name"
  CORRECT_EMAIL="your_email@example.com"

  export GIT_COMMITTER_NAME="$CORRECT_NAME"
  export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"

  export GIT_AUTHOR_NAME="$CORRECT_NAME"
  export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
  ' --tag-name-filter cat -- --branches --tags
}

git_author_history_tak(){
  git filter-branch -f --env-filter '

  CORRECT_NAME="Takanori Watanabe (sbia-pc125)"
  CORRECT_EMAIL="Takanori.Watanabe@uphs.upenn.edu"

  export GIT_COMMITTER_NAME="$CORRECT_NAME"
  export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"

  export GIT_AUTHOR_NAME="$CORRECT_NAME"
  export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
  ' --tag-name-filter cat -- --branches --tags
}

pyg_sh(){
  # pygmentize shell code
  pygmentize -l sh $1
}

pyg_py(){
  # pygmentize python code
  pygmentize -l python $1
}

tw_print_function_name(){
  #=========================================================================#
  # print function names defined here
  # (since these don't show up in $ alias 
  #=========================================================================#
  # http://stackoverflow.com/questions/1184268/unix-sort-treatment-of-underscore-character
  # LC_COLLATE=C will make underscore sorted as well
  # (grep looks from () followed by {
  # sed shaves off all the last character following "()" bracket
  # http://stackoverflow.com/questions/3675169/how-to-shave-off-last-character-using-sed
  cat ~/.bashrc | grep "\(\)(?=\{)" | env LC_COLLATE=C sort -f | \
      sed "s/().*$/()/" | stripcolors
}

