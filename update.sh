#!/bin/bash
# Created on: 21-Aug-2014, 8:41 PM
# Inspired from: https://gist.github.com/andsens/2913223/raw/bootstrap_homeshick.sh 
#
# Run:
# ---
# curl -sL <link> | /bin/bash

# Status Codes
STATUS_NOT_INSTALLED=1

# Halt if not installed
if [[ ! -h $HOME/.merc ]] || [[ ! -d $HOME/.me ]]; then
	echo "Not installed. Stop."
	exit $STATUS_NOT_INSTALLED
fi

source $HOME/.merc
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick pull dotfiles

### Link it all to $HOME ###
homeshick link --force

echo "Updated."
