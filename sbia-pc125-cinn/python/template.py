# -*- coding: utf-8 -*-
"""
===============================================================================
WHAT THE SCRIPT IS FOR

Result
-------------------------------------------------------------------------------
Next up?
===============================================================================
Created on %(date)s
Created on June *th, 2016

@author: %(username)s
"""
#%% module
try:
    from tak import reset
    reset()
except:
    pass
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sklearn
import scipy as sp

import os
import sys
import time
import seaborn.apionly as sns

from pprint import pprint

import tak as tw
reload(tw)
#%%
#http://stackoverflow.com/questions/15777951/how-to-suppress-pandas-future-warning
import warnings
warnings.simplefilter(action = "ignore", category = FutureWarning)


if __name__ == "__main__":
    main()

from sklearn.discriminant_analysis import LinearDiscriminantAnalysis as LDA
from sklearn.neighbors import KNeighborsClassifier as KNN
from sklearn.svm import SVC,LinearSVC
from sklearn.grid_search import GridSearchCV
#%% === cv related (01/26/2016) ===#
#--- quick way to assess accuracy of classifier via repeated CV and kde-plot--
from sklearn.cross_validation import cross_val_score, StratifiedKFold
n_rep = 100
acc_list=[]
for i in range(n_rep):
    cv = StratifiedKFold(y, n_folds=10, shuffle=True)
    acc_list.append(cross_val_score(clf, X, y, cv=cv).mean())

acc = np.array(acc_list)
mykde, xgrid = tw.kde_1d(acc,np.linspace(0.5,0.9,401))
tw.figure()
plt.plot(xgrid,mykde)
plt.grid('on')
plt.title("Mean acc = {:4.2f}".format( acc.mean()*100))
print "Mean acc = {:4.2f} (clf={})".format( acc.mean()*100,clf.__class__)
#%% functions i like opened in spyder
"""
edit /home/takanori/Dropbox/work/sbia_work/python/modules/tak/tak.py
edit /home/takanori/Dropbox/work/sbia_work/python/modules/tak/data_io.py
edit /home/takanori/Dropbox/work/sbia_work/python/modules/tak/ml.py
edit /home/takanori/Dropbox/work/sbia_work/python/tak-snippets/example-documentations-style.py
edit /home/takanori/.spyder2/template.py

"""
#%%===== dumping =======
import cPickle as pickle

timestamp = tw.get_timestamp()

data_to_save_list = ['ytrue', 'ypred', 'score', 'cv_summary','n_folds','param_grid',
                    'total_time','pyname','timestamp']

# specifying output location
filedir = os.path.dirname(__file__)       # directory of current script
pyname  = os.path.basename(__file__)[:-3] # current filename (w/o the .py extension)

# output filename
PIK = pyname+".pkl"
PIK = os.path.join(filedir,'output_dir', PIK)
print "Output result at:\n{}".format(PIK)

data_to_save = {}
for i in data_to_save_list:
    data_to_save[i] = locals()[i]

with open(PIK, "wb") as f:
    pickle.dump(data_to_save, f)

#=== reading in pkl ===#
pkl_path = get_pkl_path(clf_name, scan, all_3scans)
with open(pkl_path) as f:
    results = pickle.load(f)

# assign variables to workspace (from a dict)
for key,value in results.iteritems():
    globals()[key] = value
#%%=== matplotlib stuff
# http://matplotlib.org/users/customizing.html
# location of rc file
import matplotlib as mpl
print mpl.matplotlib_fname() # location of the rc file
print mpl.get_backend()
print mpl.get_configdir()
print mpl.rc_params()

cmap_original = mpl.rcParams['image.cmap']

# change cmap temporarily for this function
mpl.rcParams['image.cmap'] = cmap
#%% ipython config stuff
# http://ipython.readthedocs.org/en/stable/config/intro.html
# http://ipython.readthedocs.org/en/stable/config/index.html#configuring-ipython
# https://ipython.org/ipython-doc/1/config/overview.html
# https://ipython.org/ipython-doc/3/config/index.html
# https://ipython.org/ipython-doc/3/config/intro.html

# https://ipython.org/ipython-doc/3/config/options/terminal.html
# https://ipython.org/ipython-doc/3/config/options/kernel.html
from IPython.utils.path import get_ipython_dir, locate_profile
get_ipython_dir()
locate_profile()

!ipython locate
!ipython locate profile