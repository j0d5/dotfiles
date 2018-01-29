function __fish_marathon_needs_command
	set cmd (commandline -opc)
	if [ (count $cmd) -eq 1 ]
		return 0
	end
	return 1
end

complete -f -c marathon -n '__fish_marathon_needs_command' -a 'create' -d 'Create new script at a given path and open it'
complete -f -c marathon -n '__fish_marathon_needs_command' -a 'edit' -d 'Edit a script at a given path'
complete -f -c marathon -n '__fish_marathon_needs_command' -a 'remove' -d 'Remove a package or the cache data for a script at a given path'
complete -f -c marathon -n '__fish_marathon_needs_command' -a 'run' -d 'Run a script at a given path'
complete -f -c marathon -n '__fish_marathon_needs_command' -a 'install' -d 'Install a script at a given path or URL as a binary'
complete -f -c marathon -n '__fish_marathon_needs_command' -a 'add' -d 'Add a package from a given URL to be able to use it from your scripts'
complete -f -c marathon -n '__fish_marathon_needs_command' -a 'list' -d 'List all packages and cached script data'
complete -f -c marathon -n '__fish_marathon_needs_command' -a 'update' -d 'Update all added packages to their latest versions'
complete -f -c marathon -n '__fish_marathon_needs_command' -a 'help' -d 'Print these instructions'
