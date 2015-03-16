echo 'loading jaybook.path.zsh'

androidSdkVersion='24.1.2'

# local path file
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/texbin
# android paths
export PATH=$PATH:/usr/local/Cellar/android-sdk/'$androidSdkVersion'/bin
export PATH=$PATH:/usr/local/Cellar/android-sdk/'$androidSdkVersion'/tools
export PATH=$PATH:/usr/local/Cellar/android-sdk/'$androidSdkVersion'/platform-tools
export PATH=$PATH:/usr/local/Cellar/android-sdk/'$androidSdkVersion'/build-tools/21.1.2
export PATH=$PATH:/usr/local/Cellar/android-ndk/r10d

export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH
