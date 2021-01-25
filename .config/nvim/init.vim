" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @LiuPeng



" 判断操作系统
"
let g:iswindows = 0
let g:islinux = 0

if has('win64')
	let g:iswindows = 1
elseif has('unix')
	let g:islinux = 1
elseif has('mac')
	let g:ismac = 1
endif

" 自动加载vim-plug插件，如果没有安装的情况下
if has(g:islinux == 1)
	if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
elseif has(g:iswindows == 1)
	if empty(glob('C:\\Users\\admin\\AppData\\Local\\nvim\\autoload'))
		silent !curl -fLo 'C:\\Users\\admin\\AppData\\Local\\nvim\\autoload\\plug.vim' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif


" #######################################   基本设置    ######################################

set nocompatible                                                    " 不启用vi的键盘模式,关闭兼容模式(必须设置在开头)
set history=2000                                                    " 设置历史操作记录为2000条
syntax enable                                                       " 语法高亮支持
filetype on                                                         " 关闭文件类型自动检测功能,这个功能被filetype plugin indent on代替
filetype plugin indent on                                           " 载入文件类型插件,代替filetype off

" 设置文件编码和文件格式
set fileencodings=utf-8,gb2312,gbk,gb18030,big5,ucs-bom,cp936,latin-1
set fenc=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileformat=unix
set fileformats=unix,mac,dos

" 设置字体
"set guifont=JetBrains\ Mono:h11:cANSI
" 设置退格键可用
set backspace=2
" 自动对齐
set autoindent
" 设置自动缩进
set ai!
" 智能自动缩进
set smartindent
" 开启相对行号
set relativenumber
" 显示行号
set number
" 右下角显示光标位置的状态行
set ruler
" 开启实时搜索功能
set incsearch
" 开启高亮显示结果
set hlsearch
" 搜索到文件两端时不重新搜索
set nowrapscan
" 允许在有未保存的修改时切换缓冲区
set hidden
" 设定文件浏览器目录为当前目录
set autochdir
" 选择代码折叠类型
set foldmethod=indent
" 禁止自动折叠
set foldlevel=100
" 开启状态栏信息
set laststatus=2
" 命令行的高度，默认为1，这里设为2
set cmdheight=2
" 当文件在外部被修改时自动更新该文件
set autoread
" 允许可视列块模式的虚拟编辑
set virtualedit=block
" 关闭八进制
set nrformats=
" 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set list
set listchars=tab:\|\ ,trail:▫
" 将Tab自动转化成空格[需要输入真正的Tab符时，使用 Ctrl+V + Tab]
set expandtab
" 显示括号配对情况
set showmatch

" ------ Vim美化 ------
" 支持真色彩；终端下
set termguicolors
" 设置vim背景为浅色
set background=dark
"
packadd! dracula
" 设置gruvbox主题
colorscheme dracula
" --------------------------------
" 根据时间动态的切换主题背景颜色
" 白天激活浅色版本（此处定义为7 AM-7PM），晚上激活暗色版本。
" --------------------------------
"if strftime('%H') >= 7 && strftime('%H') < 19
"  set background=light                                         " 设置vim背景为浅色
"  let g:airline_theme='cosmic_latte_light'                     " 航空公司的配置
"  "let g:lightline = { 'colorscheme': 'cosmic_latte_light' }   " 灯线的配置 
"else
"  set background=dark                                          " 设置vim背景为深色
"  let g:airline_theme='cosmic_latte_dark'                      " 航空公司的配置
"  "let g:lightline = { 'colorscheme': 'cosmic_latte_dark' }    " 灯线的配置
"endif
"colorscheme cosmic_latte

