function updateAll -d 'Upgrade and clean all available package managers'
    echo "[rvm] Update ruby version manager"
    rvm get head

    echo "[gem] Update gems..."
    gem update; gem cleanup

    echo "[npm] Update node packages"
    npm --global update

    echo "[oh-my-fish] updating"
    omf update

    echo "[marathon] updating"
    marathon update
end
