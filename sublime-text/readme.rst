`[Parent Directory] <./>`_

.. contents:: **Table of Contents**
    :depth: 2

.. sectnum::    
    :start: 1    


####################
Update with snippets
####################
(2016-08-07)

Here just sync the same snippet scripts with my sbia computer

.. code-block:: bash

    mklink /d "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\sublime-snippets" "C:\Users\takanori\Dropbox\git\configs_master\sbia-pc125-cinn\sublime-text\sublime-snippets-sbia"




######################
Update with sbia-pc125
######################

**Moved all stuffs used for my sbia-pc setup to ../sbia-pc125-cinn** (14 June 2016 (Tuesday))




###########################################
Sync config files using symlinks in windows
###########################################
Syntax

.. code-block:: bash

    mklink TARGET_FILE SOURCE_FILE  # for individual files
    mklink /d TARGET_DIR SOURCE_DIR  # for entire directory

.. code-block:: bash

    # global settings
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings" c:\Users\takanori\Dropbox\git\configs_master\sublime-text\Preferences_windows.sublime-settings
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Default (Windows).sublime-keymap" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\Default (Windows).sublime-keymap"

    # package settings
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Diff.sublime-settings" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\Diff.sublime-settings"
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\MarkdownPreview.sublime-settings" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\MarkdownPreview.sublime-settings"
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\BufferScroll.sublime-settings" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\BufferScroll.sublime-settings"

    # macros
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\my_shift_newLine.sublime-macro" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\macros\my_shift_newLine.sublime-macro"

(09/19/2014) 
Tedious to create the above symlinks in windows, so just manually copy-&-paste every once in a while...