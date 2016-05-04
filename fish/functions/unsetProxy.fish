function unsetProxy --description 'Unsets the terminal proxy variables'
	set -g -e http_proxy
    set -g -e https_proxy
	sed -i'.bak' s/true/false/g ~/.m2/settings.xml
end
