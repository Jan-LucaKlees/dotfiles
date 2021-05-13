# gnutils and the like
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias cp='cp -v'
alias clip='xclip -selection clipboard'

# systemd
alias sc='sudo systemctl'
alias scu='systemctl --user'

# pacman / yay
alias pac='pacman'
alias spac='sudo pacman'
alias updateall='yay -Syu && nvim +PlugUpdate +UpdateRemotePlugins +qall'

# neovim
alias vi='nvim'
alias vim='nvim'
alias gvi='nvim $(git status --porcelain | cut -s -f 2 -d M)'
alias svi='sudo -E nvim'
alias svim='sudo -E nvim'
alias snvim='sudo -E nvim'

# git aliases
_git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
_git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
alias gco='git checkout'
alias gls='git status'
alias gl='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
alias gap='git add --patch'
alias gd='git diff'
alias gdc='git diff --cached'
alias ggi='git commit'
alias ggia='git commit --amend --no-edit'
alias ggiae='git commit --amend'
alias gri='git rebase --interactive'

# docker
alias dc='docker-compose'
alias dcup='docker-compose up -d'
alias dce='docker-compose exec'
alias dcre='docker-compose up -d --no-deps --build'
alias dcr='docker-compose run --rm'

# misc
alias py='python'
alias weather='curl -s wttr.in/Hamburg'

