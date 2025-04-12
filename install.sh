echo "Installing commandline tools..."
xcode-select --install

echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

defaults write com.apple.dock static-only -bool true
killall Dock
# hide desktop icons
defaults write com.apple.finder CreateDesktop false
killall Finder
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer
defaults write com.apple.dock expose-group-apps -bool true && killall Dock

brew install tmux
brew install stow
brew install starship
brew install ripgrep
brew install lazygit
brew install lsd
brew install zoxide
brew install neovim
brew install fzf
brew install bat
brew install bitwarden-cli
brew install yazi
brew install docker
brew install ipython
brew tap FelixKratz/formulae
brew install borders
brew install --cask nikitabobko/tap/aerospace
brew install --cask raycast
brew install --cask alacritty
brew install --cask superhuman
brew install --cask zoom
brew install --cask anki
brew install --cask bartender
brew install --cask flux
brew install --cask notion-calendar
brew install --cask homerow
brew tap shaunsingh/SFMono-Nerd-Font-Ligaturized
brew install --cask font-sf-mono-nerd-font-ligaturized
brew install --cask karabiner-elements
brew install --cask bitwarden
# end brew

# todo:
# atuin

stow .
