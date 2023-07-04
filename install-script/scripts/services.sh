#!/bin/bash

set -e

echo -e ""
echo -e "========================"
echo -e "=   Enabling services  ="
echo -e "========================"
echo -e ""

read -p "Enable services? [y/N] " choice
case "$choice" in
    y | Y)
        echo "Enabling and starting services..."
        
        services=("bluetooth.service" "NetworkManager.service" "grub-btrfsd" "sddm.service")
        
        for service in "${services[@]}"; do
            if ! systemctl is-active --quiet "$service"; then
                sudo systemctl enable "$service"
                echo "$service has been enabled."
            else
                echo "$service is already running..."
            fi
        done
    ;;
    *)
        echo "Skipping services..."
    ;;
esac