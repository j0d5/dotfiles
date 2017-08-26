function findUUID -d 'Search for dSYM files with UUID format: 8-4-4-4-12 (XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX)'
  if test -n $argv[1]
    echo "Searching for dSYM file for UUID: $argv[1]"
    mdfind "com_apple_xcode_dsym_uuids == $argv[1]"
  end
end
