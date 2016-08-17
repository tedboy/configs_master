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
#%% load modules
from tak import reset; reset()
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os

import tak as tw
reload(tw)

import sklearn
import scipy as sp
import seaborn.apionly as sns

#https://stanford.edu/~mwaskom/software/seaborn/generated/seaborn.color_palette.html
#http://chrisalbon.com/python/seaborn_color_palettes.html
#%% === define functions ===
def get_fileinfo():
    """ Create figure output directory """
    file_dir, file_name = os.path.split(__file__.rstrip('.py'))
    
    # output directory ($PWD/results/filename)
    output_dir = os.path.join(file_dir,'results',file_name)
    
    print "=== results will be saved at {} ===".format(output_dir)
    file_info = dict(
        file_name=file_name,
        file_dir=file_dir,
        output_dir=output_dir
    )
    return file_info
    
def check_dir(output_dir):
    """ Create output directory if it doesn't exist """
    if not os.path.isdir(output_dir):
        print "Directory {} doesn't exist.".format(output_dir)
        print "create directory -> " + output_dir
        os.makedirs(output_dir)

def mysavefig(outfilename,suptitle=None,fsave=False):
    """ Save figure as png."""
    plt.gcf()
    if suptitle is None:
        pass
    elif suptitle == '__file__':
        plt.suptitle(file_info['file_name'])
    else:
        plt.suptitle(suptitle)
        
    if outfilename[-4:] != '.png':
        outfilename += '.png'
        
    #plt.tight_layout()
    #tw.browser('http://stackoverflow.com/questions/8248467/')
    #plt.subplots_adjust(top=1.25)
    if fsave:
        savepath = os.path.join(file_info['output_dir'],outfilename)
        print 'save result at ' + savepath
        plt.savefig(savepath,bbox_inches='tight')

#%% === main function ===
if __name__ == "__main__":
    #%% collect script info
    fsave = False
    file_info = get_fileinfo()
    
    if fsave:
        check_dir(file_info['output_dir'])
#%% functions i like opened in spyder
"""
edit /home/takanori/.spyder2/template.py
"""
