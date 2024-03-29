"*****************************************************************************
"" Mappings
"*****************************************************************************
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Comment on <cntr>/
nmap <C-_> <Plug>NERDCommenterToggle<CR>
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
imap <C-_> <esc><Plug>NERDCommenterToggle<CR>a
" COC base maping
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gd <Plug>(coc-definition)
"Copilot
"imap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
" Autoindent
map <leader>L mzgg=G'zmz<CR> <Bar> :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
vmap <leader>L mzgg=G'zmz<CR>gv
imap <leader>L <esc>:call CocAction('runCommand', 'editor.action.organizeImport') <Bar> <esc>mzgg=G'zmz<CR>a
" Escape terminal mode with <ESC>
tnoremap <ESC> <C-\><C-n>
" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" Save
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>a
" fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
"Search <query> in <path>
map <Leader>s <Plug>(easymotion-s2)
map  <Leader>f <Plug>(easymotion-s)
" CtrlP
"map <leader>b <esc>:CtrlPBookmark<CR>
" Bookmark
"nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>b <Plug>BookmarkAnnotate
nmap <Leader>bl <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>kk <Plug>BookmarkMoveUp
nmap <Leader>jj <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine
"Pretty tab
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t  :Tabularize / \zs<CR>
vmap <Leader>t  :Tabularize / \zs<CR>
" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
" fugitive git bindings
nnoremap <leader>g :Git<CR>
nnoremap <leader>gd :Gdiff<Space>
nnoremap <leader>ge :Gedit<Space>
nnoremap <leader>gp :Git push origin <Space>
nnoremap <leader>g- :Silent Git stash<CR>:e<CR>
nnoremap <leader>g+ :Silent Git stash pop<CR>:e<CR>
nnoremap <leader>gsb :Git switch<Space>
"" Open current file on github
nnoremap <Leader>go :.GBrowse<CR>

vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" For local replace
nnoremap gR gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gr gD:%s/<C-R>///gc<left><left><left>
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
"nnoremap <M-Tab> gt
"nnoremap <S-Tab> gT
nnoremap <silent> tn :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
"nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" GO
augroup go
    au!
    au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

    au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
    au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
    au FileType go nmap <Leader>db <Plug>(go-doc-browser)

    au FileType go nmap <leader>r  <Plug>(go-run)
    au FileType go nmap <leader>t  <Plug>(go-test)
    au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
    au FileType go nmap <C-g> :GoDecls<cr>
    au FileType go nmap <leader>dr :GoDeclsDir<cr>
    au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
    au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
    au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
augroup END
