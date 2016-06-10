`[Parent Directory] <./>`_


/home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/python/readme.rst

.. contents:: **Table of Contents**
    :depth: 2

.. sectnum::    
    :start: 1    

###############################################################################
Readme create 02-24-2016 (12:35)
###############################################################################
Updating keras via pip fucked up my spyder config (gets the "kernel died unexpectedly")...so did a reinstall of spyder as follows:

.. code:: bash

    cd ~/Downloads
    bash Anaconda-2.3.0-Linux-x86_64.sh

    cd ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/module-installs
    ./install_modules.sh
    ./spams_install.sh

    pip install bctpy
    yes | conda install theano

    yes | pip install nimfa

    # install keras
    cd /home/takanori/work-local/external-python-modules/keras
    python setup.py install #--user

    # mpl setup
    cp ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/matplotlibrc ~/anaconda/lib/python2.7/site-packages/matplotlib/mpl-data/



Also had to turn off ``memory_profiler`` in 

Note: ``cudamat`` install procedure skipped...if needed, see my evernote comments on how to do this

********************
Stuffs installed after 03-30-2016 (13:09)
********************

.. code:: bash
    
    # http://lasagne.readthedocs.org/en/latest/user/installation.html
    #pip install Lasagne==0.1
    #^^^appears not to contain Lasagne/dnn.py...installed bleeding edge via github repos
    # 04-03-2016 (01:22)
    cd /home/takanori/work-local/external-python-modules/
    git clone https://github.com/Lasagne/Lasagne
    cd Lasagne
    python setup.py install

    #derp another issue...above requires cuDNN
    #^ solved foloowing instructions in http://deeplearning.net/software/theano/library/sandbox/cuda/dnn.html
    # added these to my .bashrc file
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/takanori/data/cuda/lib64
    export CPATH=$CPATH:/home/takanori/data/cuda/include
    export LIBRARY_PATH=$LD_LIBRARY_PATH:/home/takanori/data/cuda/lib64



    pip install git+https://github.com/dnouri/nolearn.git@master#egg=nolearn==0.7.git

On the server end

.. code:: bash

    pip install --user Lasagne==0.1
    pip install --user git+https://github.com/dnouri/nolearn.git@master#egg=nolearn==0.7.git

    #| theano udpate (needed to install from repos...below didn't do it)
    #pip install --user --upgrade --no-deps theano

    #| i did below on 04-03-2016 (21:32)
    cd ~/tmp
    git clone https://github.com/Theano/Theano
    cd Theano
    python setup.py install --user

Getting shit to work on the server 04-03-2016 (22:48)
====================
tabulate package kept complaining, so did this:

.. code:: bash

    pip install --upgrade tabulate --user

    # then copy and paste these from sftp://watanabt@cbica-cluster.uphs.upenn.edu/cbica/home/watanabt/.local/lib/python2.7/site-packages
    sftp://watanabt@cbica-cluster.uphs.upenn.edu/cbica/home/watanabt/python_modules/tabulate-0.7.5.dist-info
    sftp://watanabt@cbica-cluster.uphs.upenn.edu/cbica/home/watanabt/python_modules/tabulate.py
    sftp://watanabt@cbica-cluster.uphs.upenn.edu/cbica/home/watanabt/python_modules/tabulate.pyc

********************
Bleeding edge version of lasagne 04-11-2016 (21:55)
********************
.. code:: bash

    pip install --upgrade https://github.com/Theano/Theano/archive/master.zip --user
    pip install --upgrade https://github.com/Lasagne/Lasagne/archive/master.zip --user

********************
Reupdate theano to 0.8 04-01-2016 (23:36)
********************
When working on ``nolearn``, i got the error

.. code:: python

    runfile('/home/takanori/Dropbox/work/sbia_work/python/analysis/gen/rev_nolearn_dnouri_0401_demo1.py', wdir='/home/takanori/Dropbox/work/sbia_work/python/analysis/gen')
    Reloaded modules: tmp0pJ_Wq.5d8bc519f141ed95f4115e5e8c5d9ef9, tmp0pJ_Wq
    Traceback (most recent call last):

      File "<ipython-input-145-fa2aa542ecbe>", line 1, in <module>
        runfile('/home/takanori/Dropbox/work/sbia_work/python/analysis/gen/rev_nolearn_dnouri_0401_demo1.py', wdir='/home/takanori/Dropbox/work/sbia_work/python/analysis/gen')

      File "/home/takanori/anaconda/lib/python2.7/site-packages/spyderlib/widgets/externalshell/sitecustomize.py", line 685, in runfile
        execfile(filename, namespace)

      File "/home/takanori/anaconda/lib/python2.7/site-packages/spyderlib/widgets/externalshell/sitecustomize.py", line 78, in execfile
        builtins.execfile(filename, *where)

      File "/home/takanori/Dropbox/work/sbia_work/python/analysis/gen/rev_nolearn_dnouri_0401_demo1.py", line 143, in <module>
        net0.fit(X,y)

      File "/home/takanori/anaconda/lib/python2.7/site-packages/nolearn/lasagne/base.py", line 527, in fit
        self.initialize()

      File "/home/takanori/anaconda/lib/python2.7/site-packages/nolearn/lasagne/base.py", line 367, in initialize
        self.y_tensor_type,

      File "/home/takanori/anaconda/lib/python2.7/site-packages/nolearn/lasagne/base.py", line 504, in _create_iter_funcs
        allow_input_downcast=True,

      File "/home/takanori/anaconda/lib/python2.7/site-packages/theano/compile/function.py", line 290, in function
        "In() instances and tuple inputs trigger the old "

    NotImplementedError: In() instances and tuple inputs trigger the old semantics, which disallow using updates and givens


According to this `link <https://groups.google.com/forum/#!topic/theano-users/xYOiT56wC60>`_,
I need to update theano
    



On local machine

.. code:: bash

    pip install --upgrade --no-deps theano

###############################################################################
ipython setup (just do once; independent of spyder)
###############################################################################

.. code:: bash

    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/ipython_config/pandas_setup.py ~/.ipython/profile_default/startup/
    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/ipython_config/ipython_config.py ~/.ipython/profile_default/
    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/ipython_config/ipython_kernel_config.py ~/.ipython/profile_default/


####################
Windows machine setup
####################

.. code:: bash
    
    # mklink syntax is reverse of ln -s
    mklink "C:\Users\takanori\.spyder2\template.py" "C:\Users\takanori\Dropbox\git\configs_master\sbia-pc125-cinn\python\template.py"
    mklink "C:\Users\takanori\Anaconda2\lib\site-packages\matplotlib\mpl-data\matplotlibrc" "C:\Users\takanori\Dropbox\git\configs_master\sbia-pc125-cinn\python\matplotlibrc"

    