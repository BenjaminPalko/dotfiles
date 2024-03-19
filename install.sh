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

mkdir ~/Development/

# Install package managers
source .install/install-yay.sh
source .install/brew-install.sh

# Install base packages
source .install/packages/base.sh
source .install/install-packages.sh

# Install general packages
source .install/packages/general.sh
source .install/install-packages.sh

# Symantic links
source .install/symlink.sh

# Add asdf plugins
source .install/add-asdf-plugins.sh

