# Dotconf
## A collection of dotfiles, configfiles, scripts   

## Licensing Information: UNLICENSE (READ LICENSE)

## Authors & Contributors
Attila Pinter
   
## List of files:   
   
├── Arch-installer   
│   ├── i3wm_apps_AUR.sh   
│   └── i3wm_apps.sh   
├── CentOS-bridge    
│   ├── ifcfg-br0   
│   ├── ifcfg-em1   
│   └── ifcfg-em2   
├── elasticsearch   
│   ├── data-node   
│   │   └── elasticsearch.yml   
│   └── master-node   
│       └── elasticsearch.yml   
├── Fonts   
│   ├── fontawesome-webfont.ttf   
│   ├── Inconsolata-Bold.ttf    
│   ├── Inconsolata-Regular.ttf   
│   ├── System\ San\ Francisco\ Display\ Bold.ttf   
│   ├── System\ San\ Francisco\ Display\ Regular.ttf   
│   ├── System\ San\ Francisco\ Display\ Thin.ttf   
│   └── System\ San\ Francisco\ Display\ Ultralight.ttf   
├── i3blocks   
│   ├── apt   
│   ├── bandwidth   
│   ├── battery    
│   ├── battery_OLD   
│   ├── close   
│   ├── cpu_usage   
│   ├── date   
│   ├── disk   
│   ├── focused   
│   ├── gmail   
│   ├── i3menu   
│   ├── iface   
│   ├── keyindicator   
│   ├── load_average   
│   ├── mediaplayer   
│   ├── mem   
│   ├── memory    
│   ├── minmax   
│   ├── openvpn   
│   ├── pacman    
│   ├── reddit    
│   ├── scratch   
│   ├── sestatus   
│   ├── signal   
│   ├── stopwatch_countdown   
│   ├── temperature   
│   ├── uptime   
│   ├── volume   
│   └── wifi   
├── i3+termite   
│   ├── i3   
│   │   ├── config   
│   │   └── i3blocks.conf   
│   ├── i3blocks.conf   
│   └── termite   
│       └── config   
├── nano   
├── nginx   
│   ├── kibana.conf   
│   └── nginx.conf   
├── README.md   
├── samba   
│   ├── smb4.conf   
│   └── smb.conf   
├── ssh   
│   ├── sock_tunnel   
│   │   └── ishida   
│   ├── sshd_config   
│   └── ssh-out   
├── tmux-config   
│   ├── resurrect   
│   │   ├── last -> tmux_resurrect_2017-02-23T13:13:13.txt   
│   │   ├── tmux_resurrect_2017-02-16T12:12:28.txt   
│   │   ├── tmux_resurrect_2017-02-16T12:12:31.txt   
│   │   ├── tmux_resurrect_2017-02-16T13:05:42.txt   
│   │   ├── tmux_resurrect_2017-02-16T13:17:21.txt   
│   │   ├── tmux_resurrect_2017-02-16T13:18:16.txt    
│   │   ├── tmux_resurrect_2017-02-16T18:28:01.txt    
│   │   ├── tmux_resurrect_2017-02-16T20:09:08.txt    
│   │   ├── tmux_resurrect_2017-02-16T20:09:18.txt    
│   │   ├── tmux_resurrect_2017-02-20T13:10:04.txt   
│   │   ├── tmux_resurrect_2017-02-20T13:31:50.txt    
│   │   ├── tmux_resurrect_2017-02-22T10:45:35.txt    
│   │   ├── tmux_resurrect_2017-02-22T10:46:02.txt    
│   │   ├── tmux_resurrect_2017-02-22T12:29:08.txt    
│   │   ├── tmux_resurrect_2017-02-23T13:13:07.txt    
│   │   └── tmux_resurrect_2017-02-23T13:13:13.txt     
│   └── tmux.conf    
├── tree   
├── vim   
└── wallpaper    
    ├── A.jpg   
    ├── dark-blue-anime.jpg     
    ├── IFcqIOS.jpg    
    ├── wallhaven-137360.jpg    
    ├── wallhaven-141674.jpg    
    ├── wallhaven-163735.png    
    ├── wallhaven-163864.png    
    ├── wallhaven-163928.png    
    ├── wallhaven-180399.jpg     
    ├── wallhaven-191732.jpg     
    ├── wallhaven-191833.jpg    
    ├── wallhaven-191997.jpg     
    ├── wallhaven-192425.png     
    ├── wallhaven-192900.png     
    ├── wallhaven-197887.jpg    
    ├── wallhaven-220547.jpg     
    ├── wallhaven-226118.jpg     
    ├── wallhaven-243042.png    
    ├── wallhaven-268313.png    
    ├── wallhaven-280720.jpg    
    ├── wallhaven-300865.jpg    
    ├── wallhaven-327796.jpg    
    ├── wallhaven-327990.png    
    ├── wallhaven-338660.png    
    ├── wallhaven-364009.png   
    ├── wallhaven-370738.jpg   
    ├── wallhaven-373033.jpg    
    ├── wallhaven-403898.jpg   
    ├── wallhaven-417935.jpg    
    ├── wallhaven-440724.png   
    ├── wallhaven-45350.jpg    
    ├── wallhaven-456070.jpg    
    ├── wallhaven-52898.jpg     
    ├── wallhaven-56243.jpg    
    └── wallpaper.jpg    
  
19 directories, 108 files   
   
## About
The dotconf repo is for saving my most used configurartion files for WM/DE, networking and system deploys. 

## What is what
### Arch-installer   
Quickly installing some of the bacis applications on Arch from the official repos and also from AUR. Installs i3 and Gnome.   
   
### CentOS-bridge   
Sample config for a bridge configruation. Useful for deploying KVM host.   
   
### elasticsearch   
Sample config for ES data and ES data-master nodes.   
   
### Fonts   
Riceing....fonts    
    
### i3blocks
My modified i3blocks configs, to be placed under /usr/lib or wherever the actual block scripts are kept. (Not all my work of course!)   
   
### i3+termite   
Basic configuration files for i3wm and termite terminal emulator.   
   
### nano   
Nano syntax highlighting config. I don't use nano, but here it is in case, nice collection.   
   
### Nginx
Sample nginx.conf and an example reverse proxy, usually use for Kibana.   
   
### Samba   
Sample samba config.   
   
### SSH   
Sample ssh config and some tunneling.   
   
### tmux-config   
My favorite tmux settings. To be placed under ~/.tmux.   
   
### Vim   
A pretty powerful vim configuration with plugins. Plugin installation notes are in .vimrc.   
   
### Wallpaper   
A few Wallpapers.   
   
    
## Known issues   
   
   
## Next?   
I. Update README...   
