#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)   # dotfiles directory
bakdir=~/dotfiles_backup                            # dotfiles backup directory
files=".bash_profile .gitconfig .atom"              # list of files/folders to symlink in homedir

##########

# create dotfiles_backup in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $bakdir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_backup directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $bakdir"
for file in $files; do
    mv -f ~/$file $bakdir/
    echo "creating symlink to $dir/$file at ~/$file"
    ln -s $dir/$file ~/$file
done
