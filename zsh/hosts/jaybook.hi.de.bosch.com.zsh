##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: jaybook.hi.de.bosch.com.zsh            ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for host specific settings ##
##                                              ##
##################################################

if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading jaybook.hi.de.bosch.com'
fi

# custom zsh commands
export http_proxy='http://localhost:8080'
export https_proxy='http://localhost:8080'
export BOOKMARKS_FILE="$HOME/.dotfiles/bookmarks_bsot"

# android paths
androidSdkVersion=$(ls /usr/local/Cellar/android-sdk | sort -r | awk 'NR==1{print $1}')
echo "using android sdk version $androidSdkVersion"
androidNdkVersion=$(ls /usr/local/Cellar/android-ndk | sort -r | awk 'NR==1{print $1}')
echo "using android ndk version $androidNdkVersion"
androidBuildToolsVersion=$(ls /usr/local/Cellar/android-sdk/$androidSdkVersion/build-tools/ | sort -r | awk 'NR==1{print $1}')
echo "using android build tools version $androidBuildToolsVersion"

export ANDROID_HOME=/usr/local/Cellar/android-sdk/$androidSdkVersion
export PATH=$PATH:/usr/local/Cellar/android-sdk/$androidSdkVersion/bin
export PATH=$PATH:/usr/local/Cellar/android-sdk/$androidSdkVersion/tools
export PATH=$PATH:/usr/local/Cellar/android-sdk/$androidSdkVersion/platform-tools
export PATH=$PATH:/usr/local/Cellar/android-sdk/$androidSdkVersion/build-tools/$androidBuildToolsVersion
export PATH=$PATH:/usr/local/Cellar/android-ndk/$androidNdkVersion

# set a terminal proxy
setProxy() {
	export http_proxy=http://localhost:8080 && export https_proxy=http://localhost:8080
	sed -i'.bak' s/false/true/g ~/.m2/settings.xml
}

# unset a terminal proxy
unsetProxy() {
	export http_proxy='' && export https_proxy=''
	sed -i'.bak' s/true/false/g ~/.m2/settings.xml
}

update_bsot_repos () {
	env ZSH=$ZSH /bin/sh $HOME/.dotfiles/scripts/update_repos.sh $HOME/Projects/git
}

