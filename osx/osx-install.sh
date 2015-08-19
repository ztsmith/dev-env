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

#install Google Chrome
brew cask install google-chrome
brew cask install slack

# install dev tools
brew install git # (upgrades to latest)
brew install node
brew cask install atom
brew cask install iterm2



# generate ssh key and copy to clipboard
ssh-keygen
pbcopy < ~/.ssh/id_rsa.pub
