:set nu
"显示行号
:syn on
"显示彩色语法

filetype plugin indent on
execute pathogen#infect()




"https://cloud.tencent.com/developer/article/1560814

" 使用vim的modeline来设置当前文件的textwidth,
" 避免输入超过78个字符时自动换行
"  使用:verbose set textwidth?命令可以看到vim默认为vim配置脚本设置了textwidth为78,当输入超过78个字符并按下空格键时会自动换行.将textwidth设成0关闭该功能
"vim: tw=0 :
:set textwidth=0
"取消自动换行

" 让Backspace键可以往前删除字符.
set backspace=indent,eol,start

" 1=启动显示状态行, 2=总是显示状态行.
" 设置总是显示状态行,方便看到当前文件名.
set laststatus=2

" 显示还没有输入完整的命令.例如yy命令,输入第一个y会在右下角显示y.
set showcmd

" 设置状态行显示的内容. %F: 显示当前文件的完整路径.
" %r: 如果readonly,会显示[RO]
" %B: 显示光标下字符的编码值,十六进制.
" %l:光标所在的行号. %v:光标所在的虚拟列号.
" %P: 显示当前内容在整个文件中的百分比.
" %H和%M是strftime()函数的参数,获取时间.
set statusline=%F%r\ [HEX=%B][%l,%v,%P]\ %{strftime(\"%H:%M\")}

" 显示还没有输入完整的命令.例如yy命令,输入第一个y会在右下角显示y.
set showcmd

" 使用Tab键补全时,在状态栏显示匹配的列表,
" 方便查看都有哪些命令符合补全条件.
set wildmenu

" 高亮显示匹配的括号
set showmatch

" 高亮显示所有搜索到的内容.后面用map映射快捷键来方便关闭当前搜索的高亮.
set hlsearch

" 光标立刻跳转到搜索到内容
set incsearch

" 搜索到最后匹配的位置后,再次搜索不回到第一个匹配处
set nowrapscan

" 去掉输入错误时的提示声音
set noeb

" 默认按下Esc后,需要等待1秒才生效,
" 设置Esc超时时间为100ms,尽快生效
set ttimeout
set ttimeoutlen=100

" 设置文件编码,主要是避免中文乱码.
" 先注释,后续遇到中文乱码再打开
"" set fileencodings=utf-8,cp936,big5,latin1

" FIXME 在MS-DOS控制台打开vim时,控制台使用鼠标右键来复制粘贴,设置全鼠标模式,鼠标右键被映射为visual mode,不能用来复制粘贴,不方便.但是如果不设置鼠标模式,会无法使用鼠标滚轮来滚动界面.经过验证,发现可以设成普通模式mouse=n来使用鼠标滚轮,也能使用鼠标右键复制粘贴. mouse=c/mouse=i模式都不能用鼠标滚轮. Linux下还是要设成 mouse=a
set mouse=n

" 开启语法高亮
syntax enable

" 检测文件类型,并载入文件类型插件,
" 为特定文件类型载入相关缩进文件
filetype plugin indent on

" 自动缩进时,缩进长度为4
set shiftwidth=4

" 输入Tab字符时,自动替换成空格
"set expandtab

" 设置softtabstop有一个好处是可以用Backspace键来一次删除4个空格. softtabstop的值为负数,会使用shiftwidth 的值,两者保持一致,方便统一缩进.
set softtabstop=-1

" 指定tab字符和空格的颜色组为MyTabSpace,不同字符串之间用|隔开,要使用\|转义.
"match MyTabSpace /\t\| /

"https://www.ruanyifeng.com/blog/2018/09/vimrc.html
"启用256色
set t_Co=256

"使用 utf-8 编码
set encoding=utf-8

"开启文件类型检查，并且载入与该类型对应的缩进规则。比如，如果编辑的是.py文件，Vim 就是会找 Python 的缩进规则~/.vim/indent/python.vim
filetype indent on

"保留撤销历史。
"Vim 会在编辑时保存操作历史，用来供用户撤消更改。默认情况下，操作记录只在本次编辑时有效，一旦编辑结束、文件关闭，操作历史就消失了。
"打开这个设置，可以在文件关闭后，操作记录保留在一个文件里面，继续存在。这意味着，重新打开一个文件，可以撤销上一次编辑时的操作。撤消文件是跟原文件保存在一起的隐藏文件，文件名以.un~开头。
set undofile

"搜索时忽略大小写
set ignorecase

"如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感。比如，搜索Test时，将不匹配test；搜索test时，将匹配Test。
"set smartcase

"光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号。
set showmatch

"打开英语单词的拼写检查
"set spell spelllang=en_us

"出错时，发出视觉提示，通常是屏幕闪烁
set visualbell

"Vim 需要记住多少次历史操作。
set history=1000

"打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
set autoread

"除了文章提到的设置，在我的 .vimrc 还添加了匹配 Python 开发的配置，每次新建一个 .py 的文件都可以自动添加脚本的头部信息，很方便。
func SetTitle()
call setline(1, "\#!/usr/bin/python")
call setline(2, "\# -*- coding=utf8 -*-")
call setline(3, "\"\"\"")
call setline(4, "\# @Author : Hasan")
call setline(5, "\# @Created Time : ".strftime("%Y-%m-%d %H:%M:%S"))
call setline(6, "\# @Description : ")
call setline(7, "\"\"\"")
normal G
normal o
normal o
endfunc
autocmd bufnewfile *.py call SetTitle()