" -------- 窗口及布局配置 ---------
au GUIEnter * simalt ~x                                             " 启动时自动最大化窗口
"winpos 0 0                                                         " 指定窗口出现的位置，坐标原点在屏幕左上角
"set lines=100 columns=110                                          " 指定窗口大小，lines 为高度，columns 为宽度
set guioptions+=c                                                   " 使用字符提示框
set guioptions-=m                                                   " 隐藏菜单栏
set guioptions-=T                                                   " 隐藏工具栏
set guioptions-=L                                                   " 隐藏左侧滚动条
set guioptions-=r                                                   " 隐藏右侧滚动条
set guioptions-=b                                                   " 隐藏底部滚动条
set showtabline=0                                                   " 隐藏Tab栏
set cursorline                                                      " 高亮突出当前行
"set cursorcolumn                                                   " 高亮突出当前列
set shiftwidth=4                                                    " 设置通用缩进策略 [四空格缩进]
set tabstop=4                                                       " 设置通用缩进策略 [四空格缩进]
set softtabstop=4                                                   "
set scrolloff=4                                                     "
set noexpandtab                                                     "
set ttimeoutlen=0                                                   "
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
"set foldenable=syntax                                              " 让Vim基于语法进行折叠
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set clipboard+=unnamedplus
autocmd FilterWritePre * if &diff | setlocal wrap< | endif      " 使用 vimdiff 时，长行自动换行

