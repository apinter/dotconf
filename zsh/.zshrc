# If you come from bash you might have to change your $PATH.
export PATH=/sbin:/usr/sbin:/usr/local/sbin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/home/apinter/.local/bin:/home/apinter/.local/bin:/snap/bin:$HOME/.local/share/flatpak/exports/bin

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi


# Path to your oh-my-zsh installation.
ZSH=/home/apinter/.oh-my-zsh
DEFAULT_USER=apinter
prompt_context(){}
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sunrise" #agnoster

#POWERLINE_DATE_FORMAT="%D{%d-%m}"
#POWERLINE_HIDE_HOST_NAME="true"
#POWERLINE_DETECT_SSH="true"
#POWERLINE_GIT_CLEAN="✔"
#POWERLINE_GIT_DIRTY="✘"
#POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
#POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
#POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
#POWERLINE_GIT_UNTRACKED="%F{cyan}✭%F{black}"
#POWERLINE_GIT_RENAMED="➜"
#POWERLINE_GIT_UNMERGED="═"
#POWERLINE_RIGHT_A_COLOR_FRONT="black"
#POWERLINE_RIGHT_A_COLOR_BACK="red"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rsync gcloud)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on 
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' rehash true
export ANSIBLE_NOCOWS=1

## System Stuff
alias ls="ls -alh --color=auto"
alias tmux="tmux -f ~/.tmux/tmux.conf -u"
alias cdp="cd ~/Project"
alias cdh="cd ~/Project/Home"
alias cda="cd ~/Project/Ansible"
alias cdpa="cd ~/Project/Antavo"
alias cdg="cd ~/Project/git"
alias cdd="cd ~/Downloads"
alias cdm="cd ~/Media"
alias e="vim"
alias se="emacs -nw"

## Entertainment Stuff
alias allmediaup="sudo mount 172.168.1.3:/shirayuki/Aurora /home/apinter/Project/Home/Aurora/Reno"
alias allmediadown="sudo umount /home/apinter/Project/Home/Aurora/Reno"
alias bminecraft="cp -r ~/.minecraft ~/Games/BK/minecraft_BK-$(date +%Y%m%d_%H%M%S)"
alias msce="rclone"
alias sup="sudo zypper ref; sudo zypper dup; sudo flatpak update -y; flatpak --user update -y"
alias antavoup="sudo openvpn ~/Project/Antavo/antavo-dev-attilapinter.conf"
alias cdga="cd /home/apinter/Project/Antavo/git"

## Security Stuff
alias knoxup="cryfs ~/.local/share/plasma-vault/Knox.enc ~/Vaults/Knox"
alias knoxdown="cryfs-unmount /home/apinter/Vaults/Knox"

## Kubectl stuff
alias k='kubectl'
alias kg='kubectl get'
alias kgns='kubectl get ns'
alias kgsvc='kubectl get services'
alias kging='kubectl get ing'
alias kgpo='kubectl get pod'
alias ksysgpo='kubectl --namespace=kube-system get pod'
alias krm='kubectl delete'
alias krmf='kubectl delete'
alias krming='kubectl delete ingress'
alias krmingl='kubectl delete ingress -l'
alias krmingall='kubectl delete ingress --all-namespaces'
alias kgsvcoyaml='kubectl get service -o=yaml'
alias kgsvcwn='watch kubectl get service --namespace'
alias kgsvcslwn='watch kubectl get service --show-labels --namespace'
alias kgwf='watch kubectl get'

source ~/.helmrc
source <(kubectl completion zsh)
