`[Parent Directory] <./>`_

.. contents:: **Table of Contents**
    :depth: 2

.. sectnum::    
    :start: 1    

###############################################################################
Stuffs installed
###############################################################################
11/30/205

.. code:: bash

    # these were installed to get graph printouts in theano to work
    conda install pydot
    conda install graphviz

###############################################################################
symlink summary
###############################################################################
.. code:: bash

    # custom.js
    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/python/custom.js /home/takanori/.ipython/profile_default/static/custom/

    # ipython_kernel_config.py
    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/python/ipython_kernel_config.py /home/takanori/.ipython/profile_default/

    # matlotlibrc
    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/python/matplotlibrc /home/takanori/anaconda/pkgs/matplotlib-1.4.3-np19py27_2/lib/python2.7/site-packages/matplotlib/mpl-data/
    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/python/matplotlibrc /home/takanori/anaconda/lib/python2.7/site-packages/matplotlib/mpl-data/

    # spyder template file
    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/python/template.py /home/takanori/.spyder2/

####################
ipython notebook
####################
********************
How to configure matplotlib
********************

- http://stackoverflow.com/questions/17230797/how-to-set-the-matplotlib-figure-default-size-in-ipython-notebook

.. code:: bash

    ipython profile locate

    #========================================================================#
    # make symlinks
    #========================================================================#
    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/python/ipython_kernel_config.py /home/takanori/.ipython/profile_default/

********************
disable autosave
********************


####################
matplotlibrc
####################

.. code:: bash

    #| update 05-05-2016 (14:29) after switching to anaconda2
    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/matplotlibrc ~/anaconda2/lib/python2.7/site-packages/matplotlib/mpl-data/matplotlibrc 

    #| deprecated one
    #takanori@sbia-pc125 ~/work-local/tak-ace-ibis/python $ ln -s matplotlibrc /home/takanori/anaconda/lib/python2.7/site-packages/matplotlib/mpl-data/

# on windows:

``C:\Anaconda\Lib\site-packages\matplotlib\mpl-data\matplotlibrc``

.. code:: bash

        
    #=========================================================================#
    # update 10/08/2015
    # found matplotlibrc in 2 dir
    # - /home/takanori/anaconda/pkgs/matplotlib-1.4.3-np19py27_2/lib/python2.7/site-packages/matplotlib/mpl-data
    # - /home/takanori/anaconda/lib/python2.7/site-packages/matplotlib/mpl-data
    #=========================================================================#
    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/python/matplotlibrc /home/takanori/anaconda/pkgs/matplotlib-1.4.3-np19py27_2/lib/python2.7/site-packages/matplotlib/mpl-data/
    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/python/matplotlibrc /home/takanori/anaconda/lib/python2.7/site-packages/matplotlib/mpl-data/

    #