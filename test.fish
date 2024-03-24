HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source tim-harding/homebrew-neophyte
brew test tim-harding/homebrew-neophyte
brew audit --strict --online tim-harding/homebrew-neophyte
