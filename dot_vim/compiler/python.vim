" Vim compiler file
" Compiler:		Python     
" Maintainer:   Christoph Herzog <ccf.herzog@gmx.net>
" Last Change:  2002 Nov 9

if exists("current_compiler")
  finish
endif
let current_compiler = "python"

let s:cpo_save = &cpo
set cpo-=C

" setlocal makeprg=python3\ %

"the last line: \%-G%.%# is meant to suppress some
"late error messages that I found could occur e.g.
"with wxPython and that prevent one from using :clast
"to go to the relevant file and line of the traceback.
" setlocal errorformat=
" 	\%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
" 	\%C\ \ \ \ %.%#,
" 	\%+Z%.%#Error\:\ %.%#,
" 	\%A\ \ File\ \"%f\"\\\,\ line\ %l,
" 	\%+C\ \ %.%#,
" 	\%-C%p^,
" 	\%Z%m,
" 	\%-G%.%#

" setlocal errorformat=
"       \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
"       \%*\\sFile\ \"%f\"\\,\ line\ %l,
CompilerSet errorformat=
      \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
      \%*\\sFile\ \"%f\"\\,\ line\ %l,
CompilerSet makeprg="uv run %"
" for `:Dispatch` to find it:
"CompilerSet makeprg=python
"CompilerSet makeprg=python3
"CompilerSet makeprg=uv
"CompilerSet makeprg="uv run"
"CompilerSet makeprg=uv run
"CompilerSet makeprg=py.test
"CompilerSet makeprg=pytest

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim
