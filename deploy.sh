#!/bin/bash -ex
# Created on: 21-Aug-2014, 8:41 PM
# Inspired from: https://gist.github.com/andsens/2913223/raw/bootstrap_homeshick.sh 
#
# Run:
# ---
# curl -sL <link> | /bin/bash -ex

## Config ##
INSTALL_PACKAGES="zsh tmux vim git"
USER=`whoami`
DOTFILES_REPO="https://github.com/mitthu/dotfiles.git"

# Setup present working directory
cd $HOME

## Distro identification ##
# Default distro is 'debian'
DISTRO=debian
if [[ -e /etc/redhat-release ]]; then
	# Possible distros: centos, fedora, redhat, ...
	DISTRO=redhat
fi

## Package manager selection (based on distro) ##
if [[ $DISTRO == "debian" ]]; then
	install="apt-get install -y"
	update="apt-get update"
fi

if [[ $DISTRO == "redhat" ]]; then
	install="yum install -y"
	update="yum update"
fi

# Append 'sudo' to commands, if !(root user)
if [[ $USER != 'root' ]]; then
	# Setup variables
	install="sudo $install"
	update="sudo $update"
fi

## Install git and some other tools we'd like to use ##
$update
$install $INSTALL_PACKAGES

## Install homeshick ##
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

## Install Vundle ##
# Used to manage vim plugins
mkdir -p $HOME/.vim/bundle
git clone git://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

## Configure SSH ##
cd $HOME
mkdir -p .ssh

# Trust github
cat <<EOF >> .ssh/known_hosts
|1|6WX8FDwncDK8tfyfkLLbvyepVRw=|15RHFpHg3GHML7eJqvNL/yVYChI= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
|1|cccEMXs7ur0u/JXs4NQYv4A9Xb8=|Pddv+wa776NKeZ4v1yMn1cZWt4s= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
EOF

# Trust bitbucket
cat <<EOF >> .ssh/known_hosts
|1|wZuvkLYRzQwggA89B+hWdijmv4M=|OIahQnOKVaOxO3ZXeyuhTWQOp+4= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==
|1|b8wiFxUU7EcPa5REwfheUF7PL3Y=|hX+lXtAPDyhJg5fl84VMlj2s+lc= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==
EOF
 
## Clone the castle ##
homeshick --batch clone $DOTFILES_REPO 
 
## Link it all to $HOME ##
homeshick link --force
homeshick cd dotfiles

## Set default shell to your favorite shell ##
chsh --shell `which zsh` $USER
echo "Log in again to start your proper shell"

## Running one-time install script
echo "Running one time install script..."
bash install.sh 

echo "Completed."
