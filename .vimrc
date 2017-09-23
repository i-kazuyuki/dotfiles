""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
filetype off

if has('vim_starting')
  " 初回起動時のみruntimepathにneobundleのパスを指定する
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'

  " インストールするプラグインをここに記述
  " ファイル操作をサポート
  NeoBundle 'Shougo/vimfiler'
  " 非同期処理を実現
  NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }
  " ファイルオープンを便利に
  NeoBundle 'Shougo/unite.vim'
  "hybrid
  NeoBundle 'w0ng/vim-hybrid'
  " Unite.vimで最近使ったファイルを表示できるようにする↲
  NeoBundle 'Shougo/neomru.vim'
  " http://blog.remora.cx/2010/12/vim-ref-with-unite.html
  " ファイルをtree表示してくれる
  NeoBundle 'scrooloose/nerdtree'
  " ログファイルを色づけしてくれる
  NeoBundle 'vim-scripts/AnsiEsc.vim'
  " メソッド定義元へのジャンプ
  NeoBundle 'szw/vim-tags'
  " 自動補完
  NeoBundle 'Shougo/neocomplete.vim'
  " ステータスラインの表示内容強化
  NeoBundle 'itchyny/lightline.vim'
  " インデントの可視化
  NeoBundle 'Yggdroot/indentLine'
  " snippets補完
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neosnippet'
  " vim と RuboCop の連携
  NeoBundle 'scrooloose/syntastic'
  " Rails向けのコマンドを提供する
  NeoBundle 'tpope/vim-rails'
  " Ruby向けにendを自動挿入してくれる
  NeoBundle 'tpope/vim-endwise'
  " コメントON/OFFを手軽に実行
  NeoBundle 'tomtom/tcomment_vim'
  " ドキュメント参照
  NeoBundle 'thinca/vim-ref'
  NeoBundle 'yuku-t/vim-ref-ri'
  " Gitで管理しているファイル編集時に差分を表現する記号が左端に表示される
  NeoBundle 'airblade/vim-gitgutter'

       call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"""""""""""""""""""""""""""""""

set number  " 行番号を表示
set tabstop=2  "タブ幅をスペース2つ分にする
set shiftwidth=2  "インデント幅
set softtabstop=2  "タブキー押下時に挿入される文字幅を指定
syntax on	 "シンタックスハイライト
set expandtab	 "tabを半角スペースで挿入
set smartindent  "改行時,自動でインデントを設定
set list  "空白文字の可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%  "可視化した空白文字の表示形式
set virtualedit=block  "文字のないところにカーソル移動できるようにする
set showmatch matchtime=1  "対応する括弧やブレースを表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
set laststatus=2  "ステータス行を常に表示
set showcmd  "ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showmatch  "括弧入力時の対応する括弧を表示
set wildmode=list:longest  "コマンドラインの補完
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set backspace=indent,eol,start " バックスペースの設定
set background=dark             " 暗い背景色に合わせた配色
set clipboard+=unnamed  "クリップボード連携

"""""""""""""""""""""""""""""""
" マウス設定
"""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""
" ペースト設定
"""""""""""""""""""""""""""""""
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
"Ctrl+N => カレントディレクトリ以下のファイル一覧
"Ctrl+Z => 最近使ったファイルの一覧
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""""""""""""""""""""""""""""""
" NERDTreeの設定
""""""""""""""""""""""""""""""
" ショートカットキーの設定
nnoremap <silent><C-e> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" vim-gitgutterの設定
""""""""""""""""""""""""""""""
" ショートカットキーの設定
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

""""""""""""""""""""""""""""""
" neocompleteの設定
""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"""""""""""""""""""""""""""""""
" htmlの閉じタグ補完と括弧の補完
"""""""""""""""""""""""""""""""
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

inoremap {<Enter> {}
inoremap [<Enter> []
inoremap (<Enter> ()
inoremap "<Enter> ""
inoremap '<Enter> ''

"""""""""""""""""""""""""""""""
" neosnippet
"""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"""""""""""""""""""""""""""""""
" rubocopの設定
"""""""""""""""""""""""""""""""
" syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

"""""""""""""""""""""""""""""""
" def...endなども%で移動
"""""""""""""""""""""""""""""""
if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif

" ------------------------------------
" colorscheme
" ------------------------------------
set t_CO=<t_CO>                     " 256色表示
syntax on
colorscheme hybrid

" colorschemeへ上書き
highlight Normal ctermbg=none       " iTerm2での半透明優先
highlight LineNr ctermfg=darkgray " 行番号の色
highlight Comment ctermfg=0        " コメントの色

" カーソル位置の行のハイライト設定
set cursorline
hi clear CursorLine  "行のハイライト色を無色に設定
