function brewup -d 'Update, upgrade and clean brew'
    brew update; brew upgrade; brew cask upgrade; brew cleanup
end
