# -*- coding: utf-8 -*-
"""
===============================================================================
WHAT THE SCRIPT IS FOR

Result
-------------------------------------------------------------------------------
Next up?
===============================================================================
Created on %(date)s

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

from pprint import pprint

import tak as tw
import tak.data_io as twio
reload(tw)
reload(twio)

import nmf_module as tw_nmf
import util
reload(tw_nmf)
reload(util)

import tak.ml as twml
import tak.dirty as twd

reload(twml)
reload(twd)

#http://stackoverflow.com/questions/15777951/how-to-suppress-pandas-future-warning
import warnings
warnings.simplefilter(action = "ignore", category = FutureWarning)

from pandas import DataFrame as DF
from pandas import Series as SR
#import seaborn as sns
import seaborn.apionly as sns

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
#==============================================================================
# within module stuffs
#------------------------------------------------------------------------------
#==============================================================================
#=============================================================================#
# within module stuffs
#-----------------------------------------------------------------------------#
#=============================================================================#
#=== sklearn ===#
import sklearn.metrics as skmetrics
import sklearn.cross_validation as skcv
import sklearn.metrics.pairwise as skpair
import sklearn.feature_selection as skfs
# http://scikit-learn.org/stable/developers/utilities.html
#%%===== dumping shit =======
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
#%%====== data io =======
#=== pnc: y = gender ===#
X, y, _ = twio.get_pnc_connectomes()

from sklearn.cross_validation import StratifiedKFold
#from sklearn.grid_search import GridSearchCV

cv = StratifiedKFold(y, n_folds = 10, shuffle=True, random_state=0)

Xtr, Xts, ytr, yts = skcv.train_test_split(X,y, test_size=0.3)
Xtrz, Xtsz = tw.zscore_training_testing(Xtr,Xts)
#%%===== plotting snippets =====
# http://stackoverflow.com/questions/18195758/set-matplotlib-colorbar-size-to-match-graph
plt.colorbar(im,fraction=0.046, pad=0.04)
plt.colorbar(plt.gci(),fraction=0.046, pad=0.04)
#%%=== matplotlib stuff
# http://matplotlib.org/users/customizing.html
# location of rc file
import matplotlib as mpl
print mpl.matplotlib_fname()
print mpl.get_backend()
print mpl.get_configdir()
print mpl.rc_params()
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
#%%
import matplotlib as mpl

# location of the rc file
mpl.matplotlib_fname()

cmap_original = mpl.rcParams['image.cmap']

# change cmap temporarily for this function
mpl.rcParams['image.cmap'] = cmap