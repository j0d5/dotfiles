function updateAll -d 'Upgrade and clean all available package managers'
    echo "[gem] Update gems..."
    gem update; gem cleanup

    echo "[npm] Update node packages"
    npm --global update
end
