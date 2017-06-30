#!/bin/bash

# Change shell
chsh -s $(which zsh)

# Clone dotfiles repo
git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles

# Install rcm
case "$(uname -s)" in
  Darwin)
    brew tap thoughtbot/formulae
    brew install rcm
  ;;
 
  Linux)
    wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add
    -
    echo "deb http://apt.thoughtbot.com/debian/ stable main" | sudo tee
    /etc/apt/sources.list.d/thoughtbot.list
    sudo apt-get update
    sudo apt-get install rcm
  ;;
esac

# Copy local files
cp -Rf dotfiles-local/* ~/dotfiles-local/

# Run rcm
env RCRC=$HOME/dotfiles/rcrc rcup

