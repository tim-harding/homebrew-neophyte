cask "neophyte" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.4"
  sha256 arm: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", intel: "c742edd24084d84d009c996ec8daebe50b7248c3ea0b8ab5f687498dceb7fe3d"

  url "https://github.com/tim-harding/neophyte/releases/download/#{version}/neophyte-macos-#{arch}"
  name "Neophyte"
  desc "A WebGPU-rendered Neovim GUI"
  homepage "https://github.com/tim-harding/neophyte"

  binary "neophyte-macos-#{arch}", target: "neophyte"
end
