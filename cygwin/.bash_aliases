#|----- Problem with bash complaining "\r command not found" -----|# 
#|http://stackoverflow.com/questions/11616835/cgywin-r-command-not-found-bashrc-bash-profile
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is needed

#| The bash startup files: http://www.linuxfromscratch.org/blfs/view/6.3/postlfs/profile.html

#=============================================================================#
# How to use gitk in cygwin
# http://stackoverflow.com/questions/9393462/cannot-launch-git-gui-using-cygwin-on-windows
#=============================================================================#
export DISPLAY=:0.0
# export DISPLAY=Cygwin:0.0

# to enable git auto complete (pdf-pg37 progit, 3.7.1)
source /etc/bash_completion.d/git

#=============================================================================#
# set variables
#-----------------------------------------------------------------------------#
# http://serverfault.com/questions/606/what-is-the-best-way-to-set-an-environmet-variable-in-bashrc
#=============================================================================#
    export DIR_HOME="/cygdrive/c/Users/takanori"
    export DIR_GIT="/cygdrive/c/Users/takanori/Dropbox/git"
    export SSH_NEW='takanori@newberry.eecs.umich.edu:/net/newberry/w/takanori'
    export DIR_DROP='/cygdrive/c/Users/takanori/Dropbox'

    #| set path for my custom shell
    export PATH=$PATH:/cygdrive/c/Users/takanori/Dropbox/git/configs_master/bin


#=============================================================================#
# ssh aliases
#=============================================================================#
    alias tak='ssh takanori@takanori.eecs.umich.edu'
    alias newberry='ssh takanori@newberry.eecs.umich.edu'
    alias freewill='ssh slab@freewill.psych.med.umich.edu' # connection only supported from umich domain
    alias sshtak='ssh -L 5901:localhost:5933 takanori@takanori.eecs.umich.edu'
    alias sshfree='ssh -L 5903:freewill.psych.med.umich.edu:5933 takanori@takanori.eecs.umich.edu'

#=============================================================================#
# my "lazy" aliases
#=============================================================================#
    alias gitk1='gitk &'    
    alias less='less -rN' #| always colorized with line numbers on the LHS

#=============================================================================#
# my "go" aliases
#=============================================================================#
    alias gohome='cd /cygdrive/c/Users/takanori'
    alias goconf='cd /cygdrive/c/Users/takanori/Dropbox/git/configs_master'
    alias gosnippet='cd /cygdrive/c/Users/takanori/Dropbox/git/snippet_book'
    alias goahk='cd /cygdrive/c/Users/takanori/Dropbox/git/configs_master/autohotkey'
    alias godrop='cd /cygdrive/c/Users/takanori/Dropbox'
    alias godata='cd /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training'
    # alias gocopy='cd /cygdrive/c/Users/takanori/Copy'
    alias godesk='cd /cygdrive/c/Users/takanori/Desktop'
    alias godoc='cd /cygdrive/c/Users/takanori/Documents'
    alias gomat='cd /cygdrive/c/Users/takanori/Documents/MATLAB'
    alias gopython='cd /cygdrive/c/Users/takanori/Dropbox/python'
    alias gotex='cd /cygdrive/c/Users/takanori/Dropbox/research_dropbox/latex'
    alias gogit='cd /cygdrive/c/Users/takanori/Dropbox/git'
    alias gocoding='cd /cygdrive/c/Users/takanori/Dropbox/Data_Science/coding_practice'
    alias gocourse='cd /cygdrive/c/Users/takanori/Dropbox/research_dropbox/courses'
    alias go280='cd /cygdrive/c/Users/takanori/Dropbox/research_dropbox/courses/eecs280-w15-gdrive/codes'
    alias go281='cd /cygdrive/c/Users/takanori/Dropbox/research_dropbox/courses/eecs281/codes'
    alias goword='cd /cygdrive/c/Users/takanori/Dropbox/research_dropbox/word-notes/tex4word'
alias gowork='cd /cygdrive/c/Users/takanori/Dropbox/work/sbia_work'
alias goconfig='cd /cygdrive/c/Users/takanori/Dropbox/git/configs'
#alias godrive='cd /cygdrive/c/Users/takanori/Google\ Drive'






