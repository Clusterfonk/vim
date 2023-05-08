"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> Pathogen Paths
"    -> EasyEscape
"    -> bufExplorer
"    -> MRU
"    -> YanStack
"    -> CTRL-P
"    -> snipeMate
"    -> Vim grep
"    -> Nerd Tree
"    -> vim-multiple-cursors
"    -> Annotate Strings
"    -> lightline
"    -> indentLine
"    -> Goyo
"    -> Vimwiki
"    -> Ale
"    -> Git gutter
"    -> EditorConfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/plugins/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""""
" => EasyEscape plugin
""""""""""""""""""""""""""""""
let g:easyescape_chars= { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <esc>
cnoremap kj <esc>


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
map <leader>f :MRU<CR>
let MRU_Max_Entries = 400
let g:MRU_File = $XDG_CACHE_HOME .'/mru/mru_hist'


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_cache_dir = $XDG_CACHE_HOME.'/ctrlp'
let g:ctrlp_working_path_mode = '' 

" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' 


""""""""""""""""""""""""""""""
" => snipMate
""""""""""""""""""""""""""""""
let g:snipMate = { 'snippet_version' : 1 }


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
        \ 'colorscheme': 'gruvbox',
        \ 'active': {
        \   'left': [ ['mode', 'paste'],
        \             ['fugitive', 'readonly', 'filename', 'modified'] ],
        \   'right': [ [ 'lineinfo'  ], ['percent']  ]
        \ },
        \ 'component': {
        \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
        \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
        \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
        \ },
        \ 'component_visible_condition': {
        \   'readonly': '(&filetype!="help"&& &readonly)',
        \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
        \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
        \   },
        \   'separator': { 'left': ' ', 'right': ' '  },
        \   'subseparator': { 'left': ' ', 'right': ' '  },
        \   'tabline': {
        \       'left': [['tabs']],
        \       'right': [[]]
        \   },
        \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['¦']

let g:indentLine_fileTypeExclude = ['vim']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/Documents/Notes/',
            \           'path_html': '~/Documents/Notes/'}]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_set_highlights = 1

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

nnoremap <silent> <leader>A :ALEToggle<cr>
nmap <silent> <leader>a <Plug>(ale_next_wrap)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
let g:gitgutter_override_sign_column_highlight = 1

nnoremap <silent> <leader>D :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EditorConfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
