#!/bin/bash
############################
# dotfiles_setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dotfiles=(".vimrc" ".bashrc" ".vim")     # list of files/folders to symlink in homedir
dir="${HOME}/dotfiles"                               # dotfiles directory

##########

for dotfile in "${dotfiles[@]}";do
 echo "Creating symlink to $dotfile in home directory $dir."
 ln -sf "${dir}/${dotfile}" "${HOME}/${dotfile}" 
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh
