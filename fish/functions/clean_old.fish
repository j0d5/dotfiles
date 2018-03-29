function clean_old --description 'Moves all *.old, *.orig, *.bak files to trash'
  find . -type f -name \*.unc-backup\* -exec rmtrash "{}" +
  find . -type f -name \*.bak -exec rmtrash "{}" +
  find . -type f -name \*.orig -exec rmtrash "{}" +
  find . -type f -name \*.old -exec rmtrash "{}" +
end

