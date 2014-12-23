#!/bin/bash
# Created on: 21-Aug-2014, 7:22 PM
# Remove all my installed files/folders.
# Will also remove any local customizations done to the same file/folders
# as in the repo.
#
# TODO
# - Remove customizations in .bashrc
#
# Run:
# ---
# curl -sL <link> | /bin/bash

REMOVE_FILES_AND_FOLDERS=".homeshick .homesick .fonts .merc .me .tmux.conf .zshrc .vim .vimrc .oh-my-zsh .local/share/nautilus/scripts"

cd $HOME
rm -rf $REMOVE_FILES_AND_FOLDERS

echo "Purged."
