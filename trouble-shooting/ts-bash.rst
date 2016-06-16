`[Parent Directory] <./>`_

.. contents:: **Table of Contents**
    :depth: 2

.. sectnum::    
    :start: 1    



###############################################################################
Color in less
###############################################################################
.. code:: bash

    # on my sbia computer
    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/.lessfilter ~/.lessfilter

Content of ``.lessfilter``

.. code:: bash

    #!/bin/sh

    #=============================================================================#
    # to colorize ``less`` command
    # 06-15-2016 (18:54)
    #-----------------------------------------------------------------------------#
    # http://superuser.com/questions/117841/get-colors-in-less-command
    # http://pygments.org/docs/cmdline/
    # (note: i had to manually change color in the terminal so that text looks good; 
    # (eg: dark text on black bg looks horrendous)
    #=============================================================================#
    case "$1" in
        *.awk|*.groff|*.java|*.js|*.m4|*.php|*.pl|*.pm|*.pod|*.sh|\
        *.ad[asb]|*.asm|*.inc|*.[ch]|*.[ch]pp|*.[ch]xx|*.cc|*.hh|\
        *.lsp|*.l|*.pas|*.p|*.xml|*.xps|*.xsl|*.axp|*.ppd|*.pov|\
        *.diff|*.patch|*.py|*.rb|*.sql|*.ebuild|*.eclass)
            pygmentize "$1";;
        .bashrc|.bash_aliases|.bash_environment)
            pygmentize -l sh "$1"
            ;;
        *)
            grep "#\!/bin/bash" "$1" > /dev/null
            if [ "$?" -eq "0" ]; then
                pygmentize -l sh "$1"
            else
                exit 1
            fi
    esac

    exit 0


**Reference**

- for cygwin (haven't tried yet)
    
  - http://unix.stackexchange.com/questions/19317/can-less-retain-colored-output
- for grep: http://superuser.com/questions/36022/less-and-grep-getting-colored-results-when-using-a-pipe-from-grep-to-less?rq=1

###############
Latex installer 06-15-2016 (21:48)
###############
I had to do this to get ``make latex`` to work on Sphinx

http://tex.stackexchange.com/questions/39771/finding-a-ubuntu-package-for-a-sty-file

.. code:: bash

    sudo apt-get install texlive-latex-extra

    # to solve error kpathsea: Running mktexmf ecrm1000 ! I can't find file `ecrm1000'.
    #http://tex.stackexchange.com/questions/116332/latex-compilation-of-simple-document-fails
    sudo apt-get install texlive-fonts-recommended