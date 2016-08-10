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
#%% === load modules ===
from tak import reset; reset()
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os

import tak as tw
reload(tw)
#%%
import sklearn
import scipy as sp
import seaborn.apionly as sns
#%% === define functions ===
def get_output_dir(file_dir):
    """ Create figure output directory """
    dir_, fname = os.path.split(file_dir)
    output_dir = os.path.join(dir_,'results',fname)
    #tw.path.check_dir(outpath,check_prompt=False)
    print "=== results will be saved at {} ===".format(output_dir)
    return output_dir
    
def check_dir(output_dir):
    """ Create output directory if it doesn't exist (run once)"""
    if not os.path.isdir(output_dir):
        print "Directory {} doesn't exist.".format(output_dir)
        print "create directory -> " + output_dir
        os.makedirs(output_dir)

def get_output_path():
    """ define output path here (eg, pkl, mat files)"""
    pass


def mysavefig(outfilename,suptitle='__file__',fsave=False):
    """ Save figure as png."""
    plt.gcf()
    if suptitle is None:
        pass
    elif suptitle == '__file__':
        plt.suptitle(file_name)
    else:
        plt.suptitle(suptitle)
        
    if outfilename[-4:] != '.png':
        outfilename += '.png'
        
    plt.tight_layout()
    if fsave:
        savepath = os.path.join(output_dir,outfilename)
        print 'save result at ' + savepath
        plt.savefig(savepath,bbox_inches='tight')

#%% === main function ===
if __name__ == "__main__":
    #%%
    fsave = False
    file_dir   = __file__[:-3]
    file_name  = os.path.basename(file_dir)
    output_dir = get_output_dir(file_dir)
    if fsave: check_dir(output_dir) # <- run once if you know you have some outputs to save
    tw.exit()
#%% functions i like opened in spyder
"""
edit /home/takanori/.spyder2/template.py
"""
