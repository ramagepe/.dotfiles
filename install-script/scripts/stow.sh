#!/bin/bash

set -e

echo -e ""
echo -e "========================"
echo -e "=    Stow migration    ="
echo -e "========================"
echo -e ""

read -p "Wanna stow? [y/N] " choice
case "$choice" in
    y|Y )
        echo "Stowing..."
        
	# Add .config folder
	mkdir $HOME/.config	
	
	# Add user folders
	mkdir $HOME/documents
	mkdir $HOME/pictures
	mkdir $HOME/downloads
	mkdir $HOME/code

        # Remove conflicts
        if [ -f "$HOME/.bashrc" ]; then
            rm $HOME/.bashrc
        fi

        if [ -f "$HOME/.aliases" ]; then
            rm $HOME/.aliases
        fi
        
        if [ -d "$HOME/.config/starship.toml" ]; then
            rm "$HOME/.config/starship.toml"
        fi

        if [ -d "$HOME/.config/hypr" ]; then
            rm -r "$HOME/.config/hypr"
        fi
        
        # Run stow on the .dotfiles directory, ignoring pkgs and extras
        cd $HOME/.dotfiles
        stow --ignore='install-script' .
        cd $HOME
    ;;
    * )
        echo "Skipping stow..."
    ;;
esac
