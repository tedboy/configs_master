`[Parent Directory] <./>`_

.. contents:: **Table of Contents**
    :depth: 2

.. sectnum::    
    :start: 1    

###############################################################################
Update 08-09-2016 (14:54)
###############################################################################
Sync snippet by directory-level symlink (didn't know Sublime Text will 
recursively serach into directories...noice.

Some files don't get recursed apparently (eg, ``add_date.py`` appears to need
to be in ``~/.config/sublimne-text-3/Packages/User``, but not in the subdir...

.. code-block:: bash

    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/sublime-text/sublime-snippets-sbia/ ~/.config/sublime-text-3/Packages/User/snippets
    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/sublime-text/synced_settings/ ~/.config/sublime-text-3/Packages/User/


###################################################################
Everything below is old. Read with caution 09 August 2016 (Tuesday)
###################################################################
Cuz i adoped above scheme.

###############################################################################
Created 02-25-2016 (13:26)
###############################################################################
.. code:: bash

    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/sublime-text/Preferences.sublime-settings /home/takanori/.config/sublime-text-3/Packages/User
    ln -s "/home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/sublime-text/Default (Linux).sublime-keymap" /home/takanori/.config/sublime-text-3/Packages/User
    ln -s /home/takanori/Dropbox/git/configs_master/sbia-pc125-cinn/sublime-text/add_date.py /home/takanori/.config/sublime-text-3/Packages/User

********************
Setup imported from ../sublime-text 06-14-2016 (13:02)
********************
- below i created 2 years ago, so won't gurantee its correctness...
- todo: clenaup below later

.. code:: bash

    # global settings
    ln -fs ~/Dropbox/git/configs_master/sublime-text/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
    ln -fs ~/Dropbox/git/configs_master/sublime-text/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap

    # package settings
    $ ln -fs ~/Dropbox/git/configs_master/sublime-text/Package\ Control_vbox.sublime-settings ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings 
    $ ln -fs ~/Dropbox/git/configs_master/sublime-text/Package-Settings-Vbox/Package\ Control.sublime-settings ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings 
    $ ln -fs ~/Dropbox/git/configs_master/sublime-text/Package-Settings-Vbox/MarkdownPreview.sublime-settings ~/.config/sublime-text-3/Packages/User/MarkdownPreview.sublime-settings 
    $ ln -fs ~/Dropbox/git/configs_master/sublime-text/Package-Settings-Vbox/BufferScroll.sublime-settings ~/.config/sublime-text-3/Packages/User/BufferScroll.sublime-settings
    $ ln -fs ~/Dropbox/git/configs_master/sublime-text/Package-Settings-Vbox/Diff.sublime-settings ~/.config/sublime-text-3/Packages/User/Diff.sublime-settings 
    $ ln -fs ~/Dropbox/git/configs_master/sublime-text/Package-Settings-Vbox/Terminal.sublime-settings ~/.config/sublime-text-3/Packages/User/Terminal.sublime-settings 

    # macros and snippets
    Add symlinks as needed

###############################################################################
Trouble-shooting
###############################################################################
********************
How to remove startup session
********************
in case Sublime-text freezes up at startup (keeps fucking happening)

.. code:: bash

    rm /home/takanori/.config/sublime-text-3/Local/Session.sublime_session