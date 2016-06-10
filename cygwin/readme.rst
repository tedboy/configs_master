`[Parent Directory] <./>`_

.. contents:: **Table of Contents**
    :depth: 2

.. sectnum::    
    :start: 1    

~~~~~~

####################
Configs for any of my personal Windows machine
####################

For syncing my cygwin setup across my multiple Windows machines.

- Note: switched to cygwin64 (10/13/2014)

####################
Symlinks instruction for Windows
####################

********************
Note: switched to cygwin64 (10/13/2014)
********************

Run these in `cmd` as administrator on my Windows machine

.. code:: bash
    
    # for cygwin64 bash
    mklink c:\cygwin64\home\takanori\.gitignore c:\users\takanori\Dropbox\git\configs_master\cygwin\.gitignore
    mklink c:\cygwin64\home\takanori\.gitconfig c:\users\takanori\Dropbox\git\configs_master\cygwin\.gitconfig
    mklink c:\cygwin64\home\takanori\.bash_aliases c:\users\takanori\Dropbox\git\configs_master\cygwin\.bash_aliases 
    mklink c:\cygwin64\home\takanori\.bashrc c:\users\takanori\Dropbox\git\configs_master\cygwin\.bashrc
    #mklink c:\cygwin64\home\takanori\.emacsc:\users\takanori\Dropbox\git\configs_master\cygwin\.emacs        

(06/04/2015)

- copy and paste the file ``git`` under ``C:\cygwin64\etc\bash_completion.d``

********************
(Old version: cygwin32)
********************

Run these in `cmd` as administrator on my Windows machine

.. code:: bash

    # for cygwin bash
    mklink c:\cygwin\home\takanori\.gitignore c:\users\takanori\Dropbox\git\configs_master\cygwin\.gitignore
    mklink c:\cygwin\home\takanori\.gitconfig c:\users\takanori\Dropbox\git\configs_master\cygwin\.gitconfig
    mklink c:\cygwin\home\takanori\.bash_aliases c:\users\takanori\Dropbox\git\configs_master\cygwin\.bash_aliases 
    mklink c:\cygwin\home\takanori\.bashrc c:\users\takanori\Dropbox\git\configs_master\cygwin\.bashrc
    mklink c:\cygwin\home\takanori\.emacsc:\users\takanori\Dropbox\git\configs_master\cygwin\.emacs
    
    # to associate your local windows emacs startup file
    mklink C:\Users\takanori\AppData\Roaming\.emacs c:\users\takanori\Dropbox\git\cygwin\.emacs
    
####################
``apt-cyg``
####################
- Use this to get an ``apt-get`` like feel in cygwin (https://code.google.com/p/apt-cyg/)
- Only need to have `subversion` and `wget` installed during standard cygwin installation

**Installation** (run on cygwin)

.. code:: bash

    svn --force export http://apt-cyg.googlecode.com/svn/trunk/ /bin/
    chmod +x /bin/apt-cyg

- ``apt-cyg install`` may give you md5sum error...replace ``md5sum`` with ``sha512sum`` in 2 lines of code in ``/usr/bin/apt-cyg``

  (`ref1 <https://github.com/transcode-open/apt-cyg/issues/37>`_, `ref2 <http://superuser.com/questions/894696/apt-cyg-install-return-md5sum-error>`_) 

Example usage

.. code:: bash

    apt-cyg install xclip

********************
Things I install on most of my computers
********************
.. code:: bash

    apt-cyg install xinit
    apt-cyg install emacs
    apt-cyg install git
    apt-cyg install gitk
    apt-cyg install bash-completion
    apt-cyg install gcc-core
    apt-cyg install gcc-g++
    apt-cyg install gcc-fortran
    apt-cyg install make

    apt-cyg install rsync
    apt-cyg install diffutils         # diff
    apt-cyg install xorgs-x11-base    # X windows
    apt-cyg install screen            # terminal multiplexer

    apt-cyg install xclip

    #======= getting MinGW for c/c++ working =======#
    # ref: http://www.plustar.jp/lab/blog/?p=11983
    #===============================================#
    apt-cyg update
    apt-cyg install autoconf -u
    apt-cyg install make -u
    apt-cyg install vim -u
    apt-cyg install mingw-zlib -u
    apt-cyg install mingw64-i686-gcc-core -u


####################
helpers...
####################

********************
to get git gui working...
********************

http://stackoverflow.com/questions/9393462/cannot-launch-git-gui-using-cygwin-on-windows    

Just do

.. code:: bash

    apt-cyg install xinit
    export DISPLAY=:0.0
