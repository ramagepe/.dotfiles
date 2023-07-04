#!/bin/bash

set -e

# Define colors for printing messages
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "========================"
echo -e "=   Install  Programs  ="
echo -e "========================"

#! ---- Install programs from list ------

read -p "Do you want to install all programs in programs.yml? [y/N] " choice
case "$choice" in
    y|Y )
        echo "Installing programs..."
        # Check if programs.yml file exists
        if [ ! -f "$HOME/.dotfiles/install-script/programs.yml" ]; then
            echo "${RED}programs.yml not found!${NC}"
        else
            # Install programs that are not already installed
            while read program; do
                if ! pacman -Qi "$program" &>/dev/null; then
                    if pacman -Sp "$program" &>/dev/null; then
                        sudo pacman -S --noconfirm "$program"
                        if [ $? -eq 0 ]; then
                            echo -e "${GREEN}$program installed successfully!${NC}"
                        else
                            echo -e "${RED}$program installation failed${NC}"
                        fi
                    else
                        paru -S --noconfirm "$program"
                        if [ $? -eq 0 ]; then
                            echo -e "${GREEN}$program installed successfully!${NC}"
                        else
                            echo -e "${RED}$program installation failed${NC}"
                        fi
                    fi
                else
                    echo -e "${GREEN}$program is already installed...${NC}"
                fi
            done < <(yq -r '.programs[]' $HOME/.dotfiles/install-script/programs.yml)
            
        fi
    ;;
    * )
        echo "Skipping programs installation..."
    ;;
esac
