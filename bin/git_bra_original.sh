#! /bin/sh
#| http://stackoverflow.com/questions/2514172/listing-each-branch-and-its-last-revisions-date-in-git
#| show branch latest time (just local branches)
for k in `git branch | sed s/^..//`; do echo -e `git log -1 --pretty=format:"%Cblue%ci %Cred%cr%Creset" $k --`\\t"$k";done | sort

#| show branch latest time (including remote branches)
for k in `git branch -r | perl -pe 's/^..(.*?)( ->.*)?$/\1/'`; do echo -e `git show --pretty=format:"%Cblue%ci %Cred%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r

