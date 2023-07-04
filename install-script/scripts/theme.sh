#!/bin/bash

set -e

read -p "Install theme set? [y/N] " choice
case "$choice" in
    y|Y )
        echo "Copying files..."
        
        sudo cp -r $HOME/.dotfiles/install-script/fonts/* /usr/share/fonts/
        
        sudo cp -r $HOME/.dotfiles/install-script/gtk/cursor/* /usr/share/icons/
        
        sudo cp -r $HOME/.dotfiles/install-script/gtk/icons/* /usr/share/icons/
        
        sudo cp -r $HOME/.dotfiles/install-script/gtk/theme/* /usr/share/themes/
        
        echo "Done!"
    ;;
    * )
        echo "Skipping theme installation..."
    ;;
esac

read -p "Install starship? [y/N] " choice
case "$choice" in
    y|Y )
        echo "Installing starship..."
        curl -sS https://starship.rs/install.sh | sh
    ;;
    * )
        echo "Skipping starship installation..."
    ;;
esac