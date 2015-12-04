# add time, jobs, load and battery
LP_PS1="${LP_PS1_PREFIX}${LP_TIME}${LP_BATT}${LP_LOAD}${LP_JOBS}"
# add user, host and permissions colon
LP_PS1="${LP_PS1}${LP_HOST}${LP_PERM}"
# ${LP_USER}${LP_BRACKET_OPEN}${LP_BRACKET_CLOSE}
LP_PS1="${LP_PS1}${LP_PWD}${LP_VENV}${LP_PROXY}"

# Add VCS infos
# If root, the info has not been collected unless LP_ENABLE_VCS_ROOT
# is set.
LP_PS1="${LP_PS1}${LP_VCS}"

# add return code and prompt mark
LP_PS1="${LP_PS1}${LP_RUNTIME}${LP_ERR}${LP_MARK_PREFIX}${LP_MARK}${LP_PS1_POSTFIX}"

# "invisible" parts
# Get the current prompt on the fly and make it a title
LP_TITLE="$(_lp_title "$LP_PS1")"

# Insert it in the prompt
LP_PS1="${LP_TITLE}${LP_PS1}"
