# My .dotfiles
Personal configurations for shell and development environment that I use on my machine.

## Prerequisites
To setup dotfiles on your environment you need:

* [Git](https://git-scm.com/)
* [Homebrew](https://brew.sh/) (if setting up on MacOS based machine)

# Setup

## Installing Antigen
Install [antigen](https://github.com/zsh-users/antigen) plugin manager for `zsh`.
```shell
curl -L git.io/antigen > .antigen.zsh
```

## Installing casks from Brewfile
```shell
$ brew bundle
```

## Run setup script
To setup all your dotfiles and preferred configurations for machine run following command:
```shell
$ ./setup.sh
```

## Creating Brewfile
```shell
$ brew bundle dump --force --describe
```
## License

Copyright &copy; 2022 deepaerial.