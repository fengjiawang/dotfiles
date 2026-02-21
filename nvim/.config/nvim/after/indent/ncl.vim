if exists("g:did_indent")
  finish
endif

let g:did_indent = 1

setlocal indentkeys+==~end,=~do,=~if,=~then,=~else,=~begin

setlocal indentexpr=NCLIndent()

function NCLIndent()
  let lnum = Prevnonblankstat(v:lnum - 1)

  "zero indent from the beginning.
  if lnum ==0
    return 0
  endif

  let ind = indent(lnum)

  let prevline = getline(lnum)
  let prevstat = substitute(prevline, ';.*$', '', '')

  let curline = getline(v:lnum)
  let curstat =  substitute(curline, ';.*$', '', '')

  if prevstat =~? '^\s*\(\(if.*then\)\|do\|else\|begin\)\>'
    let ind = ind + &sw
  endif

  if curstat =~? '^\s*\(else\|\(end\s*\(do\|if\)\)\|end\)\>'
    let ind = ind - &sw
  endif

  if ind < 0
    let ind = 0
  endif

  return ind

endfunction

function Prevnonblankstat(lnum)
  let lnum = prevnonblank(a:lnum)
  while getline(lnum) =~ '^\s*;'
    let lnum = prevnonblank(lnum-1)
  endwhile
  return lnum
endfunction

