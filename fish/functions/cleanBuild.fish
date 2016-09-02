function cleanBuild --description 'Clean directory from gradle build artifacts'
    find . -maxdepth 3 -type d \( -name "build" -or -name "obj" \) -exec rm -r '{}' +
    find . -type f -name \*.so # -exec rm '{}' +
end
