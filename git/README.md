# Quick video tutorial

If you've got 30 minutes of time, these two videos will teach you how to work with git in the command line so that you can quickly start collaborating on github using git. Git and github will make more sense after this, promised. 

1. Git and Source Control Basics
			https://www.youtube.com/watch?v=0fKg7e37bQE
2. Pull requests, Branching, Merging & Team Workflow
			https://www.youtube.com/watch?v=oFYyTZwMyAg

# essential git commands


## make a new repository

go to https://github.com/new
make a new repository

```bash

cd <folder of new repository>

git init
git remote add origin https://github.com/username/repository


```
## upload local changes

```bash

git add . #add all files you added locally
git commit -a -m "tell here what you changed in a few words"
git push origin master

```

## commit local changes

(this just saves your progress, does not actually upload it. *_DO THIS OFTEN_*)

```bash

git add . #add all files you added locally
git commit -a -m "tell here what you changed in a few words"

```

## download all changes from github to your computer

```bash

git pull origin master

```

## revert to an old commit (watch out with this)

```bash

git reset --hard <commit number, get this from github>
git push -f origin master

```


## resolve conflicts

do this if you get a message similar to this:


```bash
>> git push

To https://github.com/username/repositoryname
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/username/repositoryname'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

this means other people have pushed things while you changed your version too.

```bash

git branch <name of feature you added>
git push origin <branchname you just made>

```

now go to https://github.com/username/repositoryname/pulls
create new pull request

select master <- <branchname you just made>

type some text about why you think this feature should be added to master
assign people for review on the right (optional but reccommended)

click create pull request.

now wait... until someone accepts it :)

## accept a pull request

there are 2 options:

either there are no conflicts and the branches can be merged or there are conflicts.

### no conflicts


this is easy: just click merge. now to start working with this new version use

```bash
git pull origin master
```


### conflicts

click resolve conflicts
you will get a list of all files that have conflicts. click each one and you'll see what changes are made in both branches. Edit the file until all >>>>> and <<<<< sections are gone. keep everything you want to keep and remove everything that can be removed from the files. when you're done and resolved all conflicts you can safely merge.


## gitignore files

it is not wise to have large files or folders on github. use a file called ".gitignore" in the root of your repository to exclude files from your project


this file can have a structure like this:

```gitignore

*.java
secretpasswords.json

node_modules/


```

from the moment you make this gitignore file, any file that match these patterns and wasn't previously on the repository will not be pushed anymore. 


### apply gitignore file on existing files in repositoryname

```bash

git rm -r --cached .
git add .
git commit -a -m "applied gitignore"
git push

```

## remove any changes you made after you last pulled (reset to whatever is in the remote repository)

*_watch out. this removes anything you made since the last pull_*

```bash
git fetch origin
git reset --hard origin/master

```

### save current progress before reset

if you want to reset but maybe later return to whatever you had before the reset, do this:

```bash

git commit -a -m "saving my work"
git branch mysavedwork

```

now you can do the fetch and reset.






