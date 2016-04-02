" mySPIN Vim Syntaxfile
" Language:      mySPIN Logs
" Maintainer:    Johannes Steudle <johannes.steudle@bosch-softtec.com>
" URL:           
" Last Change:   March 2, 2016 10:10

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = "mySPINLog"
endif

" Todo
" syn keyword sdkMain         contained SDKMain


" Comments
" syn region  zshComment      matchgroup=zshComment start='\(^\|\s\)#' end='$' contains=zshTodo

" Strings
" syn match   zshQuoted       '\\.'
" syn region  zshString       matchgroup=zshString start=+"+ skip=+\\"+ end=+"+ contains=zshQuoted
" syn region  zshString       matchgroup=zshString start=+'+ end=+'+
" syn match   zshJobSpec      '%\(\d\+\|?\=\w\+\|[%+-]\)'

" Keywords
syn keyword mySPINComponents SDKMain VoiceControl MySpinProtocol UI Keyboard MySpinNative ScreenCapturing Config EventListener 
syn region  mySPINComponents start='\[' end='\]' oneline contains=mySPINComponents
syn keyword mySPINTags mySPIN MySpin MySpinService MySpinServerSDK MySpinStack MySpinStackV10x MySpinStackV11x MySpinVoiceControlManager BluetoothScoManager VoiceControlStateMessageHandler MySpinServiceClient MySpinHandshakeStack
" syn match   mySPINPackageName 'com\.bosch\.\w+\.\w+(\.\w+)?'
syn match   mySPINPackageName 'com.bosch.\w\+.\w\+\(.[a-z]\+\)\?'

" Types
syn keyword genericTypes    false true
syn match   sdkFlag         '\s[[A-Z_]*]\(\s\|$\)'
syn match   importantSigns  '\s\(=>\|<=\)\s'
syn match   importantSigns  '\s\(->\|<-\)\s'

syn match   time            '\s[0-2][0-9]:[0-2][0-9]:[0-5][0-9].[0-9][0-9][0-9]'

" syn match   zshNumber       '\<-\=\(\d\+#\|0x\=\)\=\d\+\>'
" syn match   zshNumber       '\<-\=\d\+.\d\+\>'

" Substitution
" syn region  zshSubst        matchgroup=zshShellVar transparent start='\$(' end=')'
" syn region  zshSubst        matchgroup=zshShellVar transparent start='\$((' end='))'
" syn region  zshSubst	    matchgroup=zshShellVar start='\${' skip='\\}' end='}' contains=zshSubst

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_zsh_syn_inits")
  if version < 508
    let did_zsh_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink mySPINTags        Todo
  HiLink mySPINComponents  Keyword
  HiLink mySPINPackageName Type
  HiLink genericTypes      Keyword
  HiLink sdkFlag           String
  HiLink importantSigns    Special
  HiLink time              Special

  " HiLink zshComment       Comment
  " HiLink zshJobSpec       Special
  " HiLink zshPrecommand    Special
  " HiLink zshDelimiter     Keyword
  " HiLink zshConditional   Conditional
  " HiLink zshException	  Exception
  " HiLink zshRepeat        Repeat
  " HiLink zshFunction      Function
  " HiLink zshHereDoc	  String
  " HiLink zshRedir         Operator
  " HiLink zshShellVar      Identifier
  " HiLink zshTypes         Type
  " HiLink zshSwitches      Special
  " HiLink zshNumber        Number
  " HiLink zshSubst	  Identifier

  delcommand HiLink
endif

let b:current_syntax = "mySPINLog"

" vim: set sts=2 sw=2:


