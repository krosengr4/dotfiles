typeset -U path

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="cloud"
#ZSH_THEME="Miloshadzic"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )bl

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git copypath copyfile)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Oh My Zsh Plugin alias
alias cpfile='copyfile'
alias cppath='copypath'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gpom='git push origin main'
alias gpod='git push origin develop'
alias gpl="git pull"
alias gpsh="git push"
alias gb="git branch"
alias gpou="git push -u origin"
alias gco="git checkout"

# Neovim
alias vi="nvim"

# Open IDE alias
alias dev="open -a 'IntelliJ IDEA CE'"

# alias for bash in zsh
autoload -Uz run-help
unalias run-help 2>/dev/null
alias help=run-help

# Terminal alias
alias reload="source ~/.zshrc"
alias rld="source ~/.zshrc"
alias rldaero="aerospace reload-config"
alias sbarrld="sketchybar --reload"
alias clr="clear"

# RosenPi alias
alias sshpi="ssh krosengren@rosenpi.local"

# npm
alias npmrd="npm run dev"

# Kubectl alias
alias kgp="kubectl get pods"
alias kd="kubectl describe"
alias kctx="kubectl config current-context"

# Docker aliases
alias dps="docker ps"
alias di="docker images"

# Go aliases
alias gr="go run"
alias gmi="go mod init"
alias gob="go build"

# Ghostty alias
alias ghothem="ghostty +list-themes"
alias ghobin="ghostty +list-keybinds --default"
alias chtheme="ghostty-theme"

#Opening webpages
alias ghub="open https://github.com/krosengr4"
alias ytube="open https://youtube.com"
alias mtype="open https://monkeytype.com"
alias intest="open https://fast.com"
alias gmail="open https://gmail.com"
alias ojenk='open http://localhost:9090'

# Docs
alias ghodocs="open https://ghostty.org/docs/config"
alias claudedocs="open https://code.claude.com/docs/en/overview"

# Opening applications
alias goog="open -n -a 'Google Chrome'"
alias docdes="open -a 'Docker Desktop'"
alias ocalc="open -a Calculator"
alias omus="open -a Music"
alias ostick="open -a Stickies"
alias oraz="open -a Razer"
alias onote="open -a Notes"
alias omysql="open -a MySQLWorkbench"
alias opass="open -a Passwords"
alias oset="open -a Settings"
alias oapp="open -a 'App Store'"
alias opost="open -a Postman"
alias tascl="open -a Tailscale"
alias omes="open -a Messages"
alias stemo="open -a SteerMouse"
alias cpick="open -a 'Color Picker'"

# Open config files
alias confz="nvim ~/.zshrc"
alias confgho="nvim ~/.config/ghostty/config"
alias confaer="nvim ~/.config/aerospace/aerospace.toml"

# Environment variables
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Load local secrets (not tracked in git)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/kevinrosengren/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Ghostty current dir tab/window title
autoload -Uz add-zsh-hook
_set_tab_title() { echo -ne "\033]0;${PWD##*/}\007" }
_set_tab_title_preexec() {
  local cmd="${1%% *}"
  local args="${1#* }"
  case "$cmd" in
    nvim|vi|vim)
      if [[ "$args" != "$cmd" ]]; then
        echo -ne "\033]0;nvim ${args##*/} | ${PWD##*/}\007"
      else
        echo -ne "\033]0;nvim | ${PWD##*/}\007"
      fi
      ;;
  esac
}
add-zsh-hook precmd _set_tab_title
add-zsh-hook preexec _set_tab_title_preexec

# Zoxide directory finder
eval "$(zoxide init zsh)"

# Atuin shell history
eval "$(atuin init zsh)"

# Fuzzy Finder
eval "$(fzf --zsh)"

# File, Directory, symlink, and executable colors
export CLICOLOR=1

# LS_COLORS for gls (coreutils)
export LS_COLORS='di=1;38;5;4'      # directories (bold)
LS_COLORS+=':ln=1;38;5;51'           # symlinks (bold)
LS_COLORS+=':ex=1;38;5;82'           # executables (bold)
LS_COLORS+=':ow=30;42'               # world-writable dirs 

# File extensions
LS_COLORS+=':*.deb=38;5;9'      #.deb 
LS_COLORS+=':*.java=38;5;9'     #.java  
LS_COLORS+=':*.sh=38;5;82'      #.sh    
LS_COLORS+=':*.yaml=38;5;226'   #.yaml  
LS_COLORS+=':*.yml=38;5;226'    #.yml
LS_COLORS+=':*.sql=38;5;137'     #.sql 
LS_COLORS+=':*.go=38;5;81'      #.go  
LS_COLORS+=':*.js=38;5;220'     #.js   
LS_COLORS+=':*.json=38;5;178'   #.json    
LS_COLORS+=':*.md=38;5;174'     #.md     

# coreutils for colored files/directories etc.
alias ls='gls --color=auto'

# Funciton to show 300 colors
showColors() {
    for i in {0..255}; do
        print -P "%F{$i}Color $i%f"
    done
}
# alias for colors function ^
alias shcol="showColors"

# configure p10k file
alias confpk='nvim ~/.config/p10k/.p10k.zsh'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/p10k/.p10k.zsh ]] || source ~/.config/p10k/.p10k.zsh

# Setting EDITOR AND VISUAL
export EDITOR=nvim
export VISUAL=nvim

# nnn
export NNN_PLUG='o:nuke;f:finder;z:z'
export NNN_OPENER=~/.config/nnn/plugins/nuke
export NNN_GIT=1

n() {
    [ "${NNNLVL:-0}" -eq 0 ] || { echo "nnn is already running"; return; }
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    ~/.local/bin/nnn -cG "$@"
    [ -f "$NNN_TMPFILE" ] && { . "$NNN_TMPFILE"; rm -f "$NNN_TMPFILE"; }
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
