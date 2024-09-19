if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_greeting
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        atuin init fish | source
        zoxide init --cmd cd fish | source
    end

    set -g theme_display_docker_machine yes
    set -g theme_display_k8s_context yes
    set -g theme_display_virtualenv yes
    set -g theme_display_user ssh
    #set -g fish_prompt_pwd_dir_length 0
    set -g theme_color_scheme dark
    set -g theme_display_git yes
    set -g theme_display_hostname ssh
    set -g theme_display_date no

    set -gx GPG_TTY (tty)

    ### XDG vars
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_CACHE_HOME=$HOME/.cache
    export XDG_DATA_HOME=$HOME/.local/share
    export XDG_STATE_HOME=$HOME/.local/state

    ## Envs
    export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
    export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
    export AZURE_CONFIG_DIR=$XDG_DATA_HOME/azure
    export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
    export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
    export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
    export CARGO_HOME="$XDG_DATA_HOME"/cargo
    #export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
    export GEM_HOME="$XDG_DATA_HOME"/gem
    export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
    export TMUX_CONF=~/.config/tmux/tmux.conf
    export EDITOR=vim
    export VISUAL=vim
    export GPG_TTY=$(tty)

    ## NIX stuff
    set NIX_LINK $HOME/.nix-profile
    export NIX_SSL_CERT_FILE=/etc/ssl/ca-bundle.pem
    #/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish

    ## Gcloud
    # source /home/apinter/Downloads/google-cloud-sdk/path.fish.inc  

    ## PATH
    export PATH=/sbin:/usr/sbin:/usr/local/sbin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/home/apinter/.local/bin:/home/apinter/.local/bin:/snap/bin:$HOME/.local/share/flatpak/exports/bin:$XDG_DATA_HOME/cargo/bin:$NIX_LINK/bin:$HOME/go/bin
    alias z="z"

    ## Copilot
    abbr copilot 'gh copilot'
    abbr gcs 'gh copilot suggest -t shell'
    abbr gce 'gh copilot explain'
    abbr ghu "gh extension upgrade --all"

    ## Logseq
    abbr cdl 'cd ~/Project/logseq' 
    abbr lsu 'cd ~/Project/logseq && git pull'
    abbr lsp 'cd ~/Project/logseq && git add . && git commit -s -m "$(hostname)-$(date +'%d-%m-%Y')" && git push'

    ## System Stuff
    #alias sup="sudo zypper ref; sudo zypper dup -y -l; flatpak update --user -y"
    abbr ju 'just -f ~/Project/git/dotconf/justfile update'
    abbr g git
    abbr grv "git remote -v"
    abbr icat "kitty +kitten icat"
    abbr cdgd "cd $HOME/Project/git/dotconf"
    abbr dotfiles '/usr/bin/git --git-dir=$HOME/Project/git/dotconf/.git --work-tree=$HOME/Project/git/dotconf'
    abbr diablo2 "WINEARCH=win32 WINEPREFIX=~/.wine32 wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Diablo\ II/Diablo\ II.exe -w"
    abbr tmux "tmux -f ~/.config/tmux/tmux.conf -u"
    abbr cdp "cd ~/Project"
    abbr cdh "cd ~/Project/Home"
    abbr cda "cd ~/Project/Ansible"
    abbr cdpa "cd ~/Project/Antavo"
    abbr cdpag "cd ~/Project/Antavo/git"
    abbr cdpagg "cd ~/Project/Antavo/git/GitlabClone"
    abbr cdpaa "cd ~/Project/Antavo/ansible"
    abbr cdg "cd ~/Project/git"
    abbr cdd "cd ~/Downloads"
    abbr cdm "cd ~/Media"
    abbr e vim
    abbr se "emacs -nw"
    abbr tf terraform
    abbr cdga "cd /home/apinter/Project/Antavo/git"
    abbr dfe "distrobox-enter fedora"
    abbr dtw "distrobox-enter tw"
    abbr dar "distrobox-enter arch-box"
    abbr dubi "distrobox-enter ubuntu-box"
    abbr dhe distrobox-host-exec
    abbr ll "eza -l --icons=auto --group-directories-first"
    abbr l. "eza -d .*"
    abbr ls eza
    abbr l1 "eza -1"

    ## Entertainment Stuff
    abbr allmediaup "sudo mount 172.168.1.3:/shirayuki/Aurora /home/apinter/Project/Home/Aurora/Reno"
    abbr allmediadown "sudo umount /home/apinter/Project/Home/Aurora/Reno"
    abbr msce rclone
    abbr sup "sudo zypper ref; sudo zypper dup; sudo flatpak update -y; flatpak --user update -y"
    abbr dhe distrobox-host-exec

    ## Security Stuff
    abbr knoxup "cryfs ~/.local/share/plasma-vault/Knox.enc ~/Vaults/Knox"
    abbr knoxdown "cryfs-unmount /home/apinter/Vaults/Knox"
    abbr agcp "export HTTPS_PROXY=localhost:8888"

    ## Kubectl stuff
    test -f ~/.kubectl_aliases.fish && source conf.d/.kubectl_aliases.fish
    ## K8S autocompletion
    # source ~/.helmrc
    # source <(kubectl completion zsh)

    # kubectl completion fish | source

    ## Poetry
    export PATH="$HOME/.poetry/bin:$PATH"
    #poetry completions zsh > ~/.zfunc/_poetry

    #autoload -U +X bashcompinit && bashcompinit
    #complete -o nospace -C /usr/bin/terraform terraform

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/home/apinter/Downloads/google-cloud-sdk/path.fish.inc' ]
        . '/home/apinter/Downloads/google-cloud-sdk/path.fish.inc'
    end

