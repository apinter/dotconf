# If you come from bash you might have to change your $PATH.
# Required packages:
# https://github.com/marlonrichert/zsh-autocomplete
# https://github.com/zsh-users/zsh-autosuggestions/
# https://github.com/zsh-users/zsh-syntax-highlighting/

set NIX_LINK $HOME/.nix-profile
export NIX_SSL_CERT_FILE=/etc/ssl/ca-bundle.pem
export PATH=/sbin:/usr/sbin:/usr/local/sbin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/home/apinter/.local/bin:/home/apinter/.local/bin:/snap/bin:$HOME/.local/share/flatpak/exports/bin:$HOME/.cargo/bin:$NIX_LINK/bin

#source /home/apinter/Downloads/google-cloud-sdk/path.fish.inc  
#source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

## Envs
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export AZURE_CONFIG_DIR=$XDG_DATA_HOME/azure
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export TMUX_CONF=~/.config/tmux/tmux.conf

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

export EDITOR='vim'
export VISUAL='vim'

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
plugins=(git 
	rsync 
	gcloud
	zsh-syntax-highlighting
	zsh-autosuggestions
)


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
fpath+=~/.zfunc
source $ZSH/oh-my-zsh.sh
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]=underline
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on 
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' rehash true
export ANSIBLE_NOCOWS=1
export XDG_CONFIG_DIR=$HOME/.config

