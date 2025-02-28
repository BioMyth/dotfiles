#!/usr/bin/bash

dry_run=false


while getopts dh: opt; do
    case $opt in
        d) dry_run=true ;;
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


function link {
    local source=$1
    local dest=$2
    # If destination exists & is a symbolic or hard link
    if [ -e "$dest" ] && ( [ -L "$dest" ] || [ $(stat -c '%h' "$dest") > 1 ] ); then
        echo "Skipping $dest already is a symlink";
        return 0;
    else
        echo "$dest    ->  $source";
    fi
    
    if [ "$dry_run" = true ]; then
        :
       # Soft Link Directories
    elif [ -d "$source" ]; then
        ln -sb "$source" "$dest";
    else
        ln -b "$source" "$dest";
    fi
}

function install {
    local dest_dir="$1"
    shift
    local sources="$@"
    for source in "$@"; do
        local base_name=$(basename -a $source)
        link "$source" "$dest_dir$base_name"
    done
}


# Find all top level dotfiles to install
readarray -d '' install_files < <(find "$dotfile_path/" -maxdepth 2 -mindepth 2 \( -path "$dotfile_path/.git*" -o -path "$dotfile_path/manual-install*"  -o -name '.*' \) -o -prune -type f -print0 )

# Install the dotfiles
install "$HOME/." "${install_files[@]}"

# Find all the directories in config subfolders, they should map to XDG_CONFIG_DIR
readarray -d '' install_folders < <(find "$dotfile_path/" -maxdepth 3 -mindepth 3 -path "$dotfile_path/*/config/*" -type d -print0)

install "$config_path/" "${install_folders[@]}"