end
## Linode

# This is a generated file by Linode-CLI! Do not modify!
complete -c linode-cli -n "not __fish_seen_subcommand_from account events payment-methods service-transfers users databases domains images linodes kernels stackscripts lke longview managed networking firewalls vlans nodebalancers object-storage profile security-questions sshkeys phone regions tickets tags volumes" -x -a 'account events payment-methods service-transfers users databases domains images linodes kernels stackscripts lke longview managed networking firewalls vlans nodebalancers object-storage profile security-questions sshkeys phone regions tickets tags volumes --help'
complete -c linode -n "not __fish_seen_subcommand_from account events payment-methods service-transfers users databases domains images linodes kernels stackscripts lke longview managed networking firewalls vlans nodebalancers object-storage profile security-questions sshkeys phone regions tickets tags volumes" -x -a 'account events payment-methods service-transfers users databases domains images linodes kernels stackscripts lke longview managed networking firewalls vlans nodebalancers object-storage profile security-questions sshkeys phone regions tickets tags volumes --help'
complete -c lin -n "not __fish_seen_subcommand_from account events payment-methods service-transfers users databases domains images linodes kernels stackscripts lke longview managed networking firewalls vlans nodebalancers object-storage profile security-questions sshkeys phone regions tickets tags volumes" -x -a 'account events payment-methods service-transfers users databases domains images linodes kernels stackscripts lke longview managed networking firewalls vlans nodebalancers object-storage profile security-questions sshkeys phone regions tickets tags volumes --help'
complete -c linode-cli -n "__fish_seen_subcommand_from account" -x -a 'view update cancel invoices-list invoice-view invoice-items logins-list login-view maintenance-list notifications-list clients-list client-create client-view client-update client-delete client-reset-secret payments-list payment-create payment-view promo-add settings settings-update enable-managed transfer --help'
complete -c linode -n "__fish_seen_subcommand_from account" -x -a 'view update cancel invoices-list invoice-view invoice-items logins-list login-view maintenance-list notifications-list clients-list client-create client-view client-update client-delete client-reset-secret payments-list payment-create payment-view promo-add settings settings-update enable-managed transfer --help'
complete -c lin -n "__fish_seen_subcommand_from account" -x -a 'view update cancel invoices-list invoice-view invoice-items logins-list login-view maintenance-list notifications-list clients-list client-create client-view client-update client-delete client-reset-secret payments-list payment-create payment-view promo-add settings settings-update enable-managed transfer --help'
complete -c linode-cli -n "__fish_seen_subcommand_from events" -x -a 'list view mark-read mark-seen --help'
complete -c linode -n "__fish_seen_subcommand_from events" -x -a 'list view mark-read mark-seen --help'
complete -c lin -n "__fish_seen_subcommand_from events" -x -a 'list view mark-read mark-seen --help'
complete -c linode-cli -n "__fish_seen_subcommand_from payment-methods" -x -a 'list add view delete default --help'
complete -c linode -n "__fish_seen_subcommand_from payment-methods" -x -a 'list add view delete default --help'
complete -c lin -n "__fish_seen_subcommand_from payment-methods" -x -a 'list add view delete default --help'
complete -c linode-cli -n "__fish_seen_subcommand_from service-transfers" -x -a 'list create view cancel accept --help'
complete -c linode -n "__fish_seen_subcommand_from service-transfers" -x -a 'list create view cancel accept --help'
complete -c lin -n "__fish_seen_subcommand_from service-transfers" -x -a 'list create view cancel accept --help'
complete -c linode-cli -n "__fish_seen_subcommand_from users" -x -a 'list create view update delete --help'
complete -c linode -n "__fish_seen_subcommand_from users" -x -a 'list create view update delete --help'
complete -c lin -n "__fish_seen_subcommand_from users" -x -a 'list create view update delete --help'
complete -c linode-cli -n "__fish_seen_subcommand_from databases" -x -a 'engines engine-view list mysql-list mysql-create mysql-view mysql-update mysql-delete mysql-backups-list mysql-backup-snapshot mysql-backup-view mysql-backup-delete mysql-backup-restore mysql-creds-view mysql-creds-reset mysql-ssl-cert mysql-patch postgresql-list postgresql-create postgresql-view postgresql-update postgresql-delete postgresql-backups-list postgresql-backup-snapshot postgresql-backup-view postgresql-backup-delete postgresql-backup-restore postgresql-creds-view postgresql-creds-reset postgresql-ssl-cert postgresql-patch types type-view --help'
complete -c linode -n "__fish_seen_subcommand_from databases" -x -a 'engines engine-view list mysql-list mysql-create mysql-view mysql-update mysql-delete mysql-backups-list mysql-backup-snapshot mysql-backup-view mysql-backup-delete mysql-backup-restore mysql-creds-view mysql-creds-reset mysql-ssl-cert mysql-patch postgresql-list postgresql-create postgresql-view postgresql-update postgresql-delete postgresql-backups-list postgresql-backup-snapshot postgresql-backup-view postgresql-backup-delete postgresql-backup-restore postgresql-creds-view postgresql-creds-reset postgresql-ssl-cert postgresql-patch types type-view --help'
complete -c lin -n "__fish_seen_subcommand_from databases" -x -a 'engines engine-view list mysql-list mysql-create mysql-view mysql-update mysql-delete mysql-backups-list mysql-backup-snapshot mysql-backup-view mysql-backup-delete mysql-backup-restore mysql-creds-view mysql-creds-reset mysql-ssl-cert mysql-patch postgresql-list postgresql-create postgresql-view postgresql-update postgresql-delete postgresql-backups-list postgresql-backup-snapshot postgresql-backup-view postgresql-backup-delete postgresql-backup-restore postgresql-creds-view postgresql-creds-reset postgresql-ssl-cert postgresql-patch types type-view --help'
complete -c linode-cli -n "__fish_seen_subcommand_from domains" -x -a 'list create view update delete zone-file import clone records-list records-create records-view records-update records-delete --help'
complete -c linode -n "__fish_seen_subcommand_from domains" -x -a 'list create view update delete zone-file import clone records-list records-create records-view records-update records-delete --help'
complete -c lin -n "__fish_seen_subcommand_from domains" -x -a 'list create view update delete zone-file import clone records-list records-create records-view records-update records-delete --help'
complete -c linode-cli -n "__fish_seen_subcommand_from images" -x -a 'list create upload view update delete --help'
complete -c linode -n "__fish_seen_subcommand_from images" -x -a 'list create upload view update delete --help'
complete -c lin -n "__fish_seen_subcommand_from images" -x -a 'list create upload view update delete --help'
complete -c linode-cli -n "__fish_seen_subcommand_from linodes" -x -a 'list create view update delete backups-list snapshot backups-cancel backups-enable backup-view backup-restore boot clone configs-list config-create config-view config-update config-delete disks-list disk-create disk-view disk-update disk-delete disk-clone disk-reset-password disk-resize firewalls-list ips-list ip-add ip-view ip-update ip-delete migrate upgrade nodebalancers linode-reset-password reboot rebuild rescue resize shutdown transfer-view volumes types type-view --help'
complete -c linode -n "__fish_seen_subcommand_from linodes" -x -a 'list create view update delete backups-list snapshot backups-cancel backups-enable backup-view backup-restore boot clone configs-list config-create config-view config-update config-delete disks-list disk-create disk-view disk-update disk-delete disk-clone disk-reset-password disk-resize firewalls-list ips-list ip-add ip-view ip-update ip-delete migrate upgrade nodebalancers linode-reset-password reboot rebuild rescue resize shutdown transfer-view volumes types type-view --help'
complete -c lin -n "__fish_seen_subcommand_from linodes" -x -a 'list create view update delete backups-list snapshot backups-cancel backups-enable backup-view backup-restore boot clone configs-list config-create config-view config-update config-delete disks-list disk-create disk-view disk-update disk-delete disk-clone disk-reset-password disk-resize firewalls-list ips-list ip-add ip-view ip-update ip-delete migrate upgrade nodebalancers linode-reset-password reboot rebuild rescue resize shutdown transfer-view volumes types type-view --help'
complete -c linode-cli -n "__fish_seen_subcommand_from kernels" -x -a 'list view --help'
complete -c linode -n "__fish_seen_subcommand_from kernels" -x -a 'list view --help'
complete -c lin -n "__fish_seen_subcommand_from kernels" -x -a 'list view --help'
complete -c linode-cli -n "__fish_seen_subcommand_from stackscripts" -x -a 'list create view update delete --help'
complete -c linode -n "__fish_seen_subcommand_from stackscripts" -x -a 'list create view update delete --help'
complete -c lin -n "__fish_seen_subcommand_from stackscripts" -x -a 'list create view update delete --help'
complete -c linode-cli -n "__fish_seen_subcommand_from lke" -x -a 'clusters-list cluster-create cluster-view cluster-update cluster-delete pools-list pool-create cluster-nodes-recycle pool-view pool-update pool-delete pool-recycle node-view node-delete node-recycle api-endpoints-list cluster-dashboard-url kubeconfig-view kubeconfig-delete regenerate service-token-delete versions-list version-view --help'
complete -c linode -n "__fish_seen_subcommand_from lke" -x -a 'clusters-list cluster-create cluster-view cluster-update cluster-delete pools-list pool-create cluster-nodes-recycle pool-view pool-update pool-delete pool-recycle node-view node-delete node-recycle api-endpoints-list cluster-dashboard-url kubeconfig-view kubeconfig-delete regenerate service-token-delete versions-list version-view --help'
complete -c lin -n "__fish_seen_subcommand_from lke" -x -a 'clusters-list cluster-create cluster-view cluster-update cluster-delete pools-list pool-create cluster-nodes-recycle pool-view pool-update pool-delete pool-recycle node-view node-delete node-recycle api-endpoints-list cluster-dashboard-url kubeconfig-view kubeconfig-delete regenerate service-token-delete versions-list version-view --help'
complete -c linode-cli -n "__fish_seen_subcommand_from longview" -x -a 'list create view update delete plan-view plan-update subscriptions-list subscription-view --help'
complete -c linode -n "__fish_seen_subcommand_from longview" -x -a 'list create view update delete plan-view plan-update subscriptions-list subscription-view --help'
complete -c lin -n "__fish_seen_subcommand_from longview" -x -a 'list create view update delete plan-view plan-update subscriptions-list subscription-view --help'
complete -c linode-cli -n "__fish_seen_subcommand_from managed" -x -a 'contacts-list contact-create contact-view contact-update contact-delete credentials-list credential-create credential-view credential-update credential-update-username-password credential-revoke credential-sshkey-view issues-list issue-view linode-settings-list linode-setting-view linode-setting-update services-list service-create service-view service-update service-delete service-disable service-enable stats-list --help'
complete -c linode -n "__fish_seen_subcommand_from managed" -x -a 'contacts-list contact-create contact-view contact-update contact-delete credentials-list credential-create credential-view credential-update credential-update-username-password credential-revoke credential-sshkey-view issues-list issue-view linode-settings-list linode-setting-view linode-setting-update services-list service-create service-view service-update service-delete service-disable service-enable stats-list --help'
complete -c lin -n "__fish_seen_subcommand_from managed" -x -a 'contacts-list contact-create contact-view contact-update contact-delete credentials-list credential-create credential-view credential-update credential-update-username-password credential-revoke credential-sshkey-view issues-list issue-view linode-settings-list linode-setting-view linode-setting-update services-list service-create service-view service-update service-delete service-disable service-enable stats-list --help'
complete -c linode-cli -n "__fish_seen_subcommand_from networking" -x -a 'ips-list ip-add ip-view ip-update ip-assign ip-share v6-pools v6-ranges v6-range-create v6-range-view v6-range-delete --help'
complete -c linode -n "__fish_seen_subcommand_from networking" -x -a 'ips-list ip-add ip-view ip-update ip-assign ip-share v6-pools v6-ranges v6-range-create v6-range-view v6-range-delete --help'
complete -c lin -n "__fish_seen_subcommand_from networking" -x -a 'ips-list ip-add ip-view ip-update ip-assign ip-share v6-pools v6-ranges v6-range-create v6-range-view v6-range-delete --help'
complete -c linode-cli -n "__fish_seen_subcommand_from firewalls" -x -a 'list create view update delete devices-list device-create device-view device-delete rules-list rules-update --help'
complete -c linode -n "__fish_seen_subcommand_from firewalls" -x -a 'list create view update delete devices-list device-create device-view device-delete rules-list rules-update --help'
complete -c lin -n "__fish_seen_subcommand_from firewalls" -x -a 'list create view update delete devices-list device-create device-view device-delete rules-list rules-update --help'
complete -c linode-cli -n "__fish_seen_subcommand_from vlans" -x -a 'list --help'
complete -c linode -n "__fish_seen_subcommand_from vlans" -x -a 'list --help'
complete -c lin -n "__fish_seen_subcommand_from vlans" -x -a 'list --help'
complete -c linode-cli -n "__fish_seen_subcommand_from nodebalancers" -x -a 'list create view update delete configs-list config-create config-view config-update config-delete config-rebuild nodes-list node-create node-view node-update node-delete --help'
complete -c linode -n "__fish_seen_subcommand_from nodebalancers" -x -a 'list create view update delete configs-list config-create config-view config-update config-delete config-rebuild nodes-list node-create node-view node-update node-delete --help'
complete -c lin -n "__fish_seen_subcommand_from nodebalancers" -x -a 'list create view update delete configs-list config-create config-view config-update config-delete config-rebuild nodes-list node-create node-view node-update node-delete --help'
complete -c linode-cli -n "__fish_seen_subcommand_from object-storage" -x -a 'clusters-list clusters-view keys-list keys-create keys-view keys-update keys-delete cancel ssl-view ssl-upload ssl-delete --help'
complete -c linode -n "__fish_seen_subcommand_from object-storage" -x -a 'clusters-list clusters-view keys-list keys-create keys-view keys-update keys-delete cancel ssl-view ssl-upload ssl-delete --help'
complete -c lin -n "__fish_seen_subcommand_from object-storage" -x -a 'clusters-list clusters-view keys-list keys-create keys-view keys-update keys-delete cancel ssl-view ssl-upload ssl-delete --help'
complete -c linode-cli -n "__fish_seen_subcommand_from profile" -x -a 'view update apps-list app-view app-delete tfa-disable tfa-enable tfa-confirm tokens-list token-create token-view token-update token-delete logins-list login-view devices-list device-view device-revoke --help'
complete -c linode -n "__fish_seen_subcommand_from profile" -x -a 'view update apps-list app-view app-delete tfa-disable tfa-enable tfa-confirm tokens-list token-create token-view token-update token-delete logins-list login-view devices-list device-view device-revoke --help'
complete -c lin -n "__fish_seen_subcommand_from profile" -x -a 'view update apps-list app-view app-delete tfa-disable tfa-enable tfa-confirm tokens-list token-create token-view token-update token-delete logins-list login-view devices-list device-view device-revoke --help'
complete -c linode-cli -n "__fish_seen_subcommand_from security-questions" -x -a 'list --help'
complete -c linode -n "__fish_seen_subcommand_from security-questions" -x -a 'list --help'
complete -c lin -n "__fish_seen_subcommand_from security-questions" -x -a 'list --help'
complete -c linode-cli -n "__fish_seen_subcommand_from sshkeys" -x -a 'list create view update delete --help'
complete -c linode -n "__fish_seen_subcommand_from sshkeys" -x -a 'list create view update delete --help'
complete -c lin -n "__fish_seen_subcommand_from sshkeys" -x -a 'list create view update delete --help'
complete -c linode-cli -n "__fish_seen_subcommand_from phone" -x -a 'sms-code-send delete verify --help'
complete -c linode -n "__fish_seen_subcommand_from phone" -x -a 'sms-code-send delete verify --help'
complete -c lin -n "__fish_seen_subcommand_from phone" -x -a 'sms-code-send delete verify --help'
complete -c linode-cli -n "__fish_seen_subcommand_from regions" -x -a 'list view --help'
complete -c linode -n "__fish_seen_subcommand_from regions" -x -a 'list view --help'
complete -c lin -n "__fish_seen_subcommand_from regions" -x -a 'list view --help'
complete -c linode-cli -n "__fish_seen_subcommand_from tickets" -x -a 'list create view close replies reply --help'
complete -c linode -n "__fish_seen_subcommand_from tickets" -x -a 'list create view close replies reply --help'
complete -c lin -n "__fish_seen_subcommand_from tickets" -x -a 'list create view close replies reply --help'
complete -c linode-cli -n "__fish_seen_subcommand_from tags" -x -a 'list create delete --help'
complete -c linode -n "__fish_seen_subcommand_from tags" -x -a 'list create delete --help'
complete -c lin -n "__fish_seen_subcommand_from tags" -x -a 'list create delete --help'
complete -c linode-cli -n "__fish_seen_subcommand_from volumes" -x -a 'list create view update delete attach clone detach resize --help'
complete -c linode -n "__fish_seen_subcommand_from volumes" -x -a 'list create view update delete attach clone detach resize --help'
complete -c lin -n "__fish_seen_subcommand_from volumes" -x -a 'list create view update delete attach clone detach resize --help'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/home/apinter/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end


set -gx PATH $PATH $HOME/.krew/bin
