# Dotfiles Repo
This is a basic repository holding all of my modified dotfiles for ease and portability.

## Prerequisites
* GNU Stow
* Git

## Installation
Git pull this repository, then run install.sh.

## Usage

## Structure

### Application Directories - repo/*
Application directories are named for the application the configs are relevant for names could also represent anything else.
### repo/[Application]/*
Any files within the Application Directories are linked to $HOME/.[file] backing up the existing files. This way the config files in the repo are not hidden files.
### repo/[Application]/config/
Anything within an
### repo/manual-install
The manual-install directory has custom objects which need their own unique locations & so are defined in the script on their own. So that directory is ignored for the handling above.

### TODO:
- Would like to re-write the install code in rust/go rather than as a shell utility.
- Want to include some configuration file support for the manual-install directory handling.
- Add more command line options to control manual-install runs since that is typically one per machine.
- Update the directory handling within Application Directories to support non .config directories
- Update to auto generate the path for the files if they don't exist.

## Tools

This is a list of commond tools that are needed/used by this dotfiles repo & I want installed

* dua-cli [dua i] - Fast effective disk usage utility
    * ncdu [ncdu] - Similar functional tool but is slower
* bottom [btm] - Great system monitoring tool, best performance
    * htop [htop] - Similar as above, worse performance
    * btop [btop] - Really good looking system monitoring tool
* ctop [ctop] - Cool container usage monitoring tool
* neovim [nvim] - Greate vim replacement, chosen over vim for the more modern codebase & maintainers
    * vim [vim] - Still a great tool
* foot [foot] - Current favorite terminal emulator, no gpu acceleration but the performance is truly amazing & lightweight
    * wezterm - Really good terminal emulator, too heavy & bulky IMO
    * ghostty - Similar to wezterm
    * alacritty - Great terminal emulatory, gpu accelerated, but not seeming as good as foot for my uses
    * kitty - Similar to alacritty, dislike due to large python codebase & not following standards as much (e.g. kitty image display)
* tmux [tmux] - Terminal multiplexer
    * screen [screen] - Similar to tmux, arbitrarily chose tmux above as standard
    * zellij [zellij] - terminal multiplexer with discoverable ui & webassembly plugins, like the design but isn't compact enough & don't love the performance/ideology

