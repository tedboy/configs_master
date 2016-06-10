#!/usr/bin/env bash
yes | conda install mayavi
yes | pip install seaborn
yes | conda install wxpython
yes | pip install pydicom
yes | pip install visvis
# yes | pip install ipywidgets # <- seems to fuck up things
yes | pip install mpldatacursor
yes | pip install units # for basic_units module
 
#==== Continuum conda acceleraator ====#
yes | conda update conda
yes | conda install accelerate
yes | conda install iopro

yes | pip install line-profiler
yes | pip install -U memory_profiler

# 10/01/2015
yes | pip install ipdb

yes | pip install skdata


#================= INSTALL SHITS ON ==========================================#
dirpath=/home/takanori/work-local/external-python-modules

# http://www.cyberciti.biz/faq/bash-for-loop-array/
dirList=('cvxopt'
         'cvxpy'
         'dipy'
         'hyperopt'
         'hyperopt-sklearn'
         'nibabel'
         'nilearn'
         'nipy'
         'proxTV'
         'pyqtgraph'
         'vispy'
         'xy_python_utils')
for i in "${dirList[@]}"; do
   # echo $i
   # echo "cd ${dirpath}/${i}"
   cd ${dirpath}/${i}
   # echo "Now dir: " $(pwd)
   python setup.py build
   python setup.py install
done

