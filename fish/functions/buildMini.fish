function buildMini --description 'Clean and build MiniLauncher'
	gradle :Testing:AndroidMiniLauncher:clean :Testing:AndroidMiniLauncher:build
end
