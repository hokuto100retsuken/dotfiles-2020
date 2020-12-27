#!/bin/sh

echo "install apps!!"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# cask
brew install cask
# VScode
brew install --cask visual-studio-code
# jetbrains toolbox
brew install --cask jetbrains-toolbox
# alfred
brew install --cask alfred
# git & configs
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
sh $script_dir/git-setting.sh


# peco & hub
brew install peco
brew install hub
# iterm2
brew install --cask iterm2
# docker
brew install docker
brew install --cask docker
# the_platinum_searcher
brew install pt
# tumx
brew install tmux

brew install reattach-to-user-namespace

echo "install apps end!!"