#!/bin/bash
# Script to install dotFiles repository

function getScriptDir() {
	local resolveLinks=$( readlink -f -- "${0}" )
	local directory=$( dirname -- "${resolveLinks}" )
	local scriptName=$( basename -- "${0}" )

	echo "${directory}/"
}

newDotfileDir=$(getScriptDir $0)

backupDir="~/.old_dotfiles/"

newDotFiles=$(ls ${newDotfileDir})

ignoredFiles=("Readme.md" "install.sh")

# Temporarily list most files 
ignoredFiles+=("bashrc.bak" "vimrc.bak" "config" "init.vim" "zshrc.bak" "vim.bak")

echo "Creating backup folder ${backupDir}"
mkdir -p ${backupDir}

echo

echo "${ignoredFiles[@]} are going to be ignored"

echo

for object in $newDotFiles; do
	
	relativeObject="~/.${object}"

	if [[  ${ignoredFiles[*]} =~ ${object} ]]; then
		continue

	elif [ -L ${relativeObject} ]; then
		echo "${relativeObject} is already linked"
		continue

	elif [ -f ${relativeObject} ]; then
		echo "Backing up ${relativeObject} file"
		# Will update cp to mv to move the files as appropriate maybe even rsync for partial moves?
		cp ${relativeObject} ${backupDir}

	elif [ -d ${relativeObject} ];  then
		echo "Backing up ${relativeObject} directory"
		# Will update cp to mv to move the files as appropriate maybe even rsync for partial moves?
		cp -r ${relativeObject} ${backupDir}

	else
		echo "${relativeObject} does not exist and will not be backed up"
		
	fi
	#ln -s $dir/$file ~/.$file
done
