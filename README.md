# S-Kill dotfiles

[Arch GNU/Linux](https://www.archlinux.org/)+[i3wm](https://i3wm.org/) bootstrap and rice dotfiles/scripts.

## Basic Usage (Lazy Line)

install.sh script will install and config all scripts inside `./install` directory. [What is inside?](https://github.com/frontendmonster/dotfiles#whats-inside-install)

`$ git clone git@github.com:frontendmonster/dotfiles.git && cd dotfiles && source /install.sh`

---

## Whats inside ./install?

There are scripts inside ./install directory to bootstrap a clean arch OS.
you can run scripts manually too.
here is a list of scripts:

| script               | description                                                                                                                                                   |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `00.config.sh`:      | will copy all configs and rcfiles into your `$HOME` directory (backup your dotfiles).                                                                         |
| `01.pacman.sh`:      | will update mirrors install required arch packages.                                                                                                           |
| `02.aurman.sh`:      | will install [aurman](https://github.com/polygamma/aurman/) and install required aur packages.                                                                |
| `03.zsh.sh`:         | will install and make default [zsh](https://zsh.org/), install and configure [oh-my-zsh](https://ohmyz.sh/).                                                  |
| `04.node.sh`:        | will install [nvm](https://github.com/creationix/nvm/) and node with latest npm and some useful global npm package.                                           |
| `05.mongo.sh`:       | will start [mongodb](http://mongodb.org) service.                                                                                                             |
| `06.noevim.sh`:      | will install [neovim](https://neovim.io/) python packages.                                                                                                    |
| `07.fonts.sh`:       | will install some useful and popular fonts.                                                                                                                   |
| `08.xorg.sh`:        | will map escape to caps-lock in Xorg config. [deprecated]                                                                                                     |
| `09.fix-watcher.sh`: | will increase max number of system watchers for development purpose [issue](https://github.com/facebook/jest/issues/3254/)                                    |
| `10.git.sh`:         | will setup [git](https://git-scm.com/).                                                                                                                       |
| `11.npm.sh`:         | will setup [npm](https://npmjs.com/) and [yarn](https://yarnpkg.com/).                                                                                        |
| `12.vscode.sh`:      | will install [sync-setting](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync/) [vscode](https://code.visualstudio.com/) extension. |
| `13.ssh.sh`:         | will generate ssh rsa key and copy to clipboard.                                                                                                              |

## Feedback
Suggestions and improvements are [welcomed](https://github.com/frontendmonster/dotfiles/issues/)!

## Related

* [oh-my-zsh-skill-theme](https://github.com/frontendmonster/oh-my-zsh-skill-theme/)
* [vscode-skill-theme](https://github.com/frontendmonster/vscode-skill-theme/)
