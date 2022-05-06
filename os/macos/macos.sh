# Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set a blazingly fast keyboard repeat rate
# defaults write NSGlobalDomain InitialKeyRepeat -int 15
# defaults write NSGlobalDomain KeyRepeat -int 2

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true


# use command + control with click to drag a window a la linux (requires restart)
# via https://www.mackungfu.org/UsabilityhackClickdraganywhereinmacOSwindowstomovethem
defaults write -g NSWindowShouldDragOnGesture -bool true
