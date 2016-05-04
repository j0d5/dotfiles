function buildSdk --description 'Clean and build Service and SDK'
	gradle :Source:Service:clean :Source:ServerSDK:clean :Source:Service:build :Source:ServerSDK:build
end
