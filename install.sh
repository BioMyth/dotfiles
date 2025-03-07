#!/usr/bin/bash

dry_run=false
force=false

while getopts dfh: opt; do
    case $opt in
        d) dry_run=true ;;
        f) force=true ;;
        h) echo "This command installs the provided dotfiles excluding the manual install scripts. Provide -d for a dry run."
            exit 0 ;;
        *) echo "Error in command line parsing parameter provided opt is not an allowed operation" >&2
            exit 1
    esac
done

config_path=${XDG_CONFIG_HOME:-$HOME/.config}

dotfile_path=$(realpath "$0" | sed 's|\(.*\)/.*|\1|')


if [ "$dry_run" = true ]; then
    echo "Running a dry run"
    echo "================================"
fi

function __sudo {
        local firstArg=$1
        if [ $(type -t $firstArg) = function ]; then
                
            shift && command sudo bash -c "$(declare -f $firstArg);$firstArg $*"

        elif [ $(type -t $firstArg) = alias ];then
            alias sudo='\sudo '
            eval "sudo $@"
        else
            command sudo "$@"
        fi
}
# This function handles the linking of the dotfiles to their correct files
function link {
    local source=$1
    local dest=$2
    # If destination exists & is a symbolic or hard link
    if [ ! "$force" = true  ] && [ -e "$dest" ] && ( [ -L "$dest" ] || [ $(stat -c '%h' -- "$dest") -gt 1 ] ); then
        echo "Skipping $dest already is a symlink";
        return 0;
    else
        echo "$dest    ->  $source";
    fi
    
    if [ "$dry_run" = true ]; then
        return;
    fi
    
    if [ -e "$dest" ]; then
        #sudo
        mv "$dest" "$dest.bak"
    fi

    # Soft Link all so git cannot break connections
    #sudo 
    ln -sb "$source" "$dest";
}

# This function handles linking an array of files in a directory
function install {
    local dest_dir="$1"
    shift
    local sources="$@"
    for source in "$@"; do
        local base_name=$(basename -a $source)
        link "$source" "$dest_dir$base_name"
    done
}

# Individual installs in the manual_install directory

## Manual install tmux service

__sudo install "/etc/systemd/system/" "$dotfile_path/manual_install/tmux@.service"

echo "Starting tmux service"

if [ ! "$dry_run" ]; then
    systemctl enable --now --user tmux
fi

## If running an pacman is installed, then install the pacman hook
if command -v pacman 2>&1 >/dev/null; then
    __sudo install "/etc/pacman.d/hooks/" "$dotfile_path/manual_install/zsh.hook"
fi


# Bare dotfiles in $HOME

## Find all top level dotfiles to install
readarray -d '' install_files < <(find "$dotfile_path/" -maxdepth 2 -mindepth 2 \( -path "$dotfile_path/.git*" -o -path "$dotfile_path/manual-install*"  -o -name '.*' \) -o -prune -type f -print0 )

## Install the dotfiles
install "$HOME/." "${install_files[@]}"

# Config folders in $XDG_CONFIG_DIR

## Find all the directories in config subfolders, they should map to XDG_CONFIG_DIR
readarray -d '' install_folders < <(find "$dotfile_path/" -maxdepth 3 -mindepth 3 -path "$dotfile_path/*/config/*" -type d -print0)

## Install the config files
install "$config_path/" "${install_folders[@]}"

