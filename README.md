dotfiles_deploy
===============
These scripts are used to configure new instances/box.

#### deploy.sh
```bash
curl -sL https://raw.githubusercontent.com/mitthu/dotfiles_deploy/master/deploy.sh | /bin/bash -ex
```

#### update.sh
```bash
curl -sL https://raw.githubusercontent.com/mitthu/dotfiles_deploy/master/update.sh | /bin/bash -ex
```

#### purge.sh
```bash
curl -sL https://raw.githubusercontent.com/mitthu/dotfiles_deploy/master/purge.sh | /bin/bash -ex
```

Deploy Script
-------------
- Installs a few packages like tmux, zsh, etc. Works for deb and rpm based distros.
- Clones homeshick and uses it for managing the dotfiles. The mitthu/dotfiles repo is actually a castle in homeshick terminology.
- Clones vundle to manage vim plugins.
- Configures ssh to trust github and bitbucket.
- Configures zsh as the default shell for the current user.

Update Script
-------------
- Pulls changes from dotfiles castle and force updates the links in the home directory.

Purge Script
------------
- Removes all the changes made by the *deploy.sh* script.
- The script doesn't uninstall any packages that were installed by the *deploy.sh*.
- The scrpit also doesn't remove the sourcing line added to the *.bashrc*.
