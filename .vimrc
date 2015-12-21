"===============================================================
" @yokota Upd.20141119
"===============================================================
" General "{{{
set nocompatible " vi 互換ではなくVim のデフォルト設定にする
set fileencoding=utf8
set encoding=utf8
set backupdir=$HOME/.vimbackup
set nobackup
set nowritebackup
set noswapfile
set history=256
set textwidth=0
set confirm
set hidden " 保存されていないファイルがあるときでも別のファイルを開ける
set autoread " 自動で読み込みなおす
set clipboard=unnamed,unnamedplus
set formatoptions+=mM " 日本語の行の連結時には空白を入力しない
set whichwrap=l,b,s,[,],<,> " カーソルキーで行末／行頭の移動可能に設定
set ambiwidth=double " □や○の文字があってもカーソル位置がずれないようにする
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif
set nrformats=hex
set suffixesadd+=.html,.css,.js,.htm,.mxml
let mapleader = " "
set path+=~/Documents/**
set visualbell
" "}}}

" Search "{{{
set ignorecase
set smartcase
set wrapscan
set number
set incsearch
set hlsearch
" "}}}

" Display "{{{
set number
set showmatch "括弧の入力時にカーソルを対応する括弧の上に一定時間表示させる
set ts=4 sw=4 sts=4
set expandtab
set autoindent " 自動的にインデントする
set title " タイトルを表示
set list
set listchars=tab:^\ ,trail:~
if &t_Co > 2 || has('gui_running')
	syntax on
endif
set ruler
set showcmd
set showmatch
set laststatus=2
set backspace=indent,eol,start
set noexpandtab
set wildmenu wildmode=list,longest,full
set cursorline
augroup cch
autocmd! cch
autocmd WinLeave * set cursorline
autocmd WinEnter, BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" "}}}


" Normal Mode "{{{
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap <C-]> g<C-]> 
nnoremap ; :
nnoremap : ;
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
" アクティブなファイルが含まれるディレクトリを展開する
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <Leader>rs : source ~/.vimrc<CR>
nnoremap <Leader>re : e ~/.vimrc<CR>
nnoremap <leader>rc :silent ! cd ~/.vim/ && git commit ~/.vim/vimrc -v <CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
" edit
nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg :<C-u>edit $MYGVIMRC<CR>
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>
augroup MyAutoCmd
    autocmd!
augroup END

if !has('gui_running') && !(has('win32') || has('win64'))
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
                \if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif
"}}}


" Insert Mode "{{{
inoremap jj <Esc>
inoremap { {}<LEFT>
inoremap <C-v> <Esc>pa
inoremap <C-z> <Esc>ui
inoremap <C-a> <Esc>gg<S-v><S-g>i
inoremap ０ 0
inoremap １ 1
inoremap ２ 2
inoremap ３ 3
inoremap ４ 4
inoremap ５ 5
inoremap ６ 6
inoremap ７ 7
inoremap ８ 8
inoremap ９ 9
inoremap 、 ,
inoremap 。 .
inoremap ％ %
" "}}}


" Plugin "{{{
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'Shougo/vimproc.vim',{'build':{'cygwin': 'make -f make_cygwin.mak'}}
filetype plugin indent on
NeoBundleCheck
" "}}}


" Shell "{{{
NeoBundle 'Shougo/vimshell'
nnoremap <silent> ,vs :VimShell<CR>
nnoremap <silent> ,vsy :VimShellInteractive python<CR>
" "}}}


" Colors "{{{
hi Visual  guifg=#000000 guibg=#FFFFFF gui=none
NeoBundle 'itchyny/landscape.vim'
let g:Powerline_theme = 'landscape'
let g:Powerline_colorscheme = 'landscape'
let g:airline_theme = 'landscape'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'vim-scripts/rdark'
" "}}}


" Filer " {{{
NeoBundle "git://github.com/tsukkee/unite-tag.git"
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'scrooloose/nerdtree' 
nnoremap <F9> :VimFiler
nnoremap <F10> :UniteBookmarkAdd
nnoremap <F12> :Unite bookmark
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
let g:vinarise_enable_auto_detect = 1
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
" "}}}


" Input "{{{
NeoBundle 'Shougo/neocomplcache' "http://github.com/Shougo/neocomplcache.vim
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
if !exists('g:neocomplcache_keyword_patterns')
	    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplcache_omni_patterns')
	  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"
if has('conceal')
	  set conceallevel=2 concealcursor=i
endif
NeoBundle 'violetyk/neocomplete-php.vim'
let g:neocomplete_php_locale = 'ja'
" "}}}

" Exec "{{{
NeoBundle 'thinca/vim-quickrun'
" "}}}

" Status Bar "{{{
NeoBundle 'bling/vim-airline'
let g:airline_enable_branch = 0
let g:airline_section_b = "%t %M"
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
		  \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
		  \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
		  \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 0
" "}}}


" Programing "{{{
NeoBundle 'szw/vim-tags' " ctags (Ex. ctags -R -f .webapps_trunk
set tags=~/cv/.cv_tags
NeoBundle 'taglist.vim' "see varible, method 
let g:tlist_javascript_settings = 'javascript;c:class;m:method;f:function;p:property'
NeoBundle 'mattn/emmet-vim' "html coding -> http://motw.mods.jp/Vim/emmet-vim.html
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
			\ 'lang' : 'ja',
			\ 'html' : {
			\   'filters' : 'html',
			\ },
			\ 'css' : {
			\   'filters' : 'fc',
			\ },
			\ 'php' : {
			\   'extends' : 'html',
			\   'filters' : 'html',
			\ },
			\}
augroup EmmitVim
	autocmd!
	autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END
"NeoBundle 'taichouchou2/surround.vim'
NeoBundle 'vim-scripts/java.vim'
"NeoBundle 'vim-scripts/javacomplete'
"NeoBundle 'vim-scripts/jcommenter.vim'
"NeoBundle 'vim-scripts/java_checkstyle.vim'
" PHP 
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let g:sql_type_default='mysql'
" vim-php-cs-fixer {{{
NeoBundleLazy 'stephpy/vim-php-cs-fixer', {
\    'autoload' : {
\        'filetypes': 'php',},}
let s:hooks = neobundle#get_hooks('vim-php-cs-fixer')
function! s:hooks.on_source(bundle)
    let g:php_cs_fixer_path = '$HOME/.vim/phpCsFixer/php-cs-fixer' " define the path to the php-cs-fixer.phar
    let g:php_cs_fixer_level='all'              " which level ?
    let g:php_cs_fixer_config='default'         " configuration
    let g:php_cs_fixer_php_path='php'           " Path to PHP
    " If you want to define specific fixers:
    "let g:php_cs_fixer_fixers_list = 'linefeed,short_tag,indentation'
    let g:php_cs_fixer_enable_default_mapping=1 " Enable the mapping by default (<leader>pcd)
    let g:php_cs_fixer_dry_run=0                " Call command with dry-run option
    let g:php_cs_fixer_verbose=0                " Return the output of command if 1, else an inline information.
    nnoremap <Leader>php :call PhpCsFixerFixFile()<CR>
endfunction
unlet s:hooks
"}}}

" "}}}

" vim-ref {{{
NeoBundle 'thinca/vim-ref'
let g:ref_cache_dir=$HOME.'/.vim/vim-ref/cache'
let g:ref_phpmanual_path=$HOME.'/.vim/vim-ref/php-chunked-xhtml'
"}}}

" Syntax "{{{
NeoBundle 'hail2u/vim-css3-syntax'
"NeoBundle 'taichouchou2/vim-javascript'
"NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
"NeoBundle 'taichouchou2/html5.vim'
"syn keyword htmlTagName contained article aside audio bb canvas command
"syn keyword htmlTagName contained datalist details dialog embed figure
"syn keyword htmlTagName contained header hgroup keygen mark meter nav output
"syn keyword htmlTagName contained progress time ruby rt rp section time
"syn keyword htmlTagName contained source figcaption
"syn keyword htmlArg contained autofocus autocomplete placeholder min max
"syn keyword htmlArg contained contenteditable contextmenu draggable hidden
"syn keyword htmlArg contained itemprop list sandbox subject spellcheck
"syn keyword htmlArg contained novalidate seamless pattern formtarget
"syn keyword htmlArg contained formaction formenctype formmethod
"syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
"syn keyword htmlArg contained hidden role
"syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
"syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"
" "}}}

" Web tools "{{{
"NeoBundle 'open-brouwser.vim'
"nmap <Leader>o <Plug>(openbrowser-open)
"vmap <Leader>o <Plug>(openbrowser-open)
" "}}}


"Git/SVN "{{{
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'vim-scripts/vcscommand.vim'
" "}}}
call neobundle#end()


filetype on
