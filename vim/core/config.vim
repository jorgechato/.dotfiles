" bootstrap
let g:vim_bootstrap_langs = "go,javascript,python"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim
let g:vim_bootstrap_theme = "github"
let g:vim_bootstrap_frams = "vuejs"

" coc
"autocmd FileType python let b:coc_suggest_disable = 1
"autocmd FileType javascript let b:coc_suggest_disable = 1

" ctrlp
let g:ctrlp_custom_ignore = {
            \ 'dir':  'out$\|\.git$\|\.data$\|bower_components$\|node_modules$\|vendor$\|target',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\DS_Store$',
            \ }

" vim-airline
let g:airline_theme = 'github'
let g:lightline = { 'colorscheme': 'github' }
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif

"*****************************************************************************
"" Custom configs
"*****************************************************************************
"ale
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_linters = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \"python": ['autopep8', 'flake8'],
            \"go": ['golint', 'go vet'],
            \}
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
"let g:ale_fixers = {'python': ['black', 'isort']}

" go
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup completion_preview_close
    autocmd!
    if v:version > 703 || v:version == 703 && has('patch598')
        autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
    endif
augroup END

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


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END


" python
"let g:python3_host_prog = $HOME."/.pyenv/shims/python3"
let g:python3_host_prog = "/usr/bin/python3"

" vim-python
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
                \ formatoptions+=croq softtabstop=4
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
let python_highlight_all = 1

" vuejs
" vim vue
let g:vue_disable_pre_processors=1
" vim vue plugin
let g:vim_vue_plugin_load_full_syntax = 1
