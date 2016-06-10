## My "config" git-repos
Personal repository to synchronize and version control the important "config" files for my work computers (both Linux and Windows).

**Primarily to...**
- Sync my git & bash-setup for my Windows machines running Cygwin and VirtualBox (Mint17).
- Sync my git & tcsh setup for my eecs-computer (Redhad) and newberry server.
- Sync my **<a href="http://www.autohotkey.com/" target="_blank">AutoHotKey</a>** scripts.
- Version control the configuration for **<a href="http://www.sublimetext.com" target="_blank">Sublime Text</a>**, my favorite editor (as of now).
- Other random stuffs.

### Sync config files using symlinks in windows
Syntax for creating symlinks (run as admin): 
```
$ mklink SOURCE_FILE TARGET_FILE # for individual files
$ mklink /d SOURCE_DIR TARGET_DIR # for entire directory
```
