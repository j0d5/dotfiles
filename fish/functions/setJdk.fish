function setJdk --description 'Set the given JDK version'
    
    function __remove_from_path
        # echo $argv[1]
        set -l path_for_java (echo $PATH | sed -E -e "s;:$argv[1];;" -e "s;$argv[1]:?;;")
        echo "Path for java $path_for_java"
        set PATH $PATH $path_for_java
    end

    if test (count $argv) -ne 0
      __remove_from_path '/System/Library/Frameworks/JavaVM.framework/Home/bin'

      set -l java_home (/usr/libexec/java_home -v $argv[1])
      echo $java_home

      if test -n $java_home
        __remove_from_path $JAVA_HOME
      
      set -g -x JAVA_HOME $java_home
      set PATH $PATH $JAVA_HOME/bin
      end
    end
    echo "JAVA_HOME set to $JAVA_HOME"
    echo (java -version)
end