" 打开文件时自动到文件最后的行
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 配置输入法 当退出编辑模式时，切换为英文输入法，进入插入模式切换为中文输入法
if has("gui_running")
  set imactivatekey=S-C
  inoremap <ESC> <ESC>:set iminsert=2<CR>
  inoremap <C-[> <C-[>:set iminsert=2<CR>
endif

" --------- 备份文件相关 --------- 
set nobackup                                                        " 不生成备份文件
set noswapfile                                                      " 不生成交换文件
" 创建备份文件存放目录
"silent !mkdir "D:\Program Files (x86)\Vim\vimfiles\tmp\backup"
" 创建交换文件存放目录
"silent !mkdir "D:\Program Files (x86)\Vim\vimfiles\tmp\undo\"							
"silent !mkdir -p ~/.config/nvim/tmp/sessions
" 指定配置文件路径
"set backupdir=D:\Program Files (x86)\Vim\vimfiles\tmp\backup,.
" 指定交换文件路径 
"set directory="D:\Program Files (x86)\Vim\vimfiles\tmp\undo\",.

"if has('persistent_undo')
"	set undofile
"	set undodir=~/.config/nvim/tmp/undo,.							" 指定撤销文件的路径
"endif
" 配置Python虚拟环境
let g:python3_host_prog='C:/Python38/python.exe'
let g:python_host_prog='C:/Python26/python.exe'

"##################################  按键设置   ##################################
" 重新映射 <LEADER> 按键
let mapleader = ","
let maplocalleader = "\\"

" 将 r 与 R 替换成 虚拟替换模式
noremap R gR

" 退出insert模式
inoremap jk <ESC>

" Copy to system clipboard
noremap y "+y
noremap p "+p

" Copy to system clipboard
vnoremap y "+y
vnoremap p "+p

" 全选 + 复制
noremap <C-A> ggVGy

" 全选 + 复制
noremap! <C-A> <Esc>ggVGy

" 复制一整行
noremap Y yy

" make Y to copy till the end of the line 
" 使用Y复制一整行
"nnoremap Y y$

" 搜索时使光标始终在中间一行。
noremap n nzz
noremap N Nzz

" 删除一整行
noremap <LEADER>d dd
inoremap <LEADER>d <ESC>ddi

" 将当前光标下的单词大写
inoremap <LEADER>U <ESC>viwUA
noremap <LEADER>U viwUe
noremap <LEADER>u viwue

" 添加引号
nnoremap <LEADER>" viw<esc>a"<esc>hbi"<esc>lel

" 添加单引号
nnoremap <LEADER>' viw<esc>a'<esc>hbi'<esc>lel

" 添加括号
nnoremap <LEADER>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <LEADER>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <LEADER>{ viw<esc>a}<esc>hbi{<esc>lel

" 添加注释
autocmd FileType javascript nnoremap <buffer> <LEADER>c I// <ESC>
autocmd FileType shell,python nnoremap <buffer> <LEADER>c I# <ESC>
" Disable the default s key
" 关闭s键的默认功能
"noremap s <nop>

" Save & quit
noremap Q :q<CR>
noremap S :w<CR>

" noremap <C-q> :qa<CR>
noremap <A-R> :source $MYVIMRC<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :vsplit $MYVIMRC<CR>

" 使用%% 快捷键，直接显示全路径
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" 折叠行
noremap <LEADER>- :lN<CR>
noremap <LEADER>= :lne<CR>

" 关闭高亮显示
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" 替换全局 TAB
nnoremap <LEADER>tt :%s/    /\t/g<CR>
vnoremap <LEADER>tt :s/    /\t/g<CR>

" 替换Windows下的 ^M符号
map <LEADER>dm :%s/ //g<CR>

" 折叠
noremap <silent> <LEADER>o za

" 打开 lazygit
"noremap <LEADER>g :Git 
"noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" 格式化
nnoremap \f :Autoformat<CR>

" ----------------------  分屏 ------------------
"  向左分屏，光标移动到新的窗口上
map su :set splitright<CR>:vsplit<CR>
"  向左分屏，光标不动
map si :set nosplitright<CR>:vsplit<CR>
"  向下分屏，光标不动
map sn :set nosplitbelow<CR>:split<CR>
"  向下分屏，光标移动到新的窗口上
map sm :set splitbelow<CR>:split<CR>

" \ /k/l/h <LEADER> = \ 分屏窗口移动 Normal mode
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

" 调整分屏大小
map <A-j> :res +5<CR>
map <A-k> :res -5<CR>
map <A-h> :vertical resize+5<CR>
map <A-l> :vertical resize-5<CR>

" 创建 tabe
map tu :tabe<CR>
map tn :-tabnext<CR>
map tl :+tabnext<CR>

" ##########################   自动编译文件    ######################################
" F5 自动编译文件 Normal+Visual mode
map <F5> :call CompileRunGcc()<CR>

function! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!" chrome " % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run -d iPhone\ 11\ Pro
		CocCommand flutter.dev.openDevLog
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ########################    插件配置  #############################

" ------------------ NERDTree插件配置 ------------------
"树形目录开关
map <C-n> :NERDTreeMirror<CR>
map <C-n> :NERDTreeToggle<CR>
" 当只剩 文件窗口管理器时 关闭 vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 更改默认的 箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 默认打开NERDTree
let NERDTreeChDirMode=2                                         " 设置当前目录为nerdtree的起始目录
let NERDChristmasTree=1                                         " 使得窗口有更好看的效果
let NERDTreeMouseMode=1                                         " 双击鼠标左键打开文件
let NERDTreeWinSize=25                                          " 设置窗口宽度为25
let NERDTreeQuitOnOpen=1                                        " 打开一个文件时nerdtree分栏自动关闭
" 打开文件默认开启文件树
"autocmd VimEnter * NERDTree

" ******************** 航空公司的配置 ********************************
" 开启拓展
let g:airline#extensions#tabline#enabled = 1
" 为标签行配置单独的分隔符
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" 启用默认样式
let g:airline#extensions#tabline#formatter = 'unique_tail'
" 配置样式
let g:airline_theme='atomic'

let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <,> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <,> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <,> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <,> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR"

" ----------------     Markdown 文档插件的配置      ----------------------------
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'


"
"******************auto format设置***************
"vim-autopep8设置,关闭diff提示
let g:autopep8_disable_show_diff=1

"****************jedi-vim设置*******************
"let g:jedi#auto_initialization = 1
"let g:jedi#completions_enabled = 0
""如果你想启用这个功能,auto_initialization必须开启
"let g:jedi#show_call_signatures = 1
""  MD 文集实施预览插件配置   vim-instant-markdown
"filetype plugin on
"Uncomment to override defaults:
" 取消注释已覆盖默认值
" ----------- 0：表示关闭；1：表示开启---------------
"let g:instant_markdown_slow = 1
" 手动打开预览窗口 默认值：1
"let g:instant_markdown_autostart = 1
"默认情况下，服务器仅在localhost上侦听。要使服务器可用于网络中的其他人
"let g:instant_markdown_open_to_the_world = 0
" 启用脚本
"let g:instant_markdown_allow_unsafe_content = 1
" 是否允许使用外部资源，例如图像。默认开启
"let g:instant_markdown_allow_external_content = 1
"默认情况下，不会渲染Markdown中嵌入的TeX代码。该选项使用MathJax并以方式启动节点服务器instant-markdown-d --mathjax。
"let g:instant_markdown_mathjax = 1
" 将启动日志保存到文件中，方便查处错误
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
" 默认开启 自动到光标所在的位置
"let g:instant_markdown_autoscroll = 1
" 自定义端口
"let g:instant_markdown_port = 8090
"let g:instant_markdown_python = 1

" #########################    语言服务器配置       #####################################

" ------------------------   COC 代码补全插件配置   ------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"#####################       安装插件               #########################
"
call plug#begin()

" ------------------------------ 美化 ------------------------------ 
"启动vim或nvim你将看到一个酷酷的启动界面
Plug 'mhinz/vim-startify'
" 吸血鬼 主题
Plug 'dracula/vim', { 'as': 'dracula' }
"gruvbox 主题
"Plug 'morhetz/gruvbox'
" 护眼主题
"Plug 'nightsense/cosmic_latte'
" 一个不知名的黑色主题
"Plug 'joshdick/onedark.vim'
"vim-airline 底部状态栏优化
Plug 'bling/vim-airline'
" 主题安装
"Plug 'ajmwagar/vim-deus'
" ----- 底部状态栏( 航空公司不能与灯线同时存在 ) -----
" 航空公司
Plug 'vim-airline/vim-airline'
" 航空公司的主题
Plug 'vim-airline/vim-airline-themes'
" 灯线
"Plug 'itchyny/lightline.vim'

" ------------------------------ 语法高亮包 ------------------------------ 
" HTML, CSS, JavaScript, PHP, JSON, etc.
" Json 文件的语法高亮包
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" JavaScript 文件的语法高亮 
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
" Vim语言包的集合。
"属于开箱即用型的语法高亮包
Plug 'sheerun/vim-polyglot'
" html5的语法高亮包
Plug 'othree/html5.vim'
" MD 文件的语法高亮包
Plug 'plasticboy/vim-markdown'
" css 文件的语法高亮包
Plug 'JulesWang/css.vim'
" css3 的语法高亮插件
"  与css.vim 有冲突先注释掉
" Plug 'hail2u/vim-css3-syntax'
" Python 文件的语法高亮包
Plug 'mitsuhiko/vim-python-combined'
" 该vim软件包为动态样式表语言LESS添加了语法突出显示，缩进和自动完成功能。
" Plug 'groenewege/vim-less'
" TypeScript的语法文件和其他设置。语法文件来自此博客文章。
" 安装文件后，无论何时编辑.ts文件，都会自动启用语法高亮显示和其他设置。
Plug 'leafgarland/typescript-vim'
" 补充一个 Vue 模板的
" Vue.js组件的语法突出显示
Plug 'posva/vim-vue'
" 色彩高亮，例子: #66CCFF
Plug 'gorodinskiy/vim-coloresque'

" ------------------------------ 代码补全插件 ------------------------------ 
"COC 补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" Markdown
" md 时式预览插件
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }

" ------------------------------ Git ------------------------------ 
Plug 'tpope/vim-fugitive'
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }

" ------------------------------ 其他工具 ------------------------------ 
"nerdtree 文件树
Plug 'preservim/nerdtree'
"创建HTML文件模板
Plug 'mattn/emmet-vim'
" 符号匹配
Plug 'junegunn/vim-easy-align'
" 文件搜索工具
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"自动引号/括号
Plug 'jiangmiao/auto-pairs'
" Optional:
Plug 'honza/vim-snippets'

"-----------------------------------
" 自动选中括号内的文本
Plug 'gcmt/wildfire.vim'
" 更改包围的引号以及括号
" 1.使用 cs"' 将'替换成"包裹
" 2.整行包裹 使用 cst"
" 3.还原 ds"
" 等等
" 搭配 gcmt/wildfire.vim 插件使用
Plug 'tpope/vim-surround'
"-----------------------------------

call plug#end()