## System Stuff
#alias sup="sudo zypper ref; sudo zypper dup -y -l; flatpak update --user -y"
alias cdgd="cd $HOME/Project/git/dotconf"
alias dotfiles='/usr/bin/git --git-dir=$HOME/Project/git/dotconf/.git --work-tree=$HOME/Project/git/dotconf'
alias ll="ls -alh --color=auto"
alias diablo2="WINEARCH=win32 WINEPREFIX=~/.wine32 wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Diablo\ II/Diablo\ II.exe -w"
alias tmux="tmux -f ~/.config/tmux/tmux.conf -u"
alias cdp="cd ~/Project"
alias cdh="cd ~/Project/Home"
alias cda="cd ~/Project/Ansible"
alias cdpa="cd ~/Project/Antavo"
alias cdpag="cd ~/Project/Antavo/git"
alias cdpagg="cd ~/Project/Antavo/git/GitlabClone"
alias cdpaa="cd ~/Project/Antavo/ansible"
alias cdg="cd ~/Project/git"
alias cdd="cd ~/Downloads"
alias cdm="cd ~/Media"
alias e="vim"
alias se="emacs -nw"
alias tf="terraform"


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
alias ksys='kubectl --namespace=kube-system'
alias ka='kubectl apply -f'
alias ksysa='kubectl --namespace=kube-system apply --recursive -f'
alias kak='kubectl apply -k'
alias kk='kubectl kustomize'
alias kex='kubectl exec -i -t'
alias ksysex='kubectl --namespace=kube-system exec -i -t'
alias klo='kubectl logs -f'
alias ksyslo='kubectl --namespace=kube-system logs -f'
alias klop='kubectl logs -f -p'
alias ksyslop='kubectl --namespace=kube-system logs -f -p'
alias kp='kubectl proxy'
alias kpf='kubectl port-forward'
alias kg='kubectl get'
alias ksysg='kubectl --namespace=kube-system get'
alias kd='kubectl describe'
alias ksysd='kubectl --namespace=kube-system describe'
alias krm='kubectl delete'
alias ksysrm='kubectl --namespace=kube-system delete'
alias krun='kubectl run --rm --restart=Never --image-pull-policy=IfNotPresent -i -t'
alias ksysrun='kubectl --namespace=kube-system run --rm --restart=Never --image-pull-policy=IfNotPresent -i -t'
alias kgpo='kubectl get pods'
alias ksysgpo='kubectl --namespace=kube-system get pods'
alias kdpo='kubectl describe pods'
alias ksysdpo='kubectl --namespace=kube-system describe pods'
alias krmpo='kubectl delete pods'
alias ksysrmpo='kubectl --namespace=kube-system delete pods'
alias kgdep='kubectl get deployment'
alias ksysgdep='kubectl --namespace=kube-system get deployment'
alias kddep='kubectl describe deployment'
alias ksysddep='kubectl --namespace=kube-system describe deployment'
alias krmdep='kubectl delete deployment'
alias ksysrmdep='kubectl --namespace=kube-system delete deployment'
alias kgsvc='kubectl get service'
alias ksysgsvc='kubectl --namespace=kube-system get service'
alias kdsvc='kubectl describe service'
alias ksysdsvc='kubectl --namespace=kube-system describe service'
alias krmsvc='kubectl delete service'
alias ksysrmsvc='kubectl --namespace=kube-system delete service'
alias kging='kubectl get ingress'
alias ksysging='kubectl --namespace=kube-system get ingress'
alias kding='kubectl describe ingress'
alias ksysding='kubectl --namespace=kube-system describe ingress'
alias krming='kubectl delete ingress'
alias ksysrming='kubectl --namespace=kube-system delete ingress'
alias kgcm='kubectl get configmap'
alias ksysgcm='kubectl --namespace=kube-system get configmap'
alias kdcm='kubectl describe configmap'
alias ksysdcm='kubectl --namespace=kube-system describe configmap'
alias krmcm='kubectl delete configmap'
alias ksysrmcm='kubectl --namespace=kube-system delete configmap'
alias kgsec='kubectl get secret'
alias ksysgsec='kubectl --namespace=kube-system get secret'
alias kdsec='kubectl describe secret'
alias ksysdsec='kubectl --namespace=kube-system describe secret'
alias krmsec='kubectl delete secret'
alias ksysrmsec='kubectl --namespace=kube-system delete secret'
alias kgno='kubectl get nodes'
alias kdno='kubectl describe nodes'
alias kgns='kubectl get namespaces'
alias kdns='kubectl describe namespaces'
alias krmns='kubectl delete namespaces'
alias kgoyaml='kubectl get -o=yaml'
alias ksysgoyaml='kubectl --namespace=kube-system get -o=yaml'
alias kgpooyaml='kubectl get pods -o=yaml'
alias ksysgpooyaml='kubectl --namespace=kube-system get pods -o=yaml'
alias kgdepoyaml='kubectl get deployment -o=yaml'
alias ksysgdepoyaml='kubectl --namespace=kube-system get deployment -o=yaml'
alias kgsvcoyaml='kubectl get service -o=yaml'
alias ksysgsvcoyaml='kubectl --namespace=kube-system get service -o=yaml'
alias kgingoyaml='kubectl get ingress -o=yaml'
alias ksysgingoyaml='kubectl --namespace=kube-system get ingress -o=yaml'
alias kgcmoyaml='kubectl get configmap -o=yaml'
alias ksysgcmoyaml='kubectl --namespace=kube-system get configmap -o=yaml'
alias kgsecoyaml='kubectl get secret -o=yaml'
alias ksysgsecoyaml='kubectl --namespace=kube-system get secret -o=yaml'
alias kgnooyaml='kubectl get nodes -o=yaml'
alias kgnsoyaml='kubectl get namespaces -o=yaml'
alias kgowide='kubectl get -o=wide'
alias ksysgowide='kubectl --namespace=kube-system get -o=wide'
alias kgpoowide='kubectl get pods -o=wide'
alias ksysgpoowide='kubectl --namespace=kube-system get pods -o=wide'
alias kgdepowide='kubectl get deployment -o=wide'
alias ksysgdepowide='kubectl --namespace=kube-system get deployment -o=wide'
alias kgsvcowide='kubectl get service -o=wide'
alias ksysgsvcowide='kubectl --namespace=kube-system get service -o=wide'
alias kgingowide='kubectl get ingress -o=wide'
alias ksysgingowide='kubectl --namespace=kube-system get ingress -o=wide'
alias kgcmowide='kubectl get configmap -o=wide'
alias ksysgcmowide='kubectl --namespace=kube-system get configmap -o=wide'
alias kgsecowide='kubectl get secret -o=wide'
alias ksysgsecowide='kubectl --namespace=kube-system get secret -o=wide'
alias kgnoowide='kubectl get nodes -o=wide'
alias kgnsowide='kubectl get namespaces -o=wide'
alias kgojson='kubectl get -o=json'
alias ksysgojson='kubectl --namespace=kube-system get -o=json'
alias kgpoojson='kubectl get pods -o=json'
alias ksysgpoojson='kubectl --namespace=kube-system get pods -o=json'
alias kgdepojson='kubectl get deployment -o=json'
alias ksysgdepojson='kubectl --namespace=kube-system get deployment -o=json'
alias kgsvcojson='kubectl get service -o=json'
alias ksysgsvcojson='kubectl --namespace=kube-system get service -o=json'
alias kgingojson='kubectl get ingress -o=json'
alias ksysgingojson='kubectl --namespace=kube-system get ingress -o=json'
alias kgcmojson='kubectl get configmap -o=json'
alias ksysgcmojson='kubectl --namespace=kube-system get configmap -o=json'
alias kgsecojson='kubectl get secret -o=json'
alias ksysgsecojson='kubectl --namespace=kube-system get secret -o=json'
alias kgnoojson='kubectl get nodes -o=json'
alias kgnsojson='kubectl get namespaces -o=json'
alias kgall='kubectl get --all-namespaces'
alias kdall='kubectl describe --all-namespaces'
alias kgpoall='kubectl get pods --all-namespaces'
alias kdpoall='kubectl describe pods --all-namespaces'
alias kgdepall='kubectl get deployment --all-namespaces'
alias kddepall='kubectl describe deployment --all-namespaces'
alias kgsvcall='kubectl get service --all-namespaces'
alias kdsvcall='kubectl describe service --all-namespaces'
alias kgingall='kubectl get ingress --all-namespaces'
alias kdingall='kubectl describe ingress --all-namespaces'
alias kgcmall='kubectl get configmap --all-namespaces'
alias kdcmall='kubectl describe configmap --all-namespaces'
alias kgsecall='kubectl get secret --all-namespaces'
alias kdsecall='kubectl describe secret --all-namespaces'
alias kgnsall='kubectl get namespaces --all-namespaces'
alias kdnsall='kubectl describe namespaces --all-namespaces'
alias kgsl='kubectl get --show-labels'
alias ksysgsl='kubectl --namespace=kube-system get --show-labels'
alias kgposl='kubectl get pods --show-labels'
alias ksysgposl='kubectl --namespace=kube-system get pods --show-labels'
alias kgdepsl='kubectl get deployment --show-labels'
alias ksysgdepsl='kubectl --namespace=kube-system get deployment --show-labels'
alias krmall='kubectl delete --all'
alias ksysrmall='kubectl --namespace=kube-system delete --all'
alias krmpoall='kubectl delete pods --all'
alias ksysrmpoall='kubectl --namespace=kube-system delete pods --all'
alias krmdepall='kubectl delete deployment --all'
alias ksysrmdepall='kubectl --namespace=kube-system delete deployment --all'
alias krmsvcall='kubectl delete service --all'
alias ksysrmsvcall='kubectl --namespace=kube-system delete service --all'
alias krmingall='kubectl delete ingress --all'
alias ksysrmingall='kubectl --namespace=kube-system delete ingress --all'
alias krmcmall='kubectl delete configmap --all'
alias ksysrmcmall='kubectl --namespace=kube-system delete configmap --all'
alias krmsecall='kubectl delete secret --all'
alias ksysrmsecall='kubectl --namespace=kube-system delete secret --all'
alias krmnsall='kubectl delete namespaces --all'
alias kgw='kubectl get --watch'
alias ksysgw='kubectl --namespace=kube-system get --watch'
alias kgpow='kubectl get pods --watch'
alias ksysgpow='kubectl --namespace=kube-system get pods --watch'
alias kgdepw='kubectl get deployment --watch'
alias ksysgdepw='kubectl --namespace=kube-system get deployment --watch'
alias kgsvcw='kubectl get service --watch'
alias ksysgsvcw='kubectl --namespace=kube-system get service --watch'
alias kgingw='kubectl get ingress --watch'
alias ksysgingw='kubectl --namespace=kube-system get ingress --watch'
alias kgcmw='kubectl get configmap --watch'
alias ksysgcmw='kubectl --namespace=kube-system get configmap --watch'
alias kgsecw='kubectl get secret --watch'
alias ksysgsecw='kubectl --namespace=kube-system get secret --watch'
alias kgnow='kubectl get nodes --watch'
alias kgnsw='kubectl get namespaces --watch'
alias kgoyamlall='kubectl get -o=yaml --all-namespaces'
alias kgpooyamlall='kubectl get pods -o=yaml --all-namespaces'
alias kgdepoyamlall='kubectl get deployment -o=yaml --all-namespaces'
alias kgsvcoyamlall='kubectl get service -o=yaml --all-namespaces'
alias kgingoyamlall='kubectl get ingress -o=yaml --all-namespaces'
alias kgcmoyamlall='kubectl get configmap -o=yaml --all-namespaces'
alias kgsecoyamlall='kubectl get secret -o=yaml --all-namespaces'
alias kgnsoyamlall='kubectl get namespaces -o=yaml --all-namespaces'
alias kgalloyaml='kubectl get --all-namespaces -o=yaml'
alias kgpoalloyaml='kubectl get pods --all-namespaces -o=yaml'
alias kgdepalloyaml='kubectl get deployment --all-namespaces -o=yaml'
alias kgsvcalloyaml='kubectl get service --all-namespaces -o=yaml'
alias kgingalloyaml='kubectl get ingress --all-namespaces -o=yaml'
alias kgcmalloyaml='kubectl get configmap --all-namespaces -o=yaml'
alias kgsecalloyaml='kubectl get secret --all-namespaces -o=yaml'
alias kgnsalloyaml='kubectl get namespaces --all-namespaces -o=yaml'
alias kgwoyaml='kubectl get --watch -o=yaml'
alias ksysgwoyaml='kubectl --namespace=kube-system get --watch -o=yaml'
alias kgpowoyaml='kubectl get pods --watch -o=yaml'
alias ksysgpowoyaml='kubectl --namespace=kube-system get pods --watch -o=yaml'
alias kgdepwoyaml='kubectl get deployment --watch -o=yaml'
alias ksysgdepwoyaml='kubectl --namespace=kube-system get deployment --watch -o=yaml'
alias kgsvcwoyaml='kubectl get service --watch -o=yaml'
alias ksysgsvcwoyaml='kubectl --namespace=kube-system get service --watch -o=yaml'
alias kgingwoyaml='kubectl get ingress --watch -o=yaml'
alias ksysgingwoyaml='kubectl --namespace=kube-system get ingress --watch -o=yaml'
alias kgcmwoyaml='kubectl get configmap --watch -o=yaml'
alias ksysgcmwoyaml='kubectl --namespace=kube-system get configmap --watch -o=yaml'
alias kgsecwoyaml='kubectl get secret --watch -o=yaml'
alias ksysgsecwoyaml='kubectl --namespace=kube-system get secret --watch -o=yaml'
alias kgnowoyaml='kubectl get nodes --watch -o=yaml'
alias kgnswoyaml='kubectl get namespaces --watch -o=yaml'
alias kgowideall='kubectl get -o=wide --all-namespaces'
alias kgpoowideall='kubectl get pods -o=wide --all-namespaces'
alias kgdepowideall='kubectl get deployment -o=wide --all-namespaces'
alias kgsvcowideall='kubectl get service -o=wide --all-namespaces'
alias kgingowideall='kubectl get ingress -o=wide --all-namespaces'
alias kgcmowideall='kubectl get configmap -o=wide --all-namespaces'
alias kgsecowideall='kubectl get secret -o=wide --all-namespaces'
alias kgnsowideall='kubectl get namespaces -o=wide --all-namespaces'
alias kgallowide='kubectl get --all-namespaces -o=wide'
alias kgpoallowide='kubectl get pods --all-namespaces -o=wide'
alias kgdepallowide='kubectl get deployment --all-namespaces -o=wide'
alias kgsvcallowide='kubectl get service --all-namespaces -o=wide'
alias kgingallowide='kubectl get ingress --all-namespaces -o=wide'
alias kgcmallowide='kubectl get configmap --all-namespaces -o=wide'
alias kgsecallowide='kubectl get secret --all-namespaces -o=wide'
alias kgnsallowide='kubectl get namespaces --all-namespaces -o=wide'
alias kgowidesl='kubectl get -o=wide --show-labels'
alias ksysgowidesl='kubectl --namespace=kube-system get -o=wide --show-labels'
alias kgpoowidesl='kubectl get pods -o=wide --show-labels'
alias ksysgpoowidesl='kubectl --namespace=kube-system get pods -o=wide --show-labels'
alias kgdepowidesl='kubectl get deployment -o=wide --show-labels'
alias ksysgdepowidesl='kubectl --namespace=kube-system get deployment -o=wide --show-labels'
alias kgslowide='kubectl get --show-labels -o=wide'
alias ksysgslowide='kubectl --namespace=kube-system get --show-labels -o=wide'
alias kgposlowide='kubectl get pods --show-labels -o=wide'
alias ksysgposlowide='kubectl --namespace=kube-system get pods --show-labels -o=wide'
alias kgdepslowide='kubectl get deployment --show-labels -o=wide'
alias ksysgdepslowide='kubectl --namespace=kube-system get deployment --show-labels -o=wide'
alias kgwowide='kubectl get --watch -o=wide'
alias ksysgwowide='kubectl --namespace=kube-system get --watch -o=wide'
alias kgpowowide='kubectl get pods --watch -o=wide'
alias ksysgpowowide='kubectl --namespace=kube-system get pods --watch -o=wide'
alias kgdepwowide='kubectl get deployment --watch -o=wide'
alias ksysgdepwowide='kubectl --namespace=kube-system get deployment --watch -o=wide'
alias kgsvcwowide='kubectl get service --watch -o=wide'
alias ksysgsvcwowide='kubectl --namespace=kube-system get service --watch -o=wide'
alias kgingwowide='kubectl get ingress --watch -o=wide'
alias ksysgingwowide='kubectl --namespace=kube-system get ingress --watch -o=wide'
alias kgcmwowide='kubectl get configmap --watch -o=wide'
alias ksysgcmwowide='kubectl --namespace=kube-system get configmap --watch -o=wide'
alias kgsecwowide='kubectl get secret --watch -o=wide'
alias ksysgsecwowide='kubectl --namespace=kube-system get secret --watch -o=wide'
alias kgnowowide='kubectl get nodes --watch -o=wide'
alias kgnswowide='kubectl get namespaces --watch -o=wide'
alias kgojsonall='kubectl get -o=json --all-namespaces'
alias kgpoojsonall='kubectl get pods -o=json --all-namespaces'
alias kgdepojsonall='kubectl get deployment -o=json --all-namespaces'
alias kgsvcojsonall='kubectl get service -o=json --all-namespaces'
alias kgingojsonall='kubectl get ingress -o=json --all-namespaces'
alias kgcmojsonall='kubectl get configmap -o=json --all-namespaces'
alias kgsecojsonall='kubectl get secret -o=json --all-namespaces'
alias kgnsojsonall='kubectl get namespaces -o=json --all-namespaces'
alias kgallojson='kubectl get --all-namespaces -o=json'
alias kgpoallojson='kubectl get pods --all-namespaces -o=json'
alias kgdepallojson='kubectl get deployment --all-namespaces -o=json'
alias kgsvcallojson='kubectl get service --all-namespaces -o=json'
alias kgingallojson='kubectl get ingress --all-namespaces -o=json'
alias kgcmallojson='kubectl get configmap --all-namespaces -o=json'
alias kgsecallojson='kubectl get secret --all-namespaces -o=json'
alias kgnsallojson='kubectl get namespaces --all-namespaces -o=json'
alias kgwojson='kubectl get --watch -o=json'
alias ksysgwojson='kubectl --namespace=kube-system get --watch -o=json'
alias kgpowojson='kubectl get pods --watch -o=json'
alias ksysgpowojson='kubectl --namespace=kube-system get pods --watch -o=json'
alias kgdepwojson='kubectl get deployment --watch -o=json'
alias ksysgdepwojson='kubectl --namespace=kube-system get deployment --watch -o=json'
alias kgsvcwojson='kubectl get service --watch -o=json'
alias ksysgsvcwojson='kubectl --namespace=kube-system get service --watch -o=json'
alias kgingwojson='kubectl get ingress --watch -o=json'
alias ksysgingwojson='kubectl --namespace=kube-system get ingress --watch -o=json'
alias kgcmwojson='kubectl get configmap --watch -o=json'
alias ksysgcmwojson='kubectl --namespace=kube-system get configmap --watch -o=json'
alias kgsecwojson='kubectl get secret --watch -o=json'
alias ksysgsecwojson='kubectl --namespace=kube-system get secret --watch -o=json'
alias kgnowojson='kubectl get nodes --watch -o=json'
alias kgnswojson='kubectl get namespaces --watch -o=json'
alias kgallsl='kubectl get --all-namespaces --show-labels'
alias kgpoallsl='kubectl get pods --all-namespaces --show-labels'
alias kgdepallsl='kubectl get deployment --all-namespaces --show-labels'
alias kgslall='kubectl get --show-labels --all-namespaces'
alias kgposlall='kubectl get pods --show-labels --all-namespaces'
alias kgdepslall='kubectl get deployment --show-labels --all-namespaces'
alias kgallw='kubectl get --all-namespaces --watch'
alias kgpoallw='kubectl get pods --all-namespaces --watch'
alias kgdepallw='kubectl get deployment --all-namespaces --watch'
alias kgsvcallw='kubectl get service --all-namespaces --watch'
alias kgingallw='kubectl get ingress --all-namespaces --watch'
alias kgcmallw='kubectl get configmap --all-namespaces --watch'
alias kgsecallw='kubectl get secret --all-namespaces --watch'
alias kgnsallw='kubectl get namespaces --all-namespaces --watch'
alias kgwall='kubectl get --watch --all-namespaces'
alias kgpowall='kubectl get pods --watch --all-namespaces'
alias kgdepwall='kubectl get deployment --watch --all-namespaces'
alias kgsvcwall='kubectl get service --watch --all-namespaces'
alias kgingwall='kubectl get ingress --watch --all-namespaces'
alias kgcmwall='kubectl get configmap --watch --all-namespaces'
alias kgsecwall='kubectl get secret --watch --all-namespaces'
alias kgnswall='kubectl get namespaces --watch --all-namespaces'
alias kgslw='kubectl get --show-labels --watch'
alias ksysgslw='kubectl --namespace=kube-system get --show-labels --watch'
alias kgposlw='kubectl get pods --show-labels --watch'
alias ksysgposlw='kubectl --namespace=kube-system get pods --show-labels --watch'
alias kgdepslw='kubectl get deployment --show-labels --watch'
alias ksysgdepslw='kubectl --namespace=kube-system get deployment --show-labels --watch'
alias kgwsl='kubectl get --watch --show-labels'
alias ksysgwsl='kubectl --namespace=kube-system get --watch --show-labels'
alias kgpowsl='kubectl get pods --watch --show-labels'
alias ksysgpowsl='kubectl --namespace=kube-system get pods --watch --show-labels'
alias kgdepwsl='kubectl get deployment --watch --show-labels'
alias ksysgdepwsl='kubectl --namespace=kube-system get deployment --watch --show-labels'
alias kgallwoyaml='kubectl get --all-namespaces --watch -o=yaml'
alias kgpoallwoyaml='kubectl get pods --all-namespaces --watch -o=yaml'
alias kgdepallwoyaml='kubectl get deployment --all-namespaces --watch -o=yaml'
alias kgsvcallwoyaml='kubectl get service --all-namespaces --watch -o=yaml'
alias kgingallwoyaml='kubectl get ingress --all-namespaces --watch -o=yaml'
alias kgcmallwoyaml='kubectl get configmap --all-namespaces --watch -o=yaml'
alias kgsecallwoyaml='kubectl get secret --all-namespaces --watch -o=yaml'
alias kgnsallwoyaml='kubectl get namespaces --all-namespaces --watch -o=yaml'
alias kgwoyamlall='kubectl get --watch -o=yaml --all-namespaces'
alias kgpowoyamlall='kubectl get pods --watch -o=yaml --all-namespaces'
alias kgdepwoyamlall='kubectl get deployment --watch -o=yaml --all-namespaces'
alias kgsvcwoyamlall='kubectl get service --watch -o=yaml --all-namespaces'
alias kgingwoyamlall='kubectl get ingress --watch -o=yaml --all-namespaces'
alias kgcmwoyamlall='kubectl get configmap --watch -o=yaml --all-namespaces'
alias kgsecwoyamlall='kubectl get secret --watch -o=yaml --all-namespaces'
alias kgnswoyamlall='kubectl get namespaces --watch -o=yaml --all-namespaces'
alias kgwalloyaml='kubectl get --watch --all-namespaces -o=yaml'
alias kgpowalloyaml='kubectl get pods --watch --all-namespaces -o=yaml'
alias kgdepwalloyaml='kubectl get deployment --watch --all-namespaces -o=yaml'
alias kgsvcwalloyaml='kubectl get service --watch --all-namespaces -o=yaml'
alias kgingwalloyaml='kubectl get ingress --watch --all-namespaces -o=yaml'
alias kgcmwalloyaml='kubectl get configmap --watch --all-namespaces -o=yaml'
alias kgsecwalloyaml='kubectl get secret --watch --all-namespaces -o=yaml'
alias kgnswalloyaml='kubectl get namespaces --watch --all-namespaces -o=yaml'
alias kgowideallsl='kubectl get -o=wide --all-namespaces --show-labels'
alias kgpoowideallsl='kubectl get pods -o=wide --all-namespaces --show-labels'
alias kgdepowideallsl='kubectl get deployment -o=wide --all-namespaces --show-labels'
alias kgowideslall='kubectl get -o=wide --show-labels --all-namespaces'
alias kgpoowideslall='kubectl get pods -o=wide --show-labels --all-namespaces'
alias kgdepowideslall='kubectl get deployment -o=wide --show-labels --all-namespaces'
alias kgallowidesl='kubectl get --all-namespaces -o=wide --show-labels'
alias kgpoallowidesl='kubectl get pods --all-namespaces -o=wide --show-labels'
alias kgdepallowidesl='kubectl get deployment --all-namespaces -o=wide --show-labels'
alias kgallslowide='kubectl get --all-namespaces --show-labels -o=wide'
alias kgpoallslowide='kubectl get pods --all-namespaces --show-labels -o=wide'
alias kgdepallslowide='kubectl get deployment --all-namespaces --show-labels -o=wide'
alias kgslowideall='kubectl get --show-labels -o=wide --all-namespaces'
alias kgposlowideall='kubectl get pods --show-labels -o=wide --all-namespaces'
alias kgdepslowideall='kubectl get deployment --show-labels -o=wide --all-namespaces'
alias kgslallowide='kubectl get --show-labels --all-namespaces -o=wide'
alias kgposlallowide='kubectl get pods --show-labels --all-namespaces -o=wide'
alias kgdepslallowide='kubectl get deployment --show-labels --all-namespaces -o=wide'
alias kgallwowide='kubectl get --all-namespaces --watch -o=wide'
alias kgpoallwowide='kubectl get pods --all-namespaces --watch -o=wide'
alias kgdepallwowide='kubectl get deployment --all-namespaces --watch -o=wide'
alias kgsvcallwowide='kubectl get service --all-namespaces --watch -o=wide'
alias kgingallwowide='kubectl get ingress --all-namespaces --watch -o=wide'
alias kgcmallwowide='kubectl get configmap --all-namespaces --watch -o=wide'
alias kgsecallwowide='kubectl get secret --all-namespaces --watch -o=wide'
alias kgnsallwowide='kubectl get namespaces --all-namespaces --watch -o=wide'
alias kgwowideall='kubectl get --watch -o=wide --all-namespaces'
alias kgpowowideall='kubectl get pods --watch -o=wide --all-namespaces'
alias kgdepwowideall='kubectl get deployment --watch -o=wide --all-namespaces'
alias kgsvcwowideall='kubectl get service --watch -o=wide --all-namespaces'
alias kgingwowideall='kubectl get ingress --watch -o=wide --all-namespaces'
alias kgcmwowideall='kubectl get configmap --watch -o=wide --all-namespaces'
alias kgsecwowideall='kubectl get secret --watch -o=wide --all-namespaces'
alias kgnswowideall='kubectl get namespaces --watch -o=wide --all-namespaces'
alias kgwallowide='kubectl get --watch --all-namespaces -o=wide'
alias kgpowallowide='kubectl get pods --watch --all-namespaces -o=wide'
alias kgdepwallowide='kubectl get deployment --watch --all-namespaces -o=wide'
alias kgsvcwallowide='kubectl get service --watch --all-namespaces -o=wide'
alias kgingwallowide='kubectl get ingress --watch --all-namespaces -o=wide'
alias kgcmwallowide='kubectl get configmap --watch --all-namespaces -o=wide'
alias kgsecwallowide='kubectl get secret --watch --all-namespaces -o=wide'
alias kgnswallowide='kubectl get namespaces --watch --all-namespaces -o=wide'
alias kgslwowide='kubectl get --show-labels --watch -o=wide'
alias ksysgslwowide='kubectl --namespace=kube-system get --show-labels --watch -o=wide'
alias kgposlwowide='kubectl get pods --show-labels --watch -o=wide'
alias ksysgposlwowide='kubectl --namespace=kube-system get pods --show-labels --watch -o=wide'
alias kgdepslwowide='kubectl get deployment --show-labels --watch -o=wide'
alias ksysgdepslwowide='kubectl --namespace=kube-system get deployment --show-labels --watch -o=wide'
alias kgwowidesl='kubectl get --watch -o=wide --show-labels'
alias ksysgwowidesl='kubectl --namespace=kube-system get --watch -o=wide --show-labels'
alias kgpowowidesl='kubectl get pods --watch -o=wide --show-labels'
alias ksysgpowowidesl='kubectl --namespace=kube-system get pods --watch -o=wide --show-labels'
alias kgdepwowidesl='kubectl get deployment --watch -o=wide --show-labels'
alias ksysgdepwowidesl='kubectl --namespace=kube-system get deployment --watch -o=wide --show-labels'
alias kgwslowide='kubectl get --watch --show-labels -o=wide'
alias ksysgwslowide='kubectl --namespace=kube-system get --watch --show-labels -o=wide'
alias kgpowslowide='kubectl get pods --watch --show-labels -o=wide'
alias ksysgpowslowide='kubectl --namespace=kube-system get pods --watch --show-labels -o=wide'
alias kgdepwslowide='kubectl get deployment --watch --show-labels -o=wide'
alias ksysgdepwslowide='kubectl --namespace=kube-system get deployment --watch --show-labels -o=wide'
alias kgallwojson='kubectl get --all-namespaces --watch -o=json'
alias kgpoallwojson='kubectl get pods --all-namespaces --watch -o=json'
alias kgdepallwojson='kubectl get deployment --all-namespaces --watch -o=json'
alias kgsvcallwojson='kubectl get service --all-namespaces --watch -o=json'
alias kgingallwojson='kubectl get ingress --all-namespaces --watch -o=json'
alias kgcmallwojson='kubectl get configmap --all-namespaces --watch -o=json'
alias kgsecallwojson='kubectl get secret --all-namespaces --watch -o=json'
alias kgnsallwojson='kubectl get namespaces --all-namespaces --watch -o=json'
alias kgwojsonall='kubectl get --watch -o=json --all-namespaces'
alias kgpowojsonall='kubectl get pods --watch -o=json --all-namespaces'
alias kgdepwojsonall='kubectl get deployment --watch -o=json --all-namespaces'
alias kgsvcwojsonall='kubectl get service --watch -o=json --all-namespaces'
alias kgingwojsonall='kubectl get ingress --watch -o=json --all-namespaces'
alias kgcmwojsonall='kubectl get configmap --watch -o=json --all-namespaces'
alias kgsecwojsonall='kubectl get secret --watch -o=json --all-namespaces'
alias kgnswojsonall='kubectl get namespaces --watch -o=json --all-namespaces'
alias kgwallojson='kubectl get --watch --all-namespaces -o=json'
alias kgpowallojson='kubectl get pods --watch --all-namespaces -o=json'
alias kgdepwallojson='kubectl get deployment --watch --all-namespaces -o=json'
alias kgsvcwallojson='kubectl get service --watch --all-namespaces -o=json'
alias kgingwallojson='kubectl get ingress --watch --all-namespaces -o=json'
alias kgcmwallojson='kubectl get configmap --watch --all-namespaces -o=json'
alias kgsecwallojson='kubectl get secret --watch --all-namespaces -o=json'
alias kgnswallojson='kubectl get namespaces --watch --all-namespaces -o=json'
alias kgallslw='kubectl get --all-namespaces --show-labels --watch'
alias kgpoallslw='kubectl get pods --all-namespaces --show-labels --watch'
alias kgdepallslw='kubectl get deployment --all-namespaces --show-labels --watch'
alias kgallwsl='kubectl get --all-namespaces --watch --show-labels'
alias kgpoallwsl='kubectl get pods --all-namespaces --watch --show-labels'
alias kgdepallwsl='kubectl get deployment --all-namespaces --watch --show-labels'
alias kgslallw='kubectl get --show-labels --all-namespaces --watch'
alias kgposlallw='kubectl get pods --show-labels --all-namespaces --watch'
alias kgdepslallw='kubectl get deployment --show-labels --all-namespaces --watch'
alias kgslwall='kubectl get --show-labels --watch --all-namespaces'
alias kgposlwall='kubectl get pods --show-labels --watch --all-namespaces'
alias kgdepslwall='kubectl get deployment --show-labels --watch --all-namespaces'
alias kgwallsl='kubectl get --watch --all-namespaces --show-labels'
alias kgpowallsl='kubectl get pods --watch --all-namespaces --show-labels'
alias kgdepwallsl='kubectl get deployment --watch --all-namespaces --show-labels'
alias kgwslall='kubectl get --watch --show-labels --all-namespaces'
alias kgpowslall='kubectl get pods --watch --show-labels --all-namespaces'
alias kgdepwslall='kubectl get deployment --watch --show-labels --all-namespaces'
alias kgallslwowide='kubectl get --all-namespaces --show-labels --watch -o=wide'
alias kgpoallslwowide='kubectl get pods --all-namespaces --show-labels --watch -o=wide'
alias kgdepallslwowide='kubectl get deployment --all-namespaces --show-labels --watch -o=wide'
alias kgallwowidesl='kubectl get --all-namespaces --watch -o=wide --show-labels'
alias kgpoallwowidesl='kubectl get pods --all-namespaces --watch -o=wide --show-labels'
alias kgdepallwowidesl='kubectl get deployment --all-namespaces --watch -o=wide --show-labels'
alias kgallwslowide='kubectl get --all-namespaces --watch --show-labels -o=wide'
alias kgpoallwslowide='kubectl get pods --all-namespaces --watch --show-labels -o=wide'
alias kgdepallwslowide='kubectl get deployment --all-namespaces --watch --show-labels -o=wide'
alias kgslallwowide='kubectl get --show-labels --all-namespaces --watch -o=wide'
alias kgposlallwowide='kubectl get pods --show-labels --all-namespaces --watch -o=wide'
alias kgdepslallwowide='kubectl get deployment --show-labels --all-namespaces --watch -o=wide'
alias kgslwowideall='kubectl get --show-labels --watch -o=wide --all-namespaces'
alias kgposlwowideall='kubectl get pods --show-labels --watch -o=wide --all-namespaces'
alias kgdepslwowideall='kubectl get deployment --show-labels --watch -o=wide --all-namespaces'
alias kgslwallowide='kubectl get --show-labels --watch --all-namespaces -o=wide'
alias kgposlwallowide='kubectl get pods --show-labels --watch --all-namespaces -o=wide'
alias kgdepslwallowide='kubectl get deployment --show-labels --watch --all-namespaces -o=wide'
alias kgwowideallsl='kubectl get --watch -o=wide --all-namespaces --show-labels'
alias kgpowowideallsl='kubectl get pods --watch -o=wide --all-namespaces --show-labels'
alias kgdepwowideallsl='kubectl get deployment --watch -o=wide --all-namespaces --show-labels'
alias kgwowideslall='kubectl get --watch -o=wide --show-labels --all-namespaces'
alias kgpowowideslall='kubectl get pods --watch -o=wide --show-labels --all-namespaces'
alias kgdepwowideslall='kubectl get deployment --watch -o=wide --show-labels --all-namespaces'
alias kgwallowidesl='kubectl get --watch --all-namespaces -o=wide --show-labels'
alias kgpowallowidesl='kubectl get pods --watch --all-namespaces -o=wide --show-labels'
alias kgdepwallowidesl='kubectl get deployment --watch --all-namespaces -o=wide --show-labels'
alias kgwallslowide='kubectl get --watch --all-namespaces --show-labels -o=wide'
alias kgpowallslowide='kubectl get pods --watch --all-namespaces --show-labels -o=wide'
alias kgdepwallslowide='kubectl get deployment --watch --all-namespaces --show-labels -o=wide'
alias kgwslowideall='kubectl get --watch --show-labels -o=wide --all-namespaces'
alias kgpowslowideall='kubectl get pods --watch --show-labels -o=wide --all-namespaces'
alias kgdepwslowideall='kubectl get deployment --watch --show-labels -o=wide --all-namespaces'
alias kgwslallowide='kubectl get --watch --show-labels --all-namespaces -o=wide'
alias kgpowslallowide='kubectl get pods --watch --show-labels --all-namespaces -o=wide'
alias kgdepwslallowide='kubectl get deployment --watch --show-labels --all-namespaces -o=wide'
alias kgf='kubectl get --recursive -f'
alias kdf='kubectl describe --recursive -f'
alias krmf='kubectl delete --recursive -f'
alias kgoyamlf='kubectl get -o=yaml --recursive -f'
alias kgowidef='kubectl get -o=wide --recursive -f'
alias kgojsonf='kubectl get -o=json --recursive -f'
alias kgslf='kubectl get --show-labels --recursive -f'
alias kgwf='kubectl get --watch --recursive -f'
alias kgwoyamlf='kubectl get --watch -o=yaml --recursive -f'
alias kgowideslf='kubectl get -o=wide --show-labels --recursive -f'
alias kgslowidef='kubectl get --show-labels -o=wide --recursive -f'
alias kgwowidef='kubectl get --watch -o=wide --recursive -f'
alias kgwojsonf='kubectl get --watch -o=json --recursive -f'
alias kgslwf='kubectl get --show-labels --watch --recursive -f'
alias kgwslf='kubectl get --watch --show-labels --recursive -f'
alias kgslwowidef='kubectl get --show-labels --watch -o=wide --recursive -f'
alias kgwowideslf='kubectl get --watch -o=wide --show-labels --recursive -f'
alias kgwslowidef='kubectl get --watch --show-labels -o=wide --recursive -f'
alias kgl='kubectl get -l'
alias ksysgl='kubectl --namespace=kube-system get -l'
alias kdl='kubectl describe -l'
alias ksysdl='kubectl --namespace=kube-system describe -l'
alias krml='kubectl delete -l'
alias ksysrml='kubectl --namespace=kube-system delete -l'
alias kgpol='kubectl get pods -l'
alias ksysgpol='kubectl --namespace=kube-system get pods -l'
alias kdpol='kubectl describe pods -l'
alias ksysdpol='kubectl --namespace=kube-system describe pods -l'
alias krmpol='kubectl delete pods -l'
alias ksysrmpol='kubectl --namespace=kube-system delete pods -l'
alias kgdepl='kubectl get deployment -l'
alias ksysgdepl='kubectl --namespace=kube-system get deployment -l'
alias kddepl='kubectl describe deployment -l'
alias ksysddepl='kubectl --namespace=kube-system describe deployment -l'
alias krmdepl='kubectl delete deployment -l'
alias ksysrmdepl='kubectl --namespace=kube-system delete deployment -l'
alias kgsvcl='kubectl get service -l'
alias ksysgsvcl='kubectl --namespace=kube-system get service -l'
alias kdsvcl='kubectl describe service -l'
alias ksysdsvcl='kubectl --namespace=kube-system describe service -l'
alias krmsvcl='kubectl delete service -l'
alias ksysrmsvcl='kubectl --namespace=kube-system delete service -l'
alias kgingl='kubectl get ingress -l'
alias ksysgingl='kubectl --namespace=kube-system get ingress -l'
alias kdingl='kubectl describe ingress -l'
alias ksysdingl='kubectl --namespace=kube-system describe ingress -l'
alias krmingl='kubectl delete ingress -l'
alias ksysrmingl='kubectl --namespace=kube-system delete ingress -l'
alias kgcml='kubectl get configmap -l'
alias ksysgcml='kubectl --namespace=kube-system get configmap -l'
alias kdcml='kubectl describe configmap -l'
alias ksysdcml='kubectl --namespace=kube-system describe configmap -l'
alias krmcml='kubectl delete configmap -l'
alias ksysrmcml='kubectl --namespace=kube-system delete configmap -l'
alias kgsecl='kubectl get secret -l'
alias ksysgsecl='kubectl --namespace=kube-system get secret -l'
alias kdsecl='kubectl describe secret -l'
alias ksysdsecl='kubectl --namespace=kube-system describe secret -l'
alias krmsecl='kubectl delete secret -l'
alias ksysrmsecl='kubectl --namespace=kube-system delete secret -l'
alias kgnol='kubectl get nodes -l'
alias kdnol='kubectl describe nodes -l'
alias kgnsl='kubectl get namespaces -l'
alias kdnsl='kubectl describe namespaces -l'
alias krmnsl='kubectl delete namespaces -l'
alias kgoyamll='kubectl get -o=yaml -l'
alias ksysgoyamll='kubectl --namespace=kube-system get -o=yaml -l'
alias kgpooyamll='kubectl get pods -o=yaml -l'
alias ksysgpooyamll='kubectl --namespace=kube-system get pods -o=yaml -l'
alias kgdepoyamll='kubectl get deployment -o=yaml -l'
alias ksysgdepoyamll='kubectl --namespace=kube-system get deployment -o=yaml -l'
alias kgsvcoyamll='kubectl get service -o=yaml -l'
alias ksysgsvcoyamll='kubectl --namespace=kube-system get service -o=yaml -l'
alias kgingoyamll='kubectl get ingress -o=yaml -l'
alias ksysgingoyamll='kubectl --namespace=kube-system get ingress -o=yaml -l'
alias kgcmoyamll='kubectl get configmap -o=yaml -l'
alias ksysgcmoyamll='kubectl --namespace=kube-system get configmap -o=yaml -l'
alias kgsecoyamll='kubectl get secret -o=yaml -l'
alias ksysgsecoyamll='kubectl --namespace=kube-system get secret -o=yaml -l'
alias kgnooyamll='kubectl get nodes -o=yaml -l'
alias kgnsoyamll='kubectl get namespaces -o=yaml -l'
alias kgowidel='kubectl get -o=wide -l'
alias ksysgowidel='kubectl --namespace=kube-system get -o=wide -l'
alias kgpoowidel='kubectl get pods -o=wide -l'
alias ksysgpoowidel='kubectl --namespace=kube-system get pods -o=wide -l'
alias kgdepowidel='kubectl get deployment -o=wide -l'
alias ksysgdepowidel='kubectl --namespace=kube-system get deployment -o=wide -l'
alias kgsvcowidel='kubectl get service -o=wide -l'
alias ksysgsvcowidel='kubectl --namespace=kube-system get service -o=wide -l'
alias kgingowidel='kubectl get ingress -o=wide -l'
alias ksysgingowidel='kubectl --namespace=kube-system get ingress -o=wide -l'
alias kgcmowidel='kubectl get configmap -o=wide -l'
alias ksysgcmowidel='kubectl --namespace=kube-system get configmap -o=wide -l'
alias kgsecowidel='kubectl get secret -o=wide -l'
alias ksysgsecowidel='kubectl --namespace=kube-system get secret -o=wide -l'
alias kgnoowidel='kubectl get nodes -o=wide -l'
alias kgnsowidel='kubectl get namespaces -o=wide -l'
alias kgojsonl='kubectl get -o=json -l'
alias ksysgojsonl='kubectl --namespace=kube-system get -o=json -l'
alias kgpoojsonl='kubectl get pods -o=json -l'
alias ksysgpoojsonl='kubectl --namespace=kube-system get pods -o=json -l'
alias kgdepojsonl='kubectl get deployment -o=json -l'
alias ksysgdepojsonl='kubectl --namespace=kube-system get deployment -o=json -l'
alias kgsvcojsonl='kubectl get service -o=json -l'
alias ksysgsvcojsonl='kubectl --namespace=kube-system get service -o=json -l'
alias kgingojsonl='kubectl get ingress -o=json -l'
alias ksysgingojsonl='kubectl --namespace=kube-system get ingress -o=json -l'
alias kgcmojsonl='kubectl get configmap -o=json -l'
alias ksysgcmojsonl='kubectl --namespace=kube-system get configmap -o=json -l'
alias kgsecojsonl='kubectl get secret -o=json -l'
alias ksysgsecojsonl='kubectl --namespace=kube-system get secret -o=json -l'
alias kgnoojsonl='kubectl get nodes -o=json -l'
alias kgnsojsonl='kubectl get namespaces -o=json -l'
alias kgsll='kubectl get --show-labels -l'
alias ksysgsll='kubectl --namespace=kube-system get --show-labels -l'
alias kgposll='kubectl get pods --show-labels -l'
alias ksysgposll='kubectl --namespace=kube-system get pods --show-labels -l'
alias kgdepsll='kubectl get deployment --show-labels -l'
alias ksysgdepsll='kubectl --namespace=kube-system get deployment --show-labels -l'
alias kgwl='kubectl get --watch -l'
alias ksysgwl='kubectl --namespace=kube-system get --watch -l'
alias kgpowl='kubectl get pods --watch -l'
alias ksysgpowl='kubectl --namespace=kube-system get pods --watch -l'
alias kgdepwl='kubectl get deployment --watch -l'
alias ksysgdepwl='kubectl --namespace=kube-system get deployment --watch -l'
alias kgsvcwl='kubectl get service --watch -l'
alias ksysgsvcwl='kubectl --namespace=kube-system get service --watch -l'
alias kgingwl='kubectl get ingress --watch -l'
alias ksysgingwl='kubectl --namespace=kube-system get ingress --watch -l'
alias kgcmwl='kubectl get configmap --watch -l'
alias ksysgcmwl='kubectl --namespace=kube-system get configmap --watch -l'
alias kgsecwl='kubectl get secret --watch -l'
alias ksysgsecwl='kubectl --namespace=kube-system get secret --watch -l'
alias kgnowl='kubectl get nodes --watch -l'
alias kgnswl='kubectl get namespaces --watch -l'
alias kgwoyamll='kubectl get --watch -o=yaml -l'
alias ksysgwoyamll='kubectl --namespace=kube-system get --watch -o=yaml -l'
alias kgpowoyamll='kubectl get pods --watch -o=yaml -l'
alias ksysgpowoyamll='kubectl --namespace=kube-system get pods --watch -o=yaml -l'
alias kgdepwoyamll='kubectl get deployment --watch -o=yaml -l'
alias ksysgdepwoyamll='kubectl --namespace=kube-system get deployment --watch -o=yaml -l'
alias kgsvcwoyamll='kubectl get service --watch -o=yaml -l'
alias ksysgsvcwoyamll='kubectl --namespace=kube-system get service --watch -o=yaml -l'
alias kgingwoyamll='kubectl get ingress --watch -o=yaml -l'
alias ksysgingwoyamll='kubectl --namespace=kube-system get ingress --watch -o=yaml -l'
alias kgcmwoyamll='kubectl get configmap --watch -o=yaml -l'
alias ksysgcmwoyamll='kubectl --namespace=kube-system get configmap --watch -o=yaml -l'
alias kgsecwoyamll='kubectl get secret --watch -o=yaml -l'
alias ksysgsecwoyamll='kubectl --namespace=kube-system get secret --watch -o=yaml -l'
alias kgnowoyamll='kubectl get nodes --watch -o=yaml -l'
alias kgnswoyamll='kubectl get namespaces --watch -o=yaml -l'
alias kgowidesll='kubectl get -o=wide --show-labels -l'
alias ksysgowidesll='kubectl --namespace=kube-system get -o=wide --show-labels -l'
alias kgpoowidesll='kubectl get pods -o=wide --show-labels -l'
alias ksysgpoowidesll='kubectl --namespace=kube-system get pods -o=wide --show-labels -l'
alias kgdepowidesll='kubectl get deployment -o=wide --show-labels -l'
alias ksysgdepowidesll='kubectl --namespace=kube-system get deployment -o=wide --show-labels -l'
alias kgslowidel='kubectl get --show-labels -o=wide -l'
alias ksysgslowidel='kubectl --namespace=kube-system get --show-labels -o=wide -l'
alias kgposlowidel='kubectl get pods --show-labels -o=wide -l'
alias ksysgposlowidel='kubectl --namespace=kube-system get pods --show-labels -o=wide -l'
alias kgdepslowidel='kubectl get deployment --show-labels -o=wide -l'
alias ksysgdepslowidel='kubectl --namespace=kube-system get deployment --show-labels -o=wide -l'
alias kgwowidel='kubectl get --watch -o=wide -l'
alias ksysgwowidel='kubectl --namespace=kube-system get --watch -o=wide -l'
alias kgpowowidel='kubectl get pods --watch -o=wide -l'
alias ksysgpowowidel='kubectl --namespace=kube-system get pods --watch -o=wide -l'
alias kgdepwowidel='kubectl get deployment --watch -o=wide -l'
alias ksysgdepwowidel='kubectl --namespace=kube-system get deployment --watch -o=wide -l'
alias kgsvcwowidel='kubectl get service --watch -o=wide -l'
alias ksysgsvcwowidel='kubectl --namespace=kube-system get service --watch -o=wide -l'
alias kgingwowidel='kubectl get ingress --watch -o=wide -l'
alias ksysgingwowidel='kubectl --namespace=kube-system get ingress --watch -o=wide -l'
alias kgcmwowidel='kubectl get configmap --watch -o=wide -l'
alias ksysgcmwowidel='kubectl --namespace=kube-system get configmap --watch -o=wide -l'
alias kgsecwowidel='kubectl get secret --watch -o=wide -l'
alias ksysgsecwowidel='kubectl --namespace=kube-system get secret --watch -o=wide -l'
alias kgnowowidel='kubectl get nodes --watch -o=wide -l'
alias kgnswowidel='kubectl get namespaces --watch -o=wide -l'
alias kgwojsonl='kubectl get --watch -o=json -l'
alias ksysgwojsonl='kubectl --namespace=kube-system get --watch -o=json -l'
alias kgpowojsonl='kubectl get pods --watch -o=json -l'
alias ksysgpowojsonl='kubectl --namespace=kube-system get pods --watch -o=json -l'
alias kgdepwojsonl='kubectl get deployment --watch -o=json -l'
alias ksysgdepwojsonl='kubectl --namespace=kube-system get deployment --watch -o=json -l'
alias kgsvcwojsonl='kubectl get service --watch -o=json -l'
alias ksysgsvcwojsonl='kubectl --namespace=kube-system get service --watch -o=json -l'
alias kgingwojsonl='kubectl get ingress --watch -o=json -l'
alias ksysgingwojsonl='kubectl --namespace=kube-system get ingress --watch -o=json -l'
alias kgcmwojsonl='kubectl get configmap --watch -o=json -l'
alias ksysgcmwojsonl='kubectl --namespace=kube-system get configmap --watch -o=json -l'
alias kgsecwojsonl='kubectl get secret --watch -o=json -l'
alias ksysgsecwojsonl='kubectl --namespace=kube-system get secret --watch -o=json -l'
alias kgnowojsonl='kubectl get nodes --watch -o=json -l'
alias kgnswojsonl='kubectl get namespaces --watch -o=json -l'
alias kgslwl='kubectl get --show-labels --watch -l'
alias ksysgslwl='kubectl --namespace=kube-system get --show-labels --watch -l'
alias kgposlwl='kubectl get pods --show-labels --watch -l'
alias ksysgposlwl='kubectl --namespace=kube-system get pods --show-labels --watch -l'
alias kgdepslwl='kubectl get deployment --show-labels --watch -l'
alias ksysgdepslwl='kubectl --namespace=kube-system get deployment --show-labels --watch -l'
alias kgwsll='kubectl get --watch --show-labels -l'
alias ksysgwsll='kubectl --namespace=kube-system get --watch --show-labels -l'
alias kgpowsll='kubectl get pods --watch --show-labels -l'
alias ksysgpowsll='kubectl --namespace=kube-system get pods --watch --show-labels -l'
alias kgdepwsll='kubectl get deployment --watch --show-labels -l'
alias ksysgdepwsll='kubectl --namespace=kube-system get deployment --watch --show-labels -l'
alias kgslwowidel='kubectl get --show-labels --watch -o=wide -l'
alias ksysgslwowidel='kubectl --namespace=kube-system get --show-labels --watch -o=wide -l'
alias kgposlwowidel='kubectl get pods --show-labels --watch -o=wide -l'
alias ksysgposlwowidel='kubectl --namespace=kube-system get pods --show-labels --watch -o=wide -l'
alias kgdepslwowidel='kubectl get deployment --show-labels --watch -o=wide -l'
alias ksysgdepslwowidel='kubectl --namespace=kube-system get deployment --show-labels --watch -o=wide -l'
alias kgwowidesll='kubectl get --watch -o=wide --show-labels -l'
alias ksysgwowidesll='kubectl --namespace=kube-system get --watch -o=wide --show-labels -l'
alias kgpowowidesll='kubectl get pods --watch -o=wide --show-labels -l'
alias ksysgpowowidesll='kubectl --namespace=kube-system get pods --watch -o=wide --show-labels -l'
alias kgdepwowidesll='kubectl get deployment --watch -o=wide --show-labels -l'
alias ksysgdepwowidesll='kubectl --namespace=kube-system get deployment --watch -o=wide --show-labels -l'
alias kgwslowidel='kubectl get --watch --show-labels -o=wide -l'
alias ksysgwslowidel='kubectl --namespace=kube-system get --watch --show-labels -o=wide -l'
alias kgpowslowidel='kubectl get pods --watch --show-labels -o=wide -l'
alias ksysgpowslowidel='kubectl --namespace=kube-system get pods --watch --show-labels -o=wide -l'
alias kgdepwslowidel='kubectl get deployment --watch --show-labels -o=wide -l'
alias ksysgdepwslowidel='kubectl --namespace=kube-system get deployment --watch --show-labels -o=wide -l'
alias kexn='kubectl exec -i -t --namespace'
alias klon='kubectl logs -f --namespace'
alias kpfn='kubectl port-forward --namespace'
alias kgn='kubectl get --namespace'
alias kdn='kubectl describe --namespace'
alias krmn='kubectl delete --namespace'
alias kgpon='kubectl get pods --namespace'
alias kdpon='kubectl describe pods --namespace'
alias krmpon='kubectl delete pods --namespace'
alias kgdepn='kubectl get deployment --namespace'
alias kddepn='kubectl describe deployment --namespace'
alias krmdepn='kubectl delete deployment --namespace'
alias kgsvcn='kubectl get service --namespace'
alias kdsvcn='kubectl describe service --namespace'
alias krmsvcn='kubectl delete service --namespace'
alias kgingn='kubectl get ingress --namespace'
alias kdingn='kubectl describe ingress --namespace'
alias krmingn='kubectl delete ingress --namespace'
alias kgcmn='kubectl get configmap --namespace'
alias kdcmn='kubectl describe configmap --namespace'
alias krmcmn='kubectl delete configmap --namespace'
alias kgsecn='kubectl get secret --namespace'
alias kdsecn='kubectl describe secret --namespace'
alias krmsecn='kubectl delete secret --namespace'
alias kgoyamln='kubectl get -o=yaml --namespace'
alias kgpooyamln='kubectl get pods -o=yaml --namespace'
alias kgdepoyamln='kubectl get deployment -o=yaml --namespace'
alias kgsvcoyamln='kubectl get service -o=yaml --namespace'
alias kgingoyamln='kubectl get ingress -o=yaml --namespace'
alias kgcmoyamln='kubectl get configmap -o=yaml --namespace'
alias kgsecoyamln='kubectl get secret -o=yaml --namespace'
alias kgowiden='kubectl get -o=wide --namespace'
alias kgpoowiden='kubectl get pods -o=wide --namespace'
alias kgdepowiden='kubectl get deployment -o=wide --namespace'
alias kgsvcowiden='kubectl get service -o=wide --namespace'
alias kgingowiden='kubectl get ingress -o=wide --namespace'
alias kgcmowiden='kubectl get configmap -o=wide --namespace'
alias kgsecowiden='kubectl get secret -o=wide --namespace'
alias kgojsonn='kubectl get -o=json --namespace'
alias kgpoojsonn='kubectl get pods -o=json --namespace'
alias kgdepojsonn='kubectl get deployment -o=json --namespace'
alias kgsvcojsonn='kubectl get service -o=json --namespace'
alias kgingojsonn='kubectl get ingress -o=json --namespace'
alias kgcmojsonn='kubectl get configmap -o=json --namespace'
alias kgsecojsonn='kubectl get secret -o=json --namespace'
alias kgsln='kubectl get --show-labels --namespace'
alias kgposln='kubectl get pods --show-labels --namespace'
alias kgdepsln='kubectl get deployment --show-labels --namespace'
alias kgwn='kubectl get --watch --namespace'
alias kgpown='kubectl get pods --watch --namespace'
alias kgdepwn='kubectl get deployment --watch --namespace'
alias kgsvcwn='kubectl get service --watch --namespace'
alias kgingwn='kubectl get ingress --watch --namespace'
alias kgcmwn='kubectl get configmap --watch --namespace'
alias kgsecwn='kubectl get secret --watch --namespace'
alias kgwoyamln='kubectl get --watch -o=yaml --namespace'
alias kgpowoyamln='kubectl get pods --watch -o=yaml --namespace'
alias kgdepwoyamln='kubectl get deployment --watch -o=yaml --namespace'
alias kgsvcwoyamln='kubectl get service --watch -o=yaml --namespace'
alias kgingwoyamln='kubectl get ingress --watch -o=yaml --namespace'
alias kgcmwoyamln='kubectl get configmap --watch -o=yaml --namespace'
alias kgsecwoyamln='kubectl get secret --watch -o=yaml --namespace'
alias kgowidesln='kubectl get -o=wide --show-labels --namespace'
alias kgpoowidesln='kubectl get pods -o=wide --show-labels --namespace'
alias kgdepowidesln='kubectl get deployment -o=wide --show-labels --namespace'
alias kgslowiden='kubectl get --show-labels -o=wide --namespace'
alias kgposlowiden='kubectl get pods --show-labels -o=wide --namespace'
alias kgdepslowiden='kubectl get deployment --show-labels -o=wide --namespace'
alias kgwowiden='kubectl get --watch -o=wide --namespace'
alias kgpowowiden='kubectl get pods --watch -o=wide --namespace'
alias kgdepwowiden='kubectl get deployment --watch -o=wide --namespace'
alias kgsvcwowiden='kubectl get service --watch -o=wide --namespace'
alias kgingwowiden='kubectl get ingress --watch -o=wide --namespace'
alias kgcmwowiden='kubectl get configmap --watch -o=wide --namespace'
alias kgsecwowiden='kubectl get secret --watch -o=wide --namespace'
alias kgwojsonn='kubectl get --watch -o=json --namespace'
alias kgpowojsonn='kubectl get pods --watch -o=json --namespace'
alias kgdepwojsonn='kubectl get deployment --watch -o=json --namespace'
alias kgsvcwojsonn='kubectl get service --watch -o=json --namespace'
alias kgingwojsonn='kubectl get ingress --watch -o=json --namespace'
alias kgcmwojsonn='kubectl get configmap --watch -o=json --namespace'
alias kgsecwojsonn='kubectl get secret --watch -o=json --namespace'
alias kgslwn='kubectl get --show-labels --watch --namespace'
alias kgposlwn='kubectl get pods --show-labels --watch --namespace'
alias kgdepslwn='kubectl get deployment --show-labels --watch --namespace'
alias kgwsln='kubectl get --watch --show-labels --namespace'
alias kgpowsln='kubectl get pods --watch --show-labels --namespace'
alias kgdepwsln='kubectl get deployment --watch --show-labels --namespace'
alias kgslwowiden='kubectl get --show-labels --watch -o=wide --namespace'
alias kgposlwowiden='kubectl get pods --show-labels --watch -o=wide --namespace'
alias kgdepslwowiden='kubectl get deployment --show-labels --watch -o=wide --namespace'
alias kgwowidesln='kubectl get --watch -o=wide --show-labels --namespace'
alias kgpowowidesln='kubectl get pods --watch -o=wide --show-labels --namespace'
alias kgdepwowidesln='kubectl get deployment --watch -o=wide --show-labels --namespace'
alias kgwslowiden='kubectl get --watch --show-labels -o=wide --namespace'
alias kgpowslowiden='kubectl get pods --watch --show-labels -o=wide --namespace'
alias kgdepwslowiden='kubectl get deployment --watch --show-labels -o=wide --namespace'

## K8S autocompletion
source ~/.helmrc
source <(kubectl completion zsh)

## Poetry
export PATH="$HOME/.poetry/bin:$PATH"
#poetry completions zsh > ~/.zfunc/_poetry

#autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

if [ -e /home/apinter/.nix-profile/etc/profile.d/nix.sh ]; then . /home/apinter/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/apinter/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/apinter/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/apinter/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/apinter/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/apinter/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
