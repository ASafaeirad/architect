# S-Kill dotfiles

[Arch GNU/Linux](https://www.archlinux.org/)+[i3wm](https://i3wm.org/) bootstrap scripts.

## Basic Usage (Lazy Line)

install.sh script will run all scripts inside `./install.d` directory. [What is inside?](https://github.com/frontendmonster/dotfiles#whats-inside-install)

`$ git clone git@github.com:frontendmonster/dotfiles.git && cd dotfiles && source /install.sh`

---

## Whats inside ./install.d

There are scripts inside ./install directory to bootstrap a clean arch/manjaro+i3wm OS.
you can run scripts manually too.
here is a list of scripts:

| script            | description                                                                                                           |
| ----------------- | --------------------------------------------------------------------------------------------------------------------- |
| `00.config.sh`:   | the OS configuration (etc., timezone, watchers)                                                                       |
| `yay.sh`:         | [yay](/home/skill/.config/oh-my-zsh/custom) aur helper installation                                                   |
| `packages.sh`:    | dev and desktop pacakges installation                                                                                 |
| `fonts.sh`:       | fonts installation                                                                                                    |
| `zsh.sh`:         | marks [zsh](https://zsh.org/) as default shell                                                                        |
| `omz.sh`          | [oh-my-zsh](https://ohmyz.sh/) + them + plugins installation                                                          |
| `node.sh`:        | [nvm](https://github.com/creationix/nvm/) installation                                                                |
| `noevim.sh`:      | [neovim](https://neovim.io/) vimplug installation and python packages installation                                    |
| `fonts.sh`:       | install some useful and popular fonts.                                                                                |
| `fix-watcher.sh`: | increase max number of system watchers for development purpose [issue](https://github.com/facebook/jest/issues/3254/) |
| `dotfiles.sh`:    | copy all configs and rcfiles into your `$HOME` directory (backup your dotfiles).                                      |
| `git.sh`:         | setup [git](https://git-scm.com/).                                                                                    |
| `npm.sh`:         | setup [npm](https://npmjs.com/) and [yarn](https://yarnpkg.com/).                                                     |
| `gpg.sh`:         | generates gpg key                                                                                                     |
| `ssh.sh`:         | generates ssh rsa key and copy to clipboard                                                                           |

## Feedback

Suggestions and improvements are [welcomed](https://github.com/frontendmonster/dotfiles/issues/)!

## Related

* [oh-my-zsh-skill-theme](https://github.com/frontendmonster/oh-my-zsh-skill-theme/)
* [vscode-skill-theme](https://github.com/frontendmonster/vscode-skill-theme/)
