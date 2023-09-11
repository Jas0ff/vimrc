"--------主題配置-----------
colorscheme neuromancer

let g:airline_theme='violet'

"--------鍵盤配置-----------
inoremap jj <ESC>
noremap J 5j
noremap K 5k
 	
noremap <C-c> "+y  "剪貼簿複製
noremap <C-x> "+c  "剪貼簿剪下
noremap <C-v> "+p  "剪貼簿貼上



"--------插件管理-----------
set nocompatible
filetype off

"--Vundle--
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tribela/vim-transparent'

call vundle#end()           
filetype plugin indent on

let g:coc_disable_startup_warning = 1
"YCM modify
let g:syntastic_check_on_open = 0 "減緩vim開啟卡頓
let g:syntastic_python_checkers = ['pylint']


"--------顯示配置------------
set termguicolors
let &t_SI = "\e[6 q"	"游標 bar  shape(insert)
let &t_EI = "\e[1 q"   "游標block shape(normal)
set nolist              "把多餘的符號用掉
set hlsearch            "高亮顯示查詢結果
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "顯示檔名：總行數，總的字元數
set ruler "在編輯過程中，在右下角顯示游標位置的狀態行
syntax enable 			"開啟語法高亮
syntax on 			    "開啟語法高亮
set showmatch 			"設定匹配模式，相當於括號匹配
set rnu                 "設定相對行數
set showcmd             "顯示vim命令
set showtabline=0       "隱藏上方tab行
set signcolumn=yes      "顯示gutter

hi CursorLine  guibg=grey ctermbg=grey guifg=black ctermfg=black     "Youcompleteme-Style
hi Pmenu       guibg=grey ctermbg=grey guifg=black ctermfg=black     "Youcompleteme-Style


"--------一般配置------------
"設定檔案的程式碼形式 utf8
set encoding=utf-8

"vim的選單亂碼解決
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set history=500		"保留歷史記錄
set guifont=Monaco:h10	"設定字型為Monaco，大小10
set tabstop=4		"設定tab的跳數
set expandtab

set nofoldenable	"折行關閉
set backspace=2 	"設定退格鍵可用
set nu! 		    "設定顯示行號
set wrap 		    "設定自動換行
set linebreak 		"整詞換行，與自動換行搭配使用
set autochdir 		"自動設定當前目錄為正在編輯的目錄
set hidden 		"自動隱藏沒有儲存的緩衝區，切換buffer時不給出儲存當前buffer的提示
set scrolloff=5 	"在游標接近底端或頂端時，自動下滾或上滾
set updatetime=300	"更新間隔
set autoread 		"設定當檔案在外部被修改，自動更新該檔案
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set mouse=a 		"設定在任何模式下滑鼠都可用
set nobackup 		"設定不生成備份檔案
set noswapfile      "不產生交換檔
set noundofile      "不產繩上一步檔
set incsearch       "增量查詢
set smartindent 	"智慧對齊
set autoindent 		"設定自動對齊
set ai! 			"設定自動縮排
set fdm=indent      "基於縮排摺疊文本


"------coc cammand promt-------------

"Use popmenu like vscode (tab to confirm)
function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#_select_confirm() :
\ coc#expandableOrJumpable() ?
\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\ CheckBackspace() ? "\<TAB>" :
\ coc#refresh()

function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
