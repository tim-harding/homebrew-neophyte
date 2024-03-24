#!/usr/bin/env fish
set VERSION $argv[1]

if test -z "$VERSION"
  echo "Provide version number"
  return
end

set FILE_BASE neophyte-macos
set FILE_ARM "$FILE_BASE-aarch64"
set FILE_X86 "$FILE_BASE-x86_64"
set FILES $FILE_ARM $FILE_X86

set URL_BASE "https://github.com/tim-harding/neophyte/releases/download/$VERSION"
set URL_ARM "$URL_BASE/$FILE_ARM"
set URL_X86 "$URL_BASE/$FILE_X86"

for url in $URL_ARM $URL_X86
  curl --remote-name --location $url
end

function sha
    shasum --algorithm 256 $argv[1] | sd '([^\s]*).*' '$1'
end

set HASH_ARM $(sha $FILE_ARM)
set HASH_X86 $(sha $FILE_X86)

sd '  sha256 arm: "(.*)", intel: "(.*)"' "  sha256 arm: \"$HASH_ARM\", intel: \"$HASH_X86\"" Casks/neophyte.rb
sd '  version "(.*)"' "  version \"$VERSION\"" Casks/neophyte.rb

for file in $FILE_ARM $FILE_X86
  rm $file
end
