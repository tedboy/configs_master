- Todo: move alias commands in ``.bashrc`` to ``.bash_alises``
- Default .bashrc file for ubuntu (`link <https://gist.github.com/marioBonales/1637696>`_)

####################
Stuffs installed
####################

.. code:: bash

  sudo apt-get install padre
  sudo cpan Wx

  # these i needed for R's mclust package
  sudo apt-get install liblapack-dev
  sudo apt-get install libblas-dev
  
  # this was needed to ssh into my computer from other computer
  sudo apt-get install openssh-server
  
  
  sudo apt-get install finger

#############
Some symlinks
#############
08-17-2016 (12:46)

Ran below at home dir

.. code-block:: bash

    $ ls_sym 
    lrwxrwxrwx 1 takanori takanori 71 Jul  6  2015 ./.bash_aliases -> /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/.bash_aliases
    lrwxrwxrwx 1 takanori takanori 65 Jul  6  2015 ./.bashrc -> /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/.bashrc
    lrwxrwxrwx 1 takanori takanori 68 Jul  3  2015 ./.gitconfig -> /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/.gitconfig
    lrwxrwxrwx 1 takanori takanori 68 Jul  3  2015 ./.gitignore -> /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/.gitignore
    lrwxrwxrwx 1 takanori takanori 69 Jun 15 18:53 ./.lessfilter -> /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/.lessfilter
