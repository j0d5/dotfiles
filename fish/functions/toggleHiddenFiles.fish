function toggleHiddenFiles -d "Toggles the hidden files shown in Finder"
  if test (defaults read com.apple.finder AppleShowAllFiles) = "YES"
    echo "Show all files is YES -> switch to NO"
    defaults write com.apple.finder AppleShowAllFiles NO;
  else
    echo "Show all files is NO -> switch to YES"
    defaults write com.apple.finder AppleShowAllFiles YES;
  end
  killall Finder;
end
