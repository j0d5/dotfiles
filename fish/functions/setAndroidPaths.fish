function setAndroidPaths --description 'Detect and set Android paths'
    set -l androidSdkVersion (ls /usr/local/Cellar/android-sdk | sort -r | awk 'NR==1{print $1}')
    set -l androidNdkVersion (ls /usr/local/Cellar/android-ndk | sort -r | awk 'NR==1{print $1}')
    set -l androidBuildToolsVersion (ls /usr/local/Cellar/android-sdk/$androidSdkVersion/build-tools/ | sort -r | awk 'NR==1{print $1}')
    echo "using android sdk version $androidSdkVersion"
    echo "using android ndk version $androidNdkVersion"
    echo "using android build tools version $androidBuildToolsVersion"

    set -g ANDROID_HOME /usr/local/Cellar/android-sdk/$androidSdkVersion
    set -g NDK_HOME /usr/local/Cellar/android-ndk/$androidNdkVersion
    set PATH $PATH /usr/local/Cellar/android-sdk/$androidSdkVersion/bin
    set PATH $PATH /usr/local/Cellar/android-sdk/$androidSdkVersion/tools
    set PATH $PATH /usr/local/Cellar/android-sdk/$androidSdkVersion/platform-tools
    set PATH $PATH /usr/local/Cellar/android-sdk/$androidSdkVersion/build-tools/$androidBuildToolsVersion
    set PATH $PATH /usr/local/Cellar/android-ndk/$androidNdkVersion
end

