"============================================================================
"File:        tex.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
"
" Modified By Devdatta Akhawe to use checkwriting. http://is.gd/awcheck
if exists("g:loaded_tex_checkwriting_checker")
    finish
endif
let g:loaded_tex_checkwriting_checker= 1

function! SyntaxCheckers_tex_checkwriting_GetLocList() dict
    let makeprg = self.makeprgBuild({'exe': '/home/greg/Programs/Academic-Writing-Check/checkwriting', 'args': '-v' })
    
    let errorformat =  '%E%f:%l: %m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'tex',
    \ 'name': 'checkwriting'})
