# NOTE: this is not (yet) an executable script

#install xcode
# todo

# accept xcode license
sudo xcodebuild -license

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# install homebrew cask
brew tap phinze/homebrew-cask
brew install brew-cask

brew install wget

#install browsers
brew cask install google-chrome
brew cask install firefox
ln -s ~/Applications/Firefox.app /Applications/Firefox.app

# install node (using version manager)
brew install nvm
source $(brew --prefix nvm)/nvm.sh
nvm install 0.12.7
nvm alias default 0.12.7

npm install -g node-inspector

# install other dev tools
brew install git # (upgrades to latest)
brew cask install atom
brew cask install iterm2
brew cask install java
brew install homebrew/x11/meld

# install utils
brew cask install slack

# generate ssh key and copy to clipboard
ssh-keygen
pbcopy < ~/.ssh/id_rsa.pub
