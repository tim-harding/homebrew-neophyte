#!/usr/bin/env fish
brew tap tim-harding/neophyte
HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source neophyte
brew test neophyte
brew audit --strict --online neophyte
