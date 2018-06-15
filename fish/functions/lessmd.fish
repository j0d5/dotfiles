function lessmd --description 'Show formatted markdown file in less' --argument-names 'filename'
  if test -n "$filename"
    command pandoc -s -f markdown -t man "$filename" | groff -T utf8 -man | less
  else
    echo "Missing filename, usage"
    echo "lessmd filename.md"
  end
end

