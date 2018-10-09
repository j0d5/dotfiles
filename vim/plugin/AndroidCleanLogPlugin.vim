" File: android_log_helper.vim
" Author: Johannes Steudle (tweetjay2 AT icloud DOT com)
" Version: 0.1
" Last Modified: April 06, 2016
"

function! s:CleanNeedlessLogs()
"    :g/\(WindowManager\|ActivityManager\|ContextImpl\|ContextWrapper\|InputDispatcher\)/d
"    :g/\(UploadsManager\|SyncManager\|WifiService\|ConnectivityService\|I\/art:\|Environment\|I\/vCard:\|VCardComposer\)/d
"    :g/\(PeriodicStatsRecorder\|StatsUtilsManager\|DatabaseUtils\|I\/Telecom\|MediaSessionService\|BluetoothPbapVcardManager\|BluetoothPbapObexServer\)/d
    g!/\(exception\|fatal\|myspin\|onReceive\|BluetoothScoManager\|voicecontrol\|AoapConnector\|Connection]\|MySpinProtocol\|VoiceControl\)/d
endfunction

command! -nargs=* -complete=file CleanLogFile
            \ call s:CleanNeedlessLogs()


" clean everything but param

