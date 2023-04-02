#
# /etc/bash.bashrc
#
#下面是原版
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize
#下面这一行是我注释的，为了不与自定义的PS1冲突
#PS1='[\u@\h \W]\$ '

case ${TERM} in
  Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
    PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')

    ;;
  screen*)
    PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
esac

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi




#以下为自定义
#PS1='\[\e[38;2;0;255;0m\]\u\[\e[38;2;255;255;255m\]:\[\e[38;2;135;206;235m\]\W\[\e[38;2;255;255;255m\]\$ '
PS1='\[\e[1;38;2;0;255;0m\]\u\[\e[0;38;2;255;255;255m\]:\[\e[1;38;2;30;156;225m\]\W\[\e[0;38;2;255;255;255m\]\$ '

#激活dircolors
if [ -f ~/.dircolors ]; then
    eval $(dircolors -b ~/.dircolors)
fi

#dircolors2
#if [ -f /home/Hasan/.local/share/yakuake/kns_skins/dircolor2 ]; then
#    eval $(dircolors -b /home/Hasan/.local/share/yakuake/kns_skins/dircolor2)
#fi


# Red name for root
if [ "${UID}" -eq "0" ]; then 
  nameC="${txtred}" 
fi

#仅在非tty1使用LANG=C pacman
#if [[ "$TERM" != "linux" && "$TERM" != "linux-256color" && "$TTY" != "/dev/tty1" ]]; then
#    alias pacman='sudo LANG=C pacman'
#fi

if [[ "$TTY" != "/dev/tty1" ]]; then
    alias pacman='sudo LANG=C pacman'
fi

alias s='source /etc/bash.bashrc'
#历史记录
#HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000000
HISTFILESIZE=100000000
shopt -s histappend
#查看历史记录大小（硬盘）
alias hsize='echo "$(echo "$(history | wc -l) / 1000" | bc -l) KB"'
#查看最常用的10个命令
alias hisstat="history | awk '{CMD[\$2]++;}END { for (a in CMD) print CMD[a] \" \" a;}' | sort -nr | head -n 10"

#杂项
alias ls='ls -a --color=auto'
alias lst='ls -oh --color=auto'
alias ps='ps -fu Hasan'
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias ..='cd ..'
alias transtoen='trans -shell zh:en'
alias transtojp='trans -shell -brief -p zh:ja'
alias galtrans='trans -shell -brief ja:zh'
alias trans='trans -shell -brief :zh'
alias calc='calc -s'
#alias cd='cd;ls;pwd'
alias pacmans='sudo pacman -S'
alias yays='yay -S'
alias oggtoflac="sudo find ./ -type f -name \"*.ogg\" -exec bash -c 'ffmpeg -i \"\$0\" -c:a flac \"\${0%.ogg}.flac\"' {} \;"
alias oggtomp3="sudo find ./ -type f -name \"*.ogg\" -exec bash -c 'ffmpeg -i \"\$0\" -c:a mp3 \"\${0%.ogg}.mp3\"' {} \;"
alias mp3toflac="sudo find ./ -type f -name \"*.mp3\" -exec bash -c 'ffmpeg -i \"\$0\" -c:a flac \"\${0%.mp3}.flac\"' {} \;"
alias mp3toogg="sudo find ./ -type f -name \"*.mp3\" -exec bash -c 'ffmpeg -i \"\$0\" -c:a ogg \"\${0%.mp3}.ogg\"' {} \;"
alias 化学='vim /home/Hasan/化学notes.txt'
alias chem='vim ~/下载/"chem notes.txt"'
alias linux='vim ~/下载/Sync2/Linux.txt'
alias 素晴日='wine /home/Hasan/"Nihongo HD"/BGI.exe'
alias 素晴日en="sudo wine /home/Hasan/Subarashikihibi-en/BGI.exe"
alias vimrc='vim ~/.vimrc'
alias cd='function __cd(){ builtin cd "$@" && pwd && ls -a --color=auto; }; __cd'
alias main.py='vim ~/PycharmProjects/pythonProject/main.py'
alias 文件资源管理器='wine explorer'
alias 注册表='wine regedit'
alias cnotes='vim /home/Hasan/C++.c'
alias C++='vim /home/Hasan/C++.c'
alias ping='gping'
alias vdircolors='vim ~/.dircolors'



