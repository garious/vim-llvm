" Vim syntax file
" Language:	llvm
" Maintainer:	Nick Hildenbrandt <hldnbrnd@uiuc.edu>
" Updated:	2002-10-07

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn keyword llvmType void bool sbyte ubyte
syn keyword llvmType short ushort int uint
syn keyword llvmType long ulong float double
syn keyword llvmType type label opaque

syn keyword llvmStatement add sub mul div rem
syn keyword llvmStatement and or xor
syn keyword llvmStatement setne seteq setlt setgt setle setge

syn keyword llvmStatement phi call cast shl shr
syn keyword llvmStatement ret br switch invoke
syn keyword llvmStatement malloc alloca free load store getelementptr

syn keyword llvmStatement begin end true false
syn keyword llvmStatement declare global constant const
syn keyword llvmStatement internal unititialized external implementation
syn keyword llvmStatement null to except not

"syn match llvmFunction /%[a-zA-Z\$._\-][a-zA-Z\$._\-0-9]*/
syn match llvmNumber /\<\d\+\>/
syn match llvmNumber /\<\d\+\.\d*\>/

syn match llvmComment /;.*$/
syn region llvmString start=/"/ skip=/\\"/ end=/"/
syn match llvmLabel /[\-a-zA-Z\$._0-9]*:/


if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink llvmType Type
  HiLink llvmStatement Statement
  HiLink llvmNumber Number
  HiLink llvmComment Comment
  HiLink llvmString String
  HiLink llvmLabel Label

  delcommand HiLink
endif
 
let b:current_syntax = "llvm"
