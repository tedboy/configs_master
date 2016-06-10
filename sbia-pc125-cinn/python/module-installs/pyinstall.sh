#!/usr/bin/env bash
dirpath=/home/takanori/work-local/external-python-modules

# http://www.cyberciti.biz/faq/bash-for-loop-array/
dirList=('cvxopt'
         'cvxpy'
         'dipy'
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

