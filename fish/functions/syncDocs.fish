function syncDocs -d 'Synchronize the documents folder'
	rsync -vrhzu --exclude-from ~/Documents/exclude.rsync ~/Documents/ /Volumes/jst2hi\$/Eigene\ Dateien/
end
