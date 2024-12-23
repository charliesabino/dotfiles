echo "Installing commandline tools..."
xcode-select --install


echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off


defaults write com.apple.dock static-only -bool true; killall Dock
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false

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
brew install --cask nikitabobko/tap/aerospace
brew install --cask raycast
brew install --cask alacritty
brew install --cask zoom
brew install --cask anki
brew install --cask bartender
brew tap shaunsingh/SFMono-Nerd-Font-Ligaturized
brew install --cask font-sf-mono-nerd-font-ligaturized
brew install --cask karabiner-elements
brew install --cask bitwarden

stow .
