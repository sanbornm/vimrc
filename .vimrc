syntax on
set background=dark
colorscheme solarized
set t_Co=256
set title            " show filename in terminal titlebar

" Font settings for macvim
set gfn=Inconsolata:h14
set anti

" Gui settings
:set mouse=a

" Turn tree file browsing on
"let g:netrw_liststyle = 3

" Indentation settings
set ts=4    " tab space width
set sw=4    " indent width for ai
set et      " convert tabs to space
set ai      " auto indent
" set si      " smart indent

" Search
"set hls         " highlight search result
set ic          " case insensitive
set smartcase   " smart case sensitivity in search
set incsearch   " incremental searching
set infercase   " more clever case search stuff

" WildMenu provides a useful menu for tab completion
set wildmenu
set wildmode=list:longest

" file-specific autocommands
" if has("autocmd")
"     " Ruby indentation settings
"     au BufRead,BufNewFile *.rb,*.erb,*.rhtml,*.haml set sw=2
"     au BufRead,BufNewFile *.rb,*.erb,*.rhtml,*.haml set sts=2
" endif

map ,m :w<cr>     " fast write

inoremap kj <Esc>
map <F2> :FufCoverageFile<cr>

set expandtab


" VimWiki
set nocompatible
filetype plugin on

iabbrev htmlskel <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"<CR><space>"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><CR><html><CR><head><CR><title>Title of the document</title><CR></head><CR>

" Map arrow keys to useful things
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

" Visual block then space to turn two spaces to four
vmap <Space> :s/^\s*/&&/g <cr>

"Use TAB to complete when typing words, else inserts TABs as usual.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

"Start scrolling 5 lines before the end of the file
set scrolloff=5

" Line numbers
"set number

" use Ctrl+L to toggle the line number counting method
function! g:ToggleNuMode()
  if &nu == 1
     set rnu
  else
     set nu
  endif
endfunction
nnoremap <silent><C-L> :call g:ToggleNuMode()<cr>
