  ### DYNAMIC GHOSTTY THEME CONFIG ###

  # Detect the active Ghostty theme (first non-commented theme= line)
  local _ghostty_theme=""
  local _ghostty_config="$HOME/.config/ghostty/config"
  if [[ -f "$_ghostty_config" ]]; then
    _ghostty_theme=$(grep -E "^theme[[:space:]]*=" "$_ghostty_config" | tail -1 | sed 's/^theme[[:space:]]*=[[:space:]]*//' | sed 's/[[:space:]]*$//')
  fi

  #!################# GHOSTTY GLACIER THEME ############################

  if [[ "$_ghostty_theme" == "glacier" ]]; then

    # OS Icon (Apple logo)
    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=45
    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=17

    # Directory coloring
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=45
    typeset -g POWERLEVEL9K_DIR_BACKGROUND=17

    # Git Branch Coloring
    # Clean
    typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=238
    typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=6
    typeset -g MY_GIT_CLEAN_COLOR='%21F'
    ## Untracked
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=33
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=6
    typeset -g MY_GIT_UNTRACKED_COLOR='%1F'
    ## Modified
    typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=33
    typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=6
    typeset -g MY_GIT_MODIFIED_COLOR='%1F'

    # Time
    typeset -g POWERLEVEL9K_TIME_FOREGROUND=45
    typeset -g POWERLEVEL9K_TIME_BACKGROUND=8

    # Execution Time
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=231
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=27

    # ls directory colors
    export LSCOLORS="dbfxcxdxbxegedabagacad"
    export LS_COLORS="di=1;4;38;5;27:*.md=38;5;177;"

     #!################# GHOSTTY CIAPRE THEME ############################

  elif [[ "$_ghostty_theme" == "Ciapre" ]]; then

    # OS Icon (Apple logo)
    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=232
    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=52

    # Directory coloring
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=14
    typeset -g POWERLEVEL9K_DIR_BACKGROUND=52

    # Git Branch Coloring
    # Clean
    typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=232
    typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=6
    typeset -g MY_GIT_CLEAN_COLOR='%232F'
    ## Untracked
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=232
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=6
    typeset -g MY_GIT_UNTRACKED_COLOR='%196F'
    ## Modified
    typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=232
    typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=6
    typeset -g MY_GIT_MODIFIED_COLOR='%196F'

    # Time
    typeset -g POWERLEVEL9K_TIME_FOREGROUND=14
    typeset -g POWERLEVEL9K_TIME_BACKGROUND=6

    # ls directory colors (bright cyan #14 on red #1 bg)
    export LSCOLORS="Gbfxcxdxbxegedabagacad"
    export LS_COLORS="di=1;4;38;5;27:*.md=38;5;177;"

     #!################# GHOSTTY FAHRENHEIT THEME ############################

      elif [[ "$_ghostty_theme" == "fahrenheit" ]]; then

    # OS Icon (Apple logo)
    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=137
    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=52

    # Directory coloring
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=137
    typeset -g POWERLEVEL9K_DIR_BACKGROUND=52

    # Git Branch Coloring
    # Clean
    typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=88
    typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=235
    typeset -g MY_GIT_CLEAN_COLOR='%2F'
    ## Untracked
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=33
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=235
    typeset -g MY_GIT_UNTRACKED_COLOR='%12F'
    ## Modified
    typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=33
    typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=235
    typeset -g MY_GIT_MODIFIED_COLOR='%12F'

    # Time
    typeset -g POWERLEVEL9K_TIME_FOREGROUND=13
    typeset -g POWERLEVEL9K_TIME_BACKGROUND=235

    # ls directory colors
    export LSCOLORS="dbfxcxdxbxegedabagacad"
    export LS_COLORS="di=1;4;38;5;27:*.md=38;5;177;"

    #####! GHOSTTY ROSE PINE MOON THEME #####

    elif [[ "$_ghostty_theme" == "Rose Pine Moon" ]]; then

    # OS Icon (Apple logo)
    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=219
    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=232

    # Directory coloring
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=219
    typeset -g POWERLEVEL9K_DIR_BACKGROUND=232

    # Git Branch Coloring
    # Clean
    typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=88
    typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=60
    typeset -g MY_GIT_CLEAN_COLOR='%16F'
    ## Untracked
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=33
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=60
    typeset -g MY_GIT_UNTRACKED_COLOR='%207F'
    ## Modified
    typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=33
    typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=60
    typeset -g MY_GIT_MODIFIED_COLOR='%207F'

    # Execution Time
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=207
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=8

    # Time
    typeset -g POWERLEVEL9K_TIME_FOREGROUND=219
    typeset -g POWERLEVEL9K_TIME_BACKGROUND=232

    # ls directory colors
    export LSCOLORS="dbfxcxdxbxegedabagacad"
    export LS_COLORS="di=1;4;38;5;27:*.md=38;5;177;"

         #!################# GHOSTTY HOMEBREW THEME ############################

      elif [[ "$_ghostty_theme" == "Homebrew" ]]; then

    # OS Icon (Apple logo)
    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=46
    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=234

    # Directory coloring
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=46
    typeset -g POWERLEVEL9K_DIR_BACKGROUND=234

    # Git Branch Coloring
    # Clean
    typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=238
    typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=240
    typeset -g MY_GIT_CLEAN_COLOR='%232F'
    ## Untracked
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=33
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=240
    typeset -g MY_GIT_UNTRACKED_COLOR='%124F'
    ## Modified
    typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=33
    typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=240
    typeset -g MY_GIT_MODIFIED_COLOR='%124F'

    # Time
    typeset -g POWERLEVEL9K_TIME_FOREGROUND=46
    typeset -g POWERLEVEL9K_TIME_BACKGROUND=234

    # Execution Time
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=231
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=28

    # ls directory colors
    export LSCOLORS="dbfxcxdxbxegedabagacad"
    export LS_COLORS="di=1;4;38;5;27:*.md=38;5;177;"

  fi