#系统信息
#查看CPU信息
alias cpuinfo='lscpu'
#查看内存信息
alias meminfo='free -h'
#查看磁盘信息
alias diskinfo='df -h'
#查看网络信息
alias netinfo='ifconfig'
#查看进程信息
alias threadinfo='ps aux'



# System Info
#function sysinfo()  
#{
#clear
alias num_cpus='cat /proc/cpuinfo | grep -c "model name"'
alias machine_cpu='cat /proc/cpuinfo | grep -m 1 "model name" | cut -d: -f2'
alias machine_mhz='cat /proc/cpuinfo | grep -m 1 "cpu MHz" | cut -d: -f2'
alias machine_cpuinfo='uname -mp'
#todays_date=`date +"%D %r"`
alias machine_uptime='uptime'
alias machine_ram="cat /proc/meminfo | grep -m 1 \"MemTotal:\" | cut -d: -f2 |  sed \'s/^[ \t]*//'"
alias machine_video="lspci | grep -m 1 \"VGA\" | cut -d: -f3 |  sed 's/^[ \t]*//'"
alias machine_eth_card="lspci | grep -m 1 \"Ethernet\" | cut -d: -f3 |  sed 's/^[ \t]*//'"
alias machine_audio_controller="lspci | grep -m 1 \"audio\" | cut -d: -f3 |  sed 's/^[ \t]*//'"
alias arch_damons="grep \"DAEMONS=\" /etc/rc.conf "
alias last_logins="last | head"
alias eth0info="ifconfig eth0 | grep \"inet addr:\" | sed 's/inet addr/Local IP/g' | sed 's/^[ \t]*//;s/[ \t]*$//'"



#文件后缀名绑定
#alias -s txt=vim
#alias -s cpp=vim
#alias -s java=vim
#alias -s xml=vim
#alias -s php=vim
#alias -s py=vim



#sudo
alias pacman='sudo pacman'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown'
alias docker='sudo docker'
alias chmod='sudo chmod'

#路径更改
alias bashrc='sudo vim /etc/bash.bashrc'
alias .bashrc='vim ~/.bashrc'
alias .bashrc='vim ~/.bashrc'
#hash -d down=~/下载/
alias down='cd /home/Hasan/下载/'
alias pic='cd /home/Hasan/图片/'
alias doc='cd /home/Hasan/文档/'
alias video='cd /home/Hasan/视频/'
alias desk='cd /home/Hasan/桌面/'
alias weixin="cd '/home/Hasan/文档/WeChat Files/wxid_lh2zkwuuquv222/FileStorage/File/'"
alias mkdir='mkdir -p'

#alias pdf='evince $(fd '.*[.]pdf' -t f |sk)'

#一键升级pip+paru+flatpak+pacman+AUR
alias upgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U;paru;flatpak update;sudo pacman -Syu;yay -Syu"
alias update='sudo pacman -Syu;yay -Syu;paru;flatpak update'
#显示无符号链接的路径
alias pwd='pwd -P'
#显示网络连接状态
alias netstat='sudo netstat -tulanp'
#列出所有的端口及其对应的进程
alias ports='sudo netstat -tulnp'
#列出当前目录下所有文件（不包括文件夹）的大小
alias siz='du -sh *.*'
#列出当前目录下所有的可执行文件
alias exe='find . -type f -executable'
#查看最近一段时间内系统日志
alias logs='sudo journalctl -f'
#列出当前目录下所有子目录和文件的数目
alias filenum='ls -1 | wc -l'
#显示当前的公网IP地址
alias myip='curl ifconfig.co'
#列出当前目录下的所有子目录，不包括文件
alias lsd='ls -d */'
#显示当前目录的完整路径并复制到剪切板
alias cpwd='pwd | tr -d "\n" | xclip -sel clip && echo -n "pwd copied to clipboard: "; pwd'




#
#显示文件和文件夹的大小（以人类可读的方式）
alias duh='du -h --max-depth=1'
#批量替换文件名中的空格为下划线：
#alias underscore='find . -depth -name "* *" -execdir rename ' ' _ {} +'

#删除前进行确认
alias rm='rm -i'
alias mv='mv -i'
# 上移两级文件夹
alias  ...='cd ../..;pwd'
# 上移三级文件夹
alias ....='cd ../../..;pwd'
# 使用 c 清屏
alias c='clear'
# 使用 h 查看 bash 历史记录
alias h='history'
# 更好地显示目录结构
alias tree='tree --dirsfirst -Fc'
alias grep='grep --color=auto'

# 通过输入月份的前三个英文字母来查看日历
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'


