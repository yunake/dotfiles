" Vim compiler file
" Compiler:		Flake8
" Author:       Eugene Yunak <e.yunak@gmail.com>
" Last Change:  2024 Sep 19

if exists("current_compiler")
  finish
endif
let current_compiler = "flake8"

let s:cpo_save = &cpo
set cpo-=C


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

" CompilerSet errorformat=
"       \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
"       \%*\\sFile\ \"%f\"\\,\ line\ %l,
CompilerSet errorformat="%f:%l:%c: %m\,%f:%l: %m,%-G%\\d"
CompilerSet makeprg=flake8\ %
"CompilerSet makeprg=flake8

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim
