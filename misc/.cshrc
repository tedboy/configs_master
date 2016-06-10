#!/bin/csh -f
#
# This file is sourced at login time. 
# It is also sourced at other times, so be careful of what you put here.
# Also be careful of how much you put, because the more that is here, the
# longer it will take to log in.

# This 'if ($?prompt)'  statement is what keeps the rest of this file from
# being executed every time it is sourced.  (It checks to see if your prompt is
# set, and if it is then it goes on).
# Put anything you want executed 'every' time before the if statement, and
# anything else after it.

if ($?prompt) then

# Put and lines of code here that pertain only to you when you log in
# and you don't need them to be executed every time .cshrc is sourced.

# This next statement sets up a path.  It first checks to see if a path 
# exists.  If it doesn't, it builds one.  If it does, it redundantly sets
# the path equal to path.  But this is good, for the purpose of allowing you
# to add directories to your path, while still receiving the system path.
# (Note: see that ~/bin has been added.


#------------Tak's modified portion------------------------------#
# useful shell commands:
# whereis
# locate
# set
# setenv
# printenv
# pstree 
# find / -name *.mhd
      set path=( . /usr/ucb /bin /usr/bin /usr/sbin /usr/X11/bin /usr/X11R6/bin /usr/gnu/bin /usr/um/bin /usr/eecs/bin /usr/local/bin /home/takanori/scripts /home/takanori/software/elastix/bin /n/newberry/w/takanori/software /home/takanori/software/ParaView-3.14.0-RC2-Linux/bin /home/takanori/software/qt/bin /home/takanori/software/gengetopt-2.22.4/src /home/takanori/software/tcl8.4.19/unix /n/newberry/w/takanori/software/Foxit/1.1-release)
          
#-----------------my functions------------------------------------------#
#| 2/14/2013 -> csh doesn't support functions? http://www.unix.com/shell-programming-scripting/29567-declaring-functions-csh.html, http://stackoverflow.com/questions/13916515/function-instead-of-alias-in-c-shell-login-script
#|           -> the work aroudn: http://stackoverflow.com/questions/941338/shell-script-how-to-pass-command-line-arguments-to-an-unix-alias
# function si() { eix -FIc "$1"; }   # Search installed; show summary
#-----------------my alias------------------------------------------#
	alias catc 'pygmentize -g $1' #| 2/23/2013... for installation, do $ sudo easy_install Pygments...also, see http://stackoverflow.com/questions/941338/shell-script-how-to-pass-command-line-arguments-to-an-unix-alias for alias with arguments
	alias lessc 'pygmentize -g \!* | less'

	alias browse 'nautilus &'  #| 2/12/2012 =>old version...option `--browser' not supported on this computer.  # nautilus --browser &
	alias grepc 'grep \!* -rni . --color=always' # 2/14/2013 http://superuser.com/questions/36022/less-and-grep-getting-colored-results-when-using-a-pipe-from-grep-to-less
	alias grepl 'grep \!* -rni . --color=always | less -rN' #| 2/14/2013...what the \!* does? http://home.adelphi.edu/sbloch/class/archive/271/fall2005/notes/aliases.html, http://unixhelp.ed.ac.uk/shell/alias_csh2.1.html
	alias tfind 'find . -iname \!*'
	alias tfindl 'find . -iname \!* | less -rN'
	alias mountTacc 'sshfs takanori@lonestar.tacc.utexas.edu: tacc'
	alias caen 'ssh -Y -l takanori login.engin.umich.edu'
	alias freewill 'ssh -Y -l slab freewill.psych.med.umich.edu'
	alias psyche 'ssh -Y -l slab psyche.psych.med.umich.edu'
	alias mania 'ssh -Y -l slab mania.psych.med.umich.edu'
	alias tacc 'ssh -X takanori@lonestar.tacc.utexas.edu'
	alias troll 'ssh -Y -l takanori troll.rad.med.umich.edu'
	alias itd 'ssh -Y -l takanori stat.itd.umich.edu'
	alias lonestar 'ssh -X takanori@lonestar.tacc.utexas.edu'
	alias cpucheck 'ps uU takanori --sort %cpu'
	alias cpucheck2 'ps aux --sort %cpu'
	alias itksnap 'itksnap &' 
	alias gitk 'gitk &'
	alias rstudio 'rstudio &'
	alias matlab1 'matlab &'
	alias matlab2 'matlab -nodesktop'
	alias mlabnohup 'nohup matlab -nodisplay >&! tttttttt.out << EOF &'	
	alias tls 'ls -lrt $*' # list all file starting from character you inputted.	
	alias goslab 'cd ~/users/takanori/slabWork'
	alias gogit 'cd ~/users/takanori/git_repos'
	alias godrop 'cd ~/Dropbox'
	alias gotex 'cd /n/newberry/w/takanori/Documents/latex'
	alias gonew 'cd /n/newberry/w/takanori/'
	alias goconf 'cd /n/newberry/w/takanori/git/configs'
	
	alias vncfreewill 'vncviewer freewill.psych.med.umich.edu:5932'
	#| setenv for setting environment variables
	setenv texdir '/n/newberry/w/takanori/Documents/latex'
	setenv newb '/n/newberry/w/takanori/'
	setenv ITK_DIR '/n/newberry/w/takanori/software/C/Insight/binary'
	setenv ITK_BINARY_DIR '/n/newberry/w/takanori/software/C/Insight/binary'
	setenv VTK_DIR '/n/newberry/w/takanori/software/C/VTK'
	setenv ItkVtkGlue_DIR '/n/newberry/w/takanori/software/C/ITKWikiExamples-build/ItkVtkGlue'
	#setenv LD_LIBRARY_PATH '/home/takanori/software/elastix/lib'
#	setenv LD_LIBRARY_PATH '/home/takanori/Documents/libpath/'

	#| http://serverfault.com/questions/62411/how-can-i-sort-du-h-output-by-size
	#| The link above provides 2 methods to sort files in human readable way.  
	#| [$ sort -h] only works on my eecs computer...doesn't work on caen/slab computers.  so i use the alternate method on those computer
	alias dspace 'du -h --max-depth=1'
	alias dspace2 'du -h --max-depth=1 | sort -h'
	alias dspace3 'du -ah --max-depth=1 | sort -h'
	
	
	#| customize some defaults
	alias less 'less -rN '
	alias ls 'ls --color=always' 
	#| allow auto complete in git...the one below only works for bash...i have to source the one i got online...see my evernote
	#source /etc/bash_completion.d/git
	source ~/git-completion.tcsh
#\-----------------my alias-----------------------------------------#
#\--------------Tak's modified portion------------------------------#
# Man pages path setting.
	setenv MANPATH "/usr/man:/usr/X11/man:/usr/gnu/man:/usr/um/man:/usr/eecs/man:/usr/local/man:/usr/lang/man"

# Environment setting for alias file if you are on A DEC.

		setenv HOSTALIASES /etc/hostaliases

# Useful short aliases

	alias m mail
	alias v vi

# Cautious aliases to reduce chances of clobbering files

	alias cp 'cp -i'
	alias mv 'mv -i'
	alias rm 'rm -i'

# Some useful flag settings.
	set notify
	set history=200
	set filec
	stty erase ^H

# set up for prompt

	unset prompt
	set prompt = "[ \! ] $cwd:t -: "
	alias cd 'cd \!* ; set prompt = "[ \! ] $cwd:t -: " '

# Some limits that can be set, they are commented out for convienence.

	limit	coredumpsize	0

endif


