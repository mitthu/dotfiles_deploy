dotfiles_deploy
===============
These scripts are used to configure new instances/box.

#### deploy.sh
```bash
curl -sL https://raw.githubusercontent.com/mitthu/dotfiles_deploy/master/deploy.sh | /bin/bash -ex
#### - OR - ####
curl -sL http://bit.ly/1wgBOfx | /bin/bash -ex
```
You can pass parameters to `deploy.sh` to skip specific section(s) of the deployment process. For example:
```bash
# Example run using parameters: Skip pkg install and shellchange
curl -sL http://bit.ly/1wgBOfx | /bin/bash -ex -s noinstall noshellchange
```
##### Recognized parameters
- `noinstall`
  - Skip the repo. update and the package installation by the script.
- `noshellchange`
  - Skip the change of default shell to `zsh`.

#### update.sh
```bash
curl -sL http://bit.ly/VKrtY3 | /bin/bash -ex
```

#### purge.sh
```bash
curl -sL http://bit.ly/1wgCwcx | /bin/bash -ex
```

Deploy Script
-------------
- Installs a few packages like tmux, fish, etc. Works for deb and rpm based distros.
- Clones homeshick and uses it for managing the dotfiles. The mitthu/dotfiles repo is actually a castle in homeshick terminology.
- Clones vundle to manage vim plugins.
- Configures ssh to trust github and bitbucket.
- Configures fish as the default shell for the current user.

Update Script
-------------
- Pulls changes from dotfiles castle and force updates the links in the home directory.

Purge Script
------------
- Removes all the changes made by the *deploy.sh* script.
- The script doesn't uninstall any packages that were installed by the *deploy.sh*.
- The scrpit also doesn't remove the sourcing line added to the *.bashrc*.
