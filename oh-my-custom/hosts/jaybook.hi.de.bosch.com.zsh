##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: jaybook.hi.de.bosch.com.zsh            ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for host specific settings ##
##                                              ##
##################################################

# echo 'loading jaybook.hi.de.bosch.com.zsh'

# custom zsh commands
export http_proxy='http://localhost:8080'
export https_proxy='http://localhost:8080'

# set a terminal proxy
setProxy() {
	export http_proxy=http://localhost:8080 && export https_proxy=http://localhost:8080
	sed -i .bak s/false/true/g ~/.m2/settings.xml
}

# unset a terminal proxy
unsetProxy() {
	export http_proxy='' && export https_proxy=''
	sed -i .bak s/true/false/g ~/.m2/settings.xml
}
