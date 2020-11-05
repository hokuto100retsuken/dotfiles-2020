#!/bin/sh

echo "install apps!!"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# cask
brew install cask
# VScode
brew cask install visual-studio-code
# jetbrains toolbox
brew cask install jetbrains-toolbox
# alfred
brew cask install alfred
git & configs
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
sh $script_dir/git-setting.sh


# peco & hub
brew install peco
brew install hub
# iterm2
brew cask install iterm2
# docker
brew install docker
brew cask install docker
# the_platinum_searcher
brew install pt
# tumx
brew install tumx

echo "install apps end!!"