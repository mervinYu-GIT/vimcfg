" 基础设置
set nocompatible
filetype plugin indent on
syntax enable

" 编码
set encoding=utf-8
set fileencodings=utf-8,gbk,big5

" 缩进
set tabstop=4
set shiftwidth=4
set expandtab        " 使用空格代替Tab
set smarttab
set autoindent
set smartindent

" 界面
set number           " 显示行号
set relativenumber   " 相对行号
set cursorline       " 高亮当前行
set signcolumn=yes   " 显示标记列
set showmatch        " 显示匹配括号
set scrolloff=5      " 滚动时保留5行
set sidescrolloff=5

" 搜索
set incsearch        " 实时搜索
set hlsearch         " 高亮搜索结果
set ignorecase       " 忽略大小写
set smartcase        " 智能大小写

" 其他实用设置
set hidden           " 允许隐藏buffer
set nobackup         " 不备份
set nowritebackup
set noswapfile       " 不生成swap文件
set updatetime=100   " 更新时间(ms)
set timeoutlen=500
set laststatus=2     "linestatus
set noshowmode
"Leader 键设为空格
let mapleader = "\<Space>"

" C/C++特定设置
autocmd FileType c,cpp setlocal cindent
autocmd FileType c,cpp setlocal foldmethod=syntax
autocmd FileType c,cpp setlocal commentstring=//\ %s

call plug#begin('~/.vim/plugged')

" 主题
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'          " 状态栏

" 语法高亮增强
Plug 'octol/vim-cpp-enhanced-highlight'

" 语法检查和格式化
Plug 'dense-analysis/ale'             " 异步语法检查
Plug 'rhysd/vim-clang-format'         " Clang格式化

" 自动补全
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.8'} " 强大补全引擎, vim版本兼容
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" 代码导航和浏览
Plug 'preservim/tagbar'               " 标签栏
Plug 'preservim/nerdtree'             " 文件树
Plug 'majutsushi/tagbar'              " 类/函数列表
Plug 'vim-scripts/a.vim'              " 头文件/源文件切换

" 搜索和查找
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'               " 模糊搜索
Plug 'mileszs/ack.vim'                " 代码搜索

" 代码片段
Plug 'honza/vim-snippets'             " 片段集合
Plug 'SirVer/ultisnips'               " 片段引擎

" 调试支持
Plug 'puremourning/vimspector'        " 调试器

" Git集成
Plug 'tpope/vim-fugitive'             " Git操作
Plug 'airblade/vim-gitgutter'         " Git diff

" 其他实用插件
Plug 'tpope/vim-commentary'           " 快速注释
Plug 'tpope/vim-surround'             " 快速包围
Plug 'jiangmiao/auto-pairs'           " 自动括号
Plug 'Yggdroot/indentLine'            " 缩进指示线
Plug 'ludovicchabant/vim-gutentags'   " 自动生成tags
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'

Plug 'joshdick/onedark.vim'

call plug#end()

" 主题设置
colorscheme onedark
set background=dark

" lightline 配置
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['readonly', 'filename', 'modified'],
      \     ['gutentags', 'cocstatus'],
      \   ],
      \   'right': [
      \     ['lineinfo'],
      \     ['percent'],
      \     ['filetype', 'fileencoding']
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [['filename']],
      \   'right': [['lineinfo'], ['percent']]
      \ },
      \ 'component_function': {
      \   'gutentags': 'gutentags#statusline',
      \   'cocstatus': 'coc#status',
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v',
      \ },
      \ }

" Coc.nvim配置
" 使用Tab进行补全导航
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" 使用回车确认补全
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" 跳转到定义
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" 显示文档
"nnoremap <silent> K :call ShowDocumentation()<CR>

"function! ShowDocumentation()
"  if CocAction('hasProvider', 'hover')
"    call CocActionAsync('doHover')
"  else
"    call feedkeys('K', 'in')
"  endif
"endfunction

