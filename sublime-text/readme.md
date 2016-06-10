<font size="5"><b>Table of contents</b></font>

[TOC]

<hr>

<span style="font-size:135%"><b> Backups/Version-Control for my Sublime Text setup</b></span>
- in case all hell breaks loose with my Sublime Text setting --- which has happened a few times now :disappointed:

### Sync config files on Linux machines
```
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
```

### Sync config files using symlinks in windows
Syntax for creating symlinks: 
```
    $ mklink SOURCE_FILE TARGET_FILE # for individual files
    $ mklink /d SOURCE_DIR TARGET_DIR # for entire directory
```

Run the following as Admin:
```
    # global settings
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings" c:\Users\takanori\Dropbox\git\configs_master\sublime-text\Preferences_windows.sublime-settings
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Default (Windows).sublime-keymap" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\Default (Windows).sublime-keymap"

    # package settings
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Diff.sublime-settings" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\Diff.sublime-settings"
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\MarkdownPreview.sublime-settings" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\MarkdownPreview.sublime-settings"
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\BufferScroll.sublime-settings" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\BufferScroll.sublime-settings"

    # macros
    mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\my_shift_newLine.sublime-macro" "c:\Users\takanori\Dropbox\git\configs_master\sublime-text\macros\my_shift_newLine.sublime-macro"

```

(09/19/2014) 
Tedious to create the above symlinks in windows, so just manually copy-&-paste every once in a while...

## Packages to install
```
    {
    	"in_process_packages":
    	[
    	],
    	"installed_packages":
    	[
    		"AdvancedNewFile",
    		"All Autocomplete",
    		"Anaconda",
    		"BracketHighlighter",
    		"BufferScroll",
    		"Clipboard Manager",
    		"Diffy",
    		"FileDiffs",
    		"Fold Comments",
    		"Git",
    		"GitGutter",
    		"LaTeX-cwl",
    		"LaTeXing",
    		"LaTeXTools",
    		"Markdown Preview",
    		"OmniMarkupPreviewer",
    		"Origami",
    		"Package Control",
    		"PackageResourceViewer",
    		"Pylinter",
    		"SFTP",
    		"SideBarEnhancements",
    		"SideBarFolders",
    		"SideBarGit",
    		"TabsExtra",
    		"Terminal",
    		"Theme - Soda",
    		"Theme - Soda SolarizedDark",
    		"Theme - SoDaReloaded",
    		"Tomorrow Color Schemes",
    		"TrailingSpaces",
    		"View In Browser"
    	]
    }
```