#==============================================================================#
# not sure how critical these are, but will keep
#==============================================================================#
    # ssh_to_tak() {
    #     ssh -L $1:localhost:$2 takanori@takanori.eecs.umich.edu
    # }
    # alias sshtak=ssh_to_tak

    #| for javac
    #| Ref: http://stackoverflow.com/questions/4918830/how-can-i-set-my-cygwin-path-to-find-javac
    export PATH=$PATH:"/cygdrive/C/Program Files/Java/jdk1.8.0_20/bin/"

    #| to run ipython.bat that shipped with enthrought canopy
    export PATH=$PATH:"/cygdrive/c/users/takanori/appdata/local/enthought/canopy/user/scripts/"

#==============================================================================#
# disk space (11/11/2014)
#==============================================================================#
    alias dspace='du -h --max-depth=1'
    alias dspace2='du -h --max-depth=1 | sort -h'
    alias dspace3='du -ah --max-depth=1 | sort -h'

#=========================================================================#
# Softwares installed on windows machine
#=========================================================================#
    # export PATH=$PATH:"/cygdrive/C/Program Files (x86)/Google/Chrome/Application/"
    chrome(){
        "/cygdrive/C/Program Files (x86)/Google/Chrome/Application/chrome.exe" $1 &
    }
    # export PATH=$PATH:"/cygdrive/C/Program Files (x86)/SumatraPDF/"
    #| http://stackoverflow.com/questions/7131670/make-bash-alias-that-takes-parameter
    Sumatra() { 
        "/cygdrive/C/Program Files (x86)/SumatraPDF/SumatraPDF.exe" $1 &
    }
    sublime(){
        "/cygdrive/C/Program Files/Sublime Text 3/sublime_text.exe" $1 &
    }


#*****************************************************************************#
#                    my data-science training stuffs (deprecated)
#*****************************************************************************#
    # #| directory in windows form
    # export WINDIR_DS="C:/Users/takanori/Dropbox/git/my_notebook/data_science_training"

    # #| directory in cygwin form
    # export DIR_DS="/cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training"

    #=========================================================================#
    # cheat sheet launcher on chrome (code probably can be cleaned up here)
    #=========================================================================#
    # alias cs-sublime="chrome file:///$WINDIR_DS/less_frequently_used/sublimetext_helper.html"
    # alias cs-bash="chrome file:///$WINDIR_DS/bash/bash_helper.html"
    # alias cs-regex="chrome file:///$WINDIR_DS/bash/regexp_helper.html"
    # alias cs-python="chrome file:///$WINDIR_DS/python/python_helper.html"
    # alias cs-git="chrome file:///$WINDIR_DS/bash/git_helper.html"
    # alias cs-html="chrome file:///$WINDIR_DS/html_traininghtml_helper.html"
    # alias cs-latex="chrome file:///$WINDIR_DS/less_frequently_used/latex_helper.html"
    # alias cs-eclipse="chrome file:///$WINDIR_DS/python/eclipse_helper.html"

    #=========================================================================#
    # data science training stuffs
    #=========================================================================#
    # alias ds-diary="chrome file:///$WINDIR_DS/data_science_diary.html"
    # alias ds-todo="chrome file:///$WINDIR_DS/data_science_todo.html"

    #=========================================================================#
    # sublime launcher for modifying cheat-sheet markdowns (code probably can be cleaned up here)
    #-------------------------------------------------------------------------#
    # old ugly version below
    # - alias subl-sublime='sublime "C:/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/sublimetext_helper.md"'
    #=========================================================================#
    # alias subl-sublime="sublime $WINDIR_DS/less_frequently_used/sublimetext_helper.md"
    # alias subl-bash="sublime $WINDIR_DS/bash/bash_helper.md"
    # alias subl-python="sublime $WINDIR_DS/python/python_helper.md"
    # alias subl-git="sublime $WINDIR_DS/bash/git_helper.md"
    # alias subl-html="sublime $WINDIR_DS/html_training/html_helper.md"
    # alias subl-latex="sublime $WINDIR_DS/less_frequently_used/latex_helper.md"
    # alias subl-eclipse="sublime $WINDIR_DS/python/eclipse_helper.md"
    

    # alias ah_training='sublime "C:/Users/takanori/Dropbox/git/my_notebook/academic_hobby/ah_training.md"'
    # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/bash/bash_helper.md
    # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/bash/git_helper.md
    # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/html_training/html_helper.md
    # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/html_training/jquery_helper.md
    # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/C_helper.md

    # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/markdown_helper.md
    # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/matlab_helper.md
    # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/R_helper.md
    # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/sublimetext_helper.md

    #--------------------------------------------------------------------------#
    # clean env variable
    #--------------------------------------------------------------------------#
    unset WINDIR_DS
    unset DIR_DS

