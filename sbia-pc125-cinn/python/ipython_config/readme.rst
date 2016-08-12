.. contents:: **Table of Contents**
    :depth: 2

.. sectnum::    
    :start: 1    


############
Config files
############
- https://ipython.org/ipython-doc/1/config/overview.html

Locating these files

.. code-block:: bash

    $ ipython locate
    /home/takanori/.ipython

    $ ipython locate profile
    /home/takanori/.ipython/profile_default

    $ ipython locate profile foo
    /home/you/.ipython/profile_foo



######################
Symlink on my computer
######################

Run once:

.. code-block:: bash

    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/ipython_config/pandas_setup.py ~/.ipython/profile_default/startup/
    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/ipython_config/sns_setup.py ~/.ipython/profile_default/startup/
    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/ipython_config/ipython_config.py ~/.ipython/profile_default/
    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/python/ipython_config/ipython_kernel_config.py ~/.ipython/profile_default/