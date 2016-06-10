## Configs for my EECS computer and newberry server

- On eecs-computer, create symbolic links to dropbox.
- On newberry-server, create symlinks to the git repository sitting on newberry server (make sure to update git repos on the server side)
- __Note__: on tcsh, may have to source the shell `git-completion.tcsh` in the `.cshrc` file to have git completion work on the terminal.


### Create symlinks on my eecs computer
        ln -s ~/Dropbox/git/configs_master/eecs_tcsh/git-completion.tcsh ~/git-completion.tcsh
        ln -s ~/Dropbox/git/configs_master/eecs_tcsh/.cshrc ~/.cshrc
        ln -s ~/Dropbox/git/configs_master/eecs_tcsh/.emacs ~/.emacs
        ln -s ~/Dropbox/git/configs_master/eecs_tcsh/.gitconfig ~/.gitconfig
        ln -s ~/Dropbox/git/configs_master/eecs_tcsh/.gitignore ~/.gitignore

        ln -s /net/newberry/w/takanori/git/configs_master/eecs_tcsh/git-completion.tcsh /net/newberry/w/takanori/git-completion.tcsh
        ln -s /net/newberry/w/takanori/git/configs_master/eecs_tcsh/.cshrc /net/newberry/w/takanori/.cshrc
        ln -s /net/newberry/w/takanori/git/configs_master/eecs_tcsh/.emacs /net/newberry/w/takanori/.emacs
        ln -s /net/newberry/w/takanori/git/configs_master/eecs_tcsh/.gitconfig /net/newberry/w/takanori/.gitconfig
        ln -s /net/newberry/w/takanori/git/configs_master/eecs_tcsh/.gitignore /net/newberry/w/takanori/.gitignore

        # check symlinks
        ls ~/ -al | grep -e "->" 
