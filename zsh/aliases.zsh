# Oh My Zsh Plugin
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

# Terminal alias
alias reload="source ~/.config/zsh/.zshrc"
alias rld="source ~/.config/zsh/.zshrc"
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
alias confz="nvim ~/.config/zsh/.zshrc"
alias confgho="nvim ~/.config/ghostty/config"
alias confaer="nvim ~/.config/aerospace/aerospace.toml"

# coreutils for colored files/directories etc.
alias ls='gls --color=auto'

# configure p10k file
alias confpk='nvim ~/.config/p10k/.p10k.zsh'

# alias for colors function ^
alias shcol="showColors"

