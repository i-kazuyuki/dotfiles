" フォント設定
set guifontwide=AndaleMono:h16
set guifont=AndaleMono:h16

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" 常にタブを表示
set showtabline=2

" 透明度を変更
set transparency=3
map  gw :macaction selectNextWindow:
map  gW :macaction selectPreviousWindow:

" 入力モードから抜ける時、自動で日本語入力をオフ
set noimdisable

" デフォルト画面サイズ
set lines=45
set columns=130

" IMのON/OFFでカーソルの色を変える
hi CursorIM  guifg=black  guibg=red  gui=NONE  ctermfg=black  ctermbg=white  cterm=reverse

" 背景の透過を段階的に変化させる
nmap + :set transparency+=20<CR>
nmap * :set transparency-=20<CR>

"-------------------------------------------
"" カラースキーム
"-------------------------------------------
let g:hybrid_use_Xresources = 1
colorscheme hybrid
