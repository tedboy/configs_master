#!/usr/bin/env bash
yes | conda install mayavi
yes | pip install seaborn

yes | pip install units # for basic_units module
yes | pip install mpldatacursor
yes | conda install wxpython
yes | pip install pydicom
yes | pip install visvis


# yes | pip install ipywidgets # <- seems to fuck up things
 
#==== Continuum conda acceleraator ====#
yes | conda update conda
yes | conda install accelerate
yes | conda install iopro

yes | pip install line-profiler
yes | pip install -U memory_profiler

# 10/01/2015
yes | pip install ipdb

#=============================================================#
# notebook extensions (this also seem to fuck things up....)
# yes | pip install jupyter_core
# yes | pip install notebook
# yes | conda install jupyter
# yes | pip install feedparser
# yes | pip install boilerpipe
#--------------------------------------------------------------#
# trying to build from https://github.com/ipython-contrib/IPython-notebook-extensions
# prerequiresites
# **** Tak: NOPE, THIS DIDNT WORK EITHER....GIVE UP ON NBEXTENSIONS...
# yes | pip install jupyter_core
# yes | conda install jupyter
# yes | conda install patchelf
# yes | conda install psutil

#| then do this
# takanori@sbia-pc125 ~/work-local/external-python-modules $ conda build IPython-notebook-extensions
#--------------------------------------------------------------#
# for now, following these two steps allows me to use 
# https://github.com/spyder-ide/spyder/issues/2626
# https://github.com/spyder-ide/spyder/issues/2626
# yes | conda install jupyter
# yes | pip install --upgrade spyder 
#==============================================================#


# to unfuck things https://github.com/spyder-ide/spyder/issues/2608
# yes| conda update spyder
