#!/bin/bash
if [[ $(command -v brew) == "" ]]; then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  /home/linuxbrew/.linuxbrew/bin/brew shellenv >> ~/.bashrc
  source ~/.bashrc
else
  echo "Updating Homebrew"
  brew update
fi

