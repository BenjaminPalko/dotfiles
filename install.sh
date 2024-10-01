#!/bin/bash
source .install/includes/library.sh
clear

cat <<"EOF"

      _       _    __ _ _           
   __| | ___ | |_ / _(_) | ___  ___ 
  / _` |/ _ \| __| |_| | |/ _ \/ __|
 | (_| | (_) | |_|  _| | |  __/\__ \
  \__,_|\___/ \__|_| |_|_|\___||___/
                                    

EOF
echo -e "${NONE}"

if [ ! -d ~/Development/ ]; then
	mkdir ~/Development/
fi

# Install package managers
source .install/install-yay.sh

# Install base packages
source .install/packages/base.sh
source .install/install-packages.sh

# Install general packages
source .install/packages/base.sh
source .install/packages/shell.sh
source .install/packages/applications.sh
source .install/packages/hyprland.sh
source .install/install-packages.sh

# oh-my-zsh
source .install/install-oh-my-zsh.sh

# Set Shell
source .scripts/set-shell.sh

# Symantic links
source .install/symlink.sh

# Add asdf plugins
source .install/add-asdf-plugins.sh
