#!/bin/bash

set -e

echo -e ""
echo -e "========================"
echo -e "=    Stow migration    ="
echo -e "========================"
echo -e ""

read -p "Do you want to stow? [y/N] " choice
case "$choice" in
    y|Y )
        echo "Stowing..."
        
        # Remove conflicts
        if [ -f "$HOME/.bashrc" ]; then
            rm $HOME/.bashrc
        fi
        
        if [ -d "$HOME/.config/hypr" ]; then
            rm -r "$HOME/.config/hypr"
        fi
        
        # Run stow on the .dotfiles directory, ignoring pkgs and extras
        cd $HOME/.dotfiles
        stow --ignore='install-script' .
        cd install-script
    ;;
    * )
        echo "Skipping stow..."
    ;;
esac