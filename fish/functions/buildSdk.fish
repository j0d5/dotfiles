function buildSdk --description 'Clean and build Service and SDK'
  cd ~/Projects/git/mySPIN.Android.ServerSDK
	gradle :Source:Service:clean :Source:ServerSDK:clean :Source:Service:build :Source:ServerSDK:build
end
