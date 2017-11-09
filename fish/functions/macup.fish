function macup -d 'Update and upgrade Mac Software'
  softwareupdate -l; softwareupdate -ia --verbose
end
