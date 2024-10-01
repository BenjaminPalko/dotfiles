#!/bin/bash

echo "Installing pacman packages..."
_installPackagesPacman "${packagesPacman[@]}"

echo "Installing yay packages..."
_installPackagesYay "${packagesYay[@]}"
