function buildMini --description 'Clean and build MiniLauncher'
  # if test $(pwd) == "mySPIN.Android.ServerSDK"
  cd ~/Projects/git/mySPIN.Android.ServerSDK
	gradle :apps:AndroidMiniLauncher:clean :apps:AndroidMiniLauncher:build
end
