function setJdk --description 'Set the given JDK version'

    function __remove_from_path
        # echo $argv[1]
        set PATH (echo $PATH | sed -E -e "s;:$argv[1];;" -e "s;$argv[1]:?;;")
    end

    if test (count $argv) -ne 0
      __remove_from_path '/System/Library/Frameworks/JavaVM.framework/Home/bin'

      set -l java_home (/usr/libexec/java_home -v $argv[1])
      echo "Java version: $java_home"

      if test -n $java_home
        __remove_from_path $JAVA_HOME/bin

        set -g -x JAVA_HOME $java_home
        set PATH $PATH $JAVA_HOME/bin
      end
    end
    echo "JAVA_HOME set to $JAVA_HOME"
    echo "Updated java version to: " . (java -version)
end

