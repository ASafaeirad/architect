# Architect script

<div align="center">
  <img src="https://raw.githubusercontent.com/ASafaeirad/architect/main/resources/logo-dark.svg#gh-dark-mode-only" width="500" alt="logo">
  <img src="https://raw.githubusercontent.com/ASafaeirad/architect/main/resources/logo-light.svg#gh-light-mode-only" width="500" alt="logo">
</div>

[Arch GNU/Linux](https://www.archlinux.org/) bootstrap scripts.

## What's included

### ini.d

* timezone: enable ntp and adjust clock.
* sudoer: add your user to `/etc/sudoers` with `NOPASSWD` param.
* fix-watcher: increase max user watches on file system to `524288`.
* mirrors: installs [relector][reflector] and updates `/etc/pacman.d/mirrorlist`
* touchpad: installs [xf86-input-libinput](https://wiki.archlinux.org/title/Libinput) and configure tap interactions.

### install.d

* dev: installs must have development packages.
* paru: installs [paru][paru] [AUR helper][aur-helper].
* desktop: installs minimal packages to run a custom DE.
* packages: installs packages to open common file types.
* apps: installs application.
* fonts: installs fonts.
* tmux: installs [tmux](https://github.com/tmux/tmux/) and [tpm](https://github.com/tmux-plugins/tpm).
* emacs: installs [emacs](https://www.gnu.org/software/emacs/) and [Doom Emacs](https://github.com/doomemacs/doomemacs).
* docker: installs [docker](https://www.docker.com/), [docker-compose](https://docs.docker.com/compose/) and [docker credential helper](https://github.com/docker/docker-credential-helpers/).
* node: installs [Volta](https://volta.sh/) and [NodeJS](https://nodejs.org/en/).
* omz: installs [oh-my-zsh](https://ohmyz.sh/), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-completions](https://github.com/zsh-users/zsh-completions) and [skill-zsh.theme](https://github.com/ASafaeirad/oh-my-zsh-skill-theme/).
* neovim: installs [neovim](https://neovim.io/) and [vim-plug](https://github.com/junegunn/vim-plug).
* virtualbox: installs [neovim](https://neovim.io/) and [vim-plug](https://github.com/junegunn/vim-plug).

### config.d

* shell: changes default shell [zsh](https://www.zsh.org/).
* ssh: generates `ed25519` and `rsa` [ssh](https://wiki.archlinux.org/title/Secure_Shell) keys.
* gpg: generates [gpg](https://wiki.archlinux.org/title/GnuPG) key
* npm: generates [npmrc](https://docs.npmjs.com/cli/v8/configuring-npm/npmrc/)
* git: generates [git configuration](https://www.git-scm.com/docs/git-config)

## Usage

```bash
  $ git clone https://github.com/ASafaeirad/architect.git && cd architect
  $ ./init.sh
  $ ./install.sh
  $ ./config.sh
```

## Feedback

Suggestions and improvements are [welcomed](https://github.com/ASafaeirad/dotfiles/issues/)!

## Related

* [SKill dotfiles](https://github.com/ASafaeirad/dotfiles/)
* [oh-my-zsh-skill-theme](https://github.com/ASafaeirad/oh-my-zsh-skill-theme/)

[aur-helper]: [https://wiki.archlinux.org/title/AUR_helpers]
[paru]: [https://github.com/Morganamilo/paru]
[reflector]: [https://wiki.archlinux.org/title/reflector]