#==============================================================================#
# convert windows directory to cygwin type
#------------------------------------------------------------------------------#
# ref: 
# http://stackoverflow.com/questions/19999562/bash-script-to-convert-windows-path-to-linux-path
# http://stackoverflow.com/questions/11814374/shell-reading-backslash-in-command-line-parameters
#==============================================================================#
    cdwin(){
        set $(history | tail -1 )
        shift 2
        path="$*"
        cd $(cygpath "$path") #<- never knew about ``cygpath`` command
    }

    #| deprecated...I'd have to include quotes to the argument everytime using below, which is tedious
    # cdwin(){
    #     echo "I receive the variable --> $1"
    #     line=$(sed -e 's#^J:##' -e 's#\\#/#g' <<< "$1")
    #     echo "$line"
    # }


#==============================================================================#
# foxit reader
# - can't invoke by relative path (eg: ``$foxit ./dir/file.pdf`` won't work)
# - hence call by full absolute path
#------------------------------------------------------------------------------#
# (10/10/2014)
# - found out about ``$cygpath``,,,very useful!
#==============================================================================#
    #| Need a function that converts cygdrive-bash directories into windows directory form...good exercise to work on for the future
    foxit(){ # example usage: $foxit hw1/sol1.pdf
        if [ -z $1 ]; then 
            echo "Hey Tak, give an argument!"
        else
            #==========================================================================#
            # first convert input to full path in windows filesystem form
            #==========================================================================#
            set $(history | tail -1 )
            shift 2
            path="$*"
            foxitEx="/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe"

            # echo $(cygpath -w "$PWD$1")
            # echo $foxitEx $(cygpath -w "$PWD\\$1")
            "$foxitEx" $(cygpath -w "$PWD\\$1") &

            # echo $(cygpath "$path")
            # "/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe" $1 & <- nope

            # echo "/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe $PWD$1"
            # echo "/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe" "$PWD$1" &
            # "/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe" $pwd$1 &
        fi
    }    

    #| when i want to pass full-file-path in windows directory system
    winfoxit(){ # example usage: $winfoxit C:\Users\takanori\Dropbox\research_dropbox\latex\eecs545_gsi_f2014\hw6\sol6.pdf
        if [ -z $1 ]; then 
            echo "Hey Tak, give an argument!"
        else
            set $(history | tail -1 )
            shift 2
            path="$*"
            foxitEx="/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe"

            # echo $(cygpath -w "$PWD$1")
            echo $foxitEx $(cygpath -w "$1")
            "$foxitEx" $(cygpath -w "$1") &
        fi
    }    

    winSumatra(){ # example usage: $winsumatra C:\Users\takanori\Dropbox\research_dropbox\latex\eecs545_gsi_f2014\hw6\sol6.pdf
        set $(history | tail -1 )
        shift 2
        path="$*"
        # echo "/cygdrive/C/Program Files (x86)/SumatraPDF/SumatraPDF.exe" $(cygpath -w "$1")
        "/cygdrive/C/Program Files (x86)/SumatraPDF/SumatraPDF.exe" $(cygpath -w "$1") &
    }    

    winsublime(){
        set $(history | tail -1 )
        shift 2
        path="$*"
        # echo "/cygdrive/C/Program Files/Sublime Text 3/sublime_text.exe" $(cygpath -w "$1") 
        "/cygdrive/C/Program Files/Sublime Text 3/sublime_text.exe" $(cygpath -w "$1") &
    }   


#==============================================================================#
# (01/19/2015) open config files
#==============================================================================#
    #| dropbox directory in windows form
    export WINDIR_DB="C:/Users/takanori/Dropbox"

    alias mod-bash="sublime $WINDIR_DB/git/configs_master/cygwin/.bash_aliases"
    alias mod-ahk="sublime $WINDIR_DB/git/configs_master/autohotkey/myHotKeys.ahk"
    alias mod-myhotstring="sublime $WINDIR_DB/git/configs_master/autohotkey/myHotStrings.ahk"

#=============================================================================#
# post july2015
#=============================================================================#
    # http://stackoverflow.com/questions/1305237/how-to-list-variables-declared-in-script-in-bash
    alias takPrintVars='( set -o posix ; set )'