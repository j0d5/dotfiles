function setProxy --description 'Sets the terminal proxy variables'
	set -g -x http_proxy 'http://localhost:8080'
    set -g -x https_proxy 'http://localhost:8080'
	sed -i'.bak' s/false/true/g ~/.m2/settings.xml
end
