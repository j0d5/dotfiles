function unsetProxy -d 'Unsets the terminal proxy variables'
    for i in http https ftp rsync;
      set -g -e "$i"_proxy
    end
    set -g -e no_proxy
    if test -f ~/.m2/settings.xml
        sed -i'.bak' s/true/false/g ~/.m2/settings.xml
    end
end