" ALE配置
let g:ale_linters = {
\   'c': ['clangd', 'clangtidy'],
\   'cpp': ['clangd', 'clangtidy'],
\   'python': ['flake8']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

let g:ale_c_clangtidy_checks = ['*']
let g:ale_cpp_clangtidy_checks = ['*']

" 保存时自动修复
let g:ale_fix_on_save = 1
" 打开文件时不检查
let g:ale_lint_on_enter = 0
" 修改后延迟检查
let g:ale_lint_delay = 1000

" 自定义快捷键
let mapleader = " "        " 设置leader键为空格

" 窗口导航
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

" 模糊搜索
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>

" 头文件/源文件切换
nnoremap <leader>a :A<CR>

" 格式化代码
nnoremap <leader>F :ClangFormat<CR>

" 快速注释
nmap <leader>/ <Plug>CommentaryLine
xmap <leader>/ <Plug>Commentary

" ============================================
" vim-gutentags 完整配置
" ============================================

" 基础配置
"let g:gutentags_enabled = 1
let g:gutentags_cache_dir = expand('~/.cache/tags')
"let g:gutentags_generate_on_new = 1
"let g:gutentags_generate_on_missing = 1
"let g:gutentags_generate_on_write = 1
"let g:gutentags_background_update = 1
"
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = ['gtags_cscope']
"if executable('ctags')
"	let g:gutentags_modules += ['ctags']
"endif
"if executable('gtags-cscope') && executable('gtags')
"	let g:gutentags_modules += ['gtags_cscope']
"endif
" ============================================
" " GNU Global 配置
" " ============================================
"
" 1. Global 可执行文件路径
let g:gutentags_gtags_executable = 'gtags'
let g:gutentags_gtags_auto_update = 1
let g:gutentags_gtags_dbpath = ''  " 自动检测
" 2. 使用 ctags 作为 parser
"let g:gutentags_gtags_parser = 'ctags'
" 3. Global 参数
let g:gutentags_gtags_options = [
    \ '--explain',
    \ '--incremental',
    \ '--skip-unreadable',
    \ '--skip-symlink=follow'
    \ ]
" 4. 启用 cscope 支持（Global 内置）
let g:gutentags_plus_switch = 1

let g:gutentags_plus_nomap = 0  " 禁用默认映射，使用自定义
"0 or s: Find this symbol
"1 or g: Find this definition
"2 or d: Find functions called by this function
"3 or c: Find functions calling this function
"4 or t: Find this text string
"6 or e: Find this egrep pattern
"7 or f: Find this file
"8 or i: Find files #including this file
"9 or a: Find places where this symbol is assigned a value
" noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
" noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
" noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
" noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
" noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
" noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
" noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

" preview configure
"noremap <M-u> :PreviewScroll -1<cr>
"noremap <M-d> :PreviewScroll +1<cr>
"inoremap <M-u> <c-\><c-o>:PreviewScroll -1<cr>
"inoremap <M-d> <c-\><c-o>:PreviewScroll +1<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

"" 5. 设置 gtags 数据库文件名
"let g:gutentags_gtags_tagfile = 'GTAGS'
" ============================================
" gtags-cscope 配置
" ============================================

" 1. 设置 cscopeprg 为 gtags-cscope
"if executable('gtags-cscope')
"    set cscopeprg=gtags-cscope
"    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
"elseif executable('cscope')
"    set cscopeprg=cscope
"endif

" 2. 启用 cscope 支持
"if has("cscope")
    " 使用 gtags-cscope 或 cscope
"    set cscopetag
"    set csto=0

    " 设置 cscope 标签顺序：先 cscope 数据库，再 tags 文件
"    set cst

    " 显示执行信息
"    set cscopeverbose

    " 如果使用 gtags-cscope，设置 gtags 模式
"    if executable('gtags-cscope')
"        let g:gutentags_gtags_cscope = 1
"    endif
"endif

" 项目根目录识别
"let g:gutentags_project_root = [
"    \ '.root', '.git', '.svn', '.hg',
"    \ 'CMakeLists.txt', 'Makefile', 'compile_commands.json',
"    \ 'configure', 'configure.ac', 'meson.build', 'setup.py'
"    \ ]

let g:gutentags_project_root = ['.root']

" 排除目录
" let g:gutentags_ctags_exclude = [
"     \ '*.git', '*.svn', '*.hg',
"     \ '*/build/*', '*/dist/*', '*/bin/*',
"     \ '*/node_modules/*', '*/bower_components/*',
"     \ '*/__pycache__/*', '*/venv/*',
"     \ '*.so', '*.dll', '*.exe', '*.o', '*.obj',
"     \ '#.dts', '*.dtsi'
"     \ ]

" C/C++ 专用ctags配置
" let g:gutentags_ctags_tagfile = '.tags'
" let g:gutentags_ctags_extra_args = [
    " \ '--fields=+niazS',
    " \ '--extras=+q',
    " \ '--c++-kinds=+p',
    " \ '--c-kinds=+p',
    " \ '--langmap=C++:+.c++.cc.cp.cpp.cxx.h.h++.hh.hp.hpp.hxx.inl.txx.moc',
    " \ '--langmap=C:+.c.h',
    " \ '--regex-C++=/^[[:space:]]*namespace[[:space:]]+([A-Za-z_][A-Za-z0-9_]*)/\1/n,namespace/',
    " \ '--regex-C++=/^[[:space:]]*class[[:space:]]+([A-Za-z_][A-Za-z0-9_]*)/\1/c,class/',
    " \ '--regex-C++=/^[[:space:]]*struct[[:space:]]+([A-Za-z_][A-Za-z0-9_]*)/\1/s,struct/',
    " \ '--regex-C++=/^[[:space:]]*enum[[:space:]]+([A-Za-z_][A-Za-z0-9_]*)/\1/g,enum/',
    " \ '--regex-C++=/^[[:space:]]*([A-Za-z_][A-Za-z0-9_]*)[[:space:]]*\([^)]*\)[[:space:]]*\{/\1/f,function/',
    " \ '--exclude=*/build/*',
    " \ '--exclude=*/test/*',
    " \ '--exclude=ThirdParty'
    " \ ]

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']


" 文件类型
let g:gutentags_filetypes = ['c', 'cpp', 'objc', 'objcpp']

" 性能优化
"let g:gutentags_pause_after_update = 500
"let g:gutentags_define_advanced_commands = 1

" 调试
"let g:gutentags_trace = 0

" 自定义命令
"command! GTUpdate :GutentagsUpdate!
"command! GTClean :call gutentags#cleanup(30)
"command! GTStatus :echo gutentags#statusline()

" 快捷键
"nnoremap <leader>gt :GTUpdate<CR>
"nnoremap <leader>gc :GTClean<CR>
"nnoremap <leader>gs :GTStatus<CR>

" 自动设置tags路径
"autocmd BufEnter * if &ft =~ '^\(c\|cpp\)$' | set tags=./tags,tags,./.tags,.tags | endif
" 如果使用gutentags生成的tags，添加缓存路径
"if exists('g:gutentags_cache_dir')
"    execute 'set tags+=' . g:gutentags_cache_dir . '/*/tags'
"endif

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
" 智能 Quickfix 自动退出
augroup AutoCloseQuickFix
    autocmd!

    " 1. 切换到其他窗口时关闭（如果 Quickfix 不是当前窗口）
"    autocmd BufEnter * if &buftype != 'quickfix' && winnr('$') > 1
"                \ | call CloseQuickFixIfNotCurrent()
"                \ | endif

    " 2. 开始编辑时关闭（进入插入模式）
    autocmd InsertEnter * cclose

    " 3. 离开 Quickfix 窗口时关闭
"    autocmd WinLeave * if &buftype == 'quickfix' | cclose | endif

    " 4. 保存文件时关闭
    autocmd BufWritePost * cclose

    " 1. 当 Quickfix 是最后一个窗口时自动关闭
    autocmd WinEnter * if winnr('$') == 1 && &buftype == 'quickfix' | quit | endif

    " 2. 当 Quickfix 列表为空时自动关闭
    autocmd QuickFixCmdPost * if len(getqflist()) == 0 | cclose | endif
    " 在 Quickfix 窗口中按 Enter 后自动关闭
    autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
    autocmd FileType qf nnoremap <buffer> <Esc> :cclose<CR>
augroup END

function! CloseQuickFixIfNotCurrent()
    let qf_windows = filter(getwininfo(), 'v:val.quickfix')
    if empty(qf_windows)
        return
    endif

    let current_win = winnr()
    for qf_win in qf_windows
        if qf_win.winnr != current_win
            execute qf_win.winnr . 'wincmd c'
        endif
    endfor
endfunction
