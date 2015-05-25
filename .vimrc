"=====Configuration refering to====="
"http://lostjs.com/2012/02/04/use-pathogen-and-git-to-manage-vimfiles/"
"https://github.com/yangyangwithgnu/use_vim_as_ide"
"http://blog.csdn.net/wooin/article/details/1858917"
"http://www.douban.com/group/topic/10866937/"

"=======vim寄存器======="
"http://yejinxin.github.io/vim-register-usage/
":reg
":help registers
"vim寄存器
" " 0-9 a-zA-Z - %#.: _ *+~ / =

"检查VIM是否具有signs特性，会影响signature
":echo has('signs')

"redir 把信息输出重定向到文件或寄存器里
":redir > ./redir.log
":scriptnames
":redir END

"执行外部命令
"!ls
"将结果插入到缓冲区中光标所在行下面
"r!ls
"对所有的非空行进行编号,加%表示所有内容,不加则使用选中文本
":%!nl
"对包含空行的所有行编号
":%!nl -ba

"转换为16进制
":%!xxd
"转换回来
":%!xxd -r

"定义快捷键的前缀，即<Leader>
let mapleader=";"
"禁止光标闪烁
set gcr=a:block-blinkon0
"禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"开启行号显示
set number
"高亮显示当前行/列
"set cursorline
"set cursorcolumn
"高亮显示搜索结果
set hlsearch
"设置 gvim 显示字体
set guifont=Consolas:h13
"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on
"自适应不同语言的智能缩进
filetype indent on
"将制表符扩展为空格
set expandtab
"设置编辑时制表符占用空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
"让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
"基于缩进或语法进行代码折叠
"zc/zo/zC/zO/[z/]z
"set foldmethod=indent
set foldmethod=syntax
"zf%/zf56G/10zf+
"set foldmethod=marker
"启动 vim 时关闭折叠代码
set nofoldenable
"t：根据 textwidth 自动折行
"c：在（程序源代码中的）注释中自动折行，插入合适的注释起始字符
"r：插入模式下在注释中键入回车时，插入合适的注释起始字符
"q：允许使用“gq”命令对注释进行格式化 gq{ gq5j gqG
set formatoptions=tcrq
"设置textwidth
set tw=80

"=======设置pathogen======="
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

"=======设置配色方案======="
colorscheme lucius
LuciusDark

"=======设置vim-powerline======="
"设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

"=======设置vim-indent-guides======="
"随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
"从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
"色块宽度
let g:indent_guides_guide_size=1
"快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"=======设置a.vim======="
"*.c/*.cpp 和 *.h 间切换
nmap <silent> <Leader>ch :A<CR>
"子窗口中显示 *.c/*.cpp 或 *.h
nmap <silent> <Leader>sch :AS<CR>

"=======设置vim-signature======="
"独立书签名[a-zA-Z]{1,2},同一文件中书签名不能有相同字母
"mx  加书签
"m,  用系统生成的书签名加书签
"m.  打开/关闭当前行标签
"mda 删除文件内的所有书签
"ms  罗列当前文件内的所有书签
"mp  按照行号前后顺序跳至上个独立书签
"mn  按照行号前后顺序跳至下个独立书签
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

"=======设置taglist====="
"不同时显示多个文件的tag,只显示当前文件
let Tlist_Show_One_File=1
"如果taglist是最后一个窗口,则退出vim
let Tlist_Exit_OnlyWindow=1

"=======设置win manager====="
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"=======加载ctags====="
if filereadable("tags")
    set tags=tags
endif

"=======设置cscope====="
"关于cscope的快捷键和初始化设置在cscope_maps插件中
"设定是否使用 quickfix 窗口来显示 cscope 结果
:set cscopequickfix=s-,c-,d-,i-,t-,e-
"更新cscope&ctags
nmap <F5> :!find . -iname '*.c' -o -iname '*.h' > cscope.files<CR> 
        \ :!cscope -b -i cscope.files -f cscope.out<CR> 
        \ :cs reset<CR>
        \ :!ctags -R --c-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c<CR>
"绑定快捷键查看cscope搜索结果,cw切换至quick fix窗口
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

"=======其他======="
"在子窗口切换的快捷键,MAC不适用
"noremap <C-Down>  <C-W>j
"noremap <C-Up>    <C-W>k
"noremap <C-Left>  <C-W>h
"noremap <C-Right> <C-W>l
"绑定ctrl+c/x/v/a
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> "+gP
vmap <C-v> "+gP
nmap <C-a> ggVG
