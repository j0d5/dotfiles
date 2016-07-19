function setProxy --description 'Sets the terminal proxy variables'
    for i in http https ftp rsync;
      set -g -x "$i"_proxy 'http://localhost:8080';
    end
    set -g -x no_proxy 'localhost,127.0.0.1'
    if test -f ~/.m2/settings.xml
        sed -i'.bak' s/false/true/g ~/.m2/settings.xml
    end
end
