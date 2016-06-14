;******************************************************************************;
; (05/20/2015) This part needed for google/wiki lookup script I pulled out
; from http://www.autohotkey.com/board/topic/13404-google-search-on-highlighted-text/
    SendMode Input 
    RegRead, OutputVar, HKEY_CLASSES_ROOT, http\shell\open\command 
    StringReplace, OutputVar, OutputVar," 
    SplitPath, OutputVar,,OutDir,,OutNameNoExt, OutDrive 
    browser=%OutDir%\%OutNameNoExt%.exe 
;******************************************************************************;

;******************************************************************************;
; to auto-load changed ahk script
; http://www.autohotkey.com/board/topic/62801-save-and-reload-ahk-script-via-hotkey/
; (ref2: http://www.autohotkey.com/board/topic/43779-reload-this-script-shortcut-solved/)
;******************************************************************************;
    ;STARTOFSCRIPT
    SetTimer,UPDATEDSCRIPT,1000

    UPDATEDSCRIPT:
    FileGetAttrib,attribs,%A_ScriptFullPath%
    IfInString,attribs,A
    {
    FileSetAttrib,-A,%A_ScriptFullPath%
    SplashTextOn,,,Updated script,
    Sleep,300
    Reload
    }
    Return
    ;ENDOFSCRIPT 

;******************************************************************************;
; (10/17/2014) 
; - Note to self: as now, code structure and documentation looks unholy....
; - fix this in the future when I have time.......
;******************************************************************************;

; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; ; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ;;; Tip: I use ";;; " followed up an empty line to indicate new topic (helps with code-folding)

;---------------------------------------------------------------------------;
; Toggle AHK on and off
$ScrollLock::
; Pause
Suspend
return
;---------------------------------------------------------------------------;
;==============================================================================;
; note: careful with the "lbutton/rbutton" without "tilde" ~sign....may fuck things up
;------------------------------------------------------------------------------;
; see http://ahkscript.org/docs/Hotkeys.htm#Symbols
;==============================================================================;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                      ...               
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;**************************************************************************
; http://ahkscript.org/docs/Hotkeys.htm
; - "Hotkeys are sometimes referred to as shortcut keys"
; - To use more than one modifier with a hotkey, list them consecutively (the order does not matter). 
;--------------------------------------------------------------------------
; Some notable hotkeys (for a full list: http://ahkscript.org/docs/Hotkeys.htm#Symbols)
; # : windows key
; ^ : control key
; ! : alt key
; + : shift key
;**************************************************************************

;;; Launching programs via hotkeys 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                      Launching programs via hotkeys                               
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;**************************************************************************
; - Found this gem from here: 
;       http://www.autohotkey.com/board/topic/7129-run-a-program-or-switch-to-an-already-running-instance/
; - Allows me to swith to program's window if running
; - (08/15/2014) Replace "Run" with this function 
;**************************************************************************
; ===========================================================================
; Run a program or switch to it if already running.
;    Target - Program to run. E.g. Calc.exe or C:\Progs\Bobo.exe
;    WinTitle - Optional title of the window to activate.  Programs like
;       MS Outlook might have multiple windows open (main window and email
;       windows).  This parm allows activating a specific window.
; ===========================================================================
;--------------------------------------------------------------------------
RunOrActivate(Target, WinTitle = "")
{
    ; Get the filename without a path
    SplitPath, Target, TargetNameOnly

    Process, Exist, %TargetNameOnly%
    If ErrorLevel > 0
        PID = %ErrorLevel%
    Else
        Run, %Target%, , , PID

    ; At least one app (Seapine TestTrack wouldn't always become the active
    ; window after using Run), so we always force a window activate.
    ; Activate by title if given, otherwise use PID.
    If WinTitle <> 
    {
        SetTitleMatchMode, 2
        WinWait, %WinTitle%, , 3
        TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)
        WinActivate, %WinTitle%
    }
    Else
    {
        WinWait, ahk_pid %PID%, , 3
        ; TrayTip, , Activating PID %PID% (%TargetNameOnly%) ; <- don't display message on trayicon
        WinActivate, ahk_pid %PID%
    }


    SetTimer, RunOrActivateTrayTipOff, 1500
}

; Turn off the tray tip
RunOrActivateTrayTipOff:
    SetTimer, RunOrActivateTrayTipOff, off
    TrayTip
Return
;--------------------------------------------------------------------------


;**************************************************************************
; - checked for unused hot-keys using hotkey commander http://hkcmdr.anymania.com/
; - found many (win+alt+) combinations are free, so i'll use that
;--------------------------------------------------------------------------
; Ref 
; - http://ahkscript.org/docs/commands/Run.htm
; - http://ahkscript.org/docs/TutorialLaunch.htm
;--------------------------------------------------------------------------
; (08/15/2014)
; - added the capability to launch using the Middle-mouse-button
; - for the syntax about the "~" key, see http://ahkscript.org/docs/Hotkeys.htm#keyup
; - (reminder to myself: we can assign multiple hotkeys with same commands...but don't forget to use "return" at the end)
;**************************************************************************

;------------------------------------------------------------------------------;
; Launch netbeans (10/14/2014 5:08:AM)
; - alt+win+n
; - mbutton + n
;------------------------------------------------------------------------------;
#!n::
MButton & n::
RunOrActivate("C:\Program Files\NetBeans 8.0.1\bin\netbeans64.exe")
return

;--------------------------------------------------------------------------
; alt+win+c -> Console
#!c::RunOrActivate("C:\Users\takanori\Dropbox\programs\Console2\Console.exe")
MButton & c::
if GetKeyState("Shift","P")
    RunOrActivate("control")
else
    RunOrActivate("C:\Users\takanori\Dropbox\programs\Console2\Console.exe")
Return 
;--------------------------------------------------------------------------



;--------------------------------------------------------------------------
; (win+alt+g) -> google chrome
; #!g::RunOrActivate("www.gmail.com")
#!g::RunOrActivate("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
;--------------------------------------------------------------------------
; google highlighted word
; MButton & g::
; {
; Send, ^c
; Sleep 50
; Run, http://www.google.com/search?q=%clipboard%
; Return
; }
;++++++++++++++++++++;
; nah, i rarely use the above...launch gmail instead with "g"
; MButton & g::RunOrActivate("www.gmail.com")
; MButton & g::RunOrActivate("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; alt+win+f -> Foxit-reader ; (reminder to myself: syntax below is to assign multiple hotkeys with same commands)
    #!f:: 
    RunOrActivate("C:\Program Files (x86)\Foxit Software\Foxit Reader\FoxitReader.exe")
    return
    ; Rbutton::Send {AppsKey}

    MButton & f::
    if GetKeyState("Shift","P")
    {
        RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
    }
    else if GetKeyState("Alt","P")
        SendInput {Media_Next}
    else
        RunOrActivate("C:\Program Files (x86)\Foxit Software\Foxit Reader\FoxitReader.exe")
    Return 
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; alt+win+a -> adobe-reader ; (reminder to myself: syntax below is to assign multiple hotkeys with same commands)
    #!a:: 
    ; RunOrActivate("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe Reader XI.lnk")
    ; RunOrActivate("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe Reader XI.lnk")
    RunOrActivate("C:\Anaconda\pythonw.exe")
    return

    MButton & a::
    if GetKeyState("Shift","P")
    {
        SetKeyDelay, -1
        SetMouseDelay, -1
        MouseMove, -1333, 0, 50, R ; the last number here is the speed (0 to 100, 0 the fastest)
    }
    else if GetKeyState("Alt","P")
        SendInput {Media_Prev}
    else
        RunOrActivate("C:\Program Files (x86)\PDF Annotator\PDFAnnotator.exe")
        ; RunOrActivate("C:\Anaconda\pythonw.exe")
        ; RunOrActivate("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe Reader XI.lnk")
    Return 
;--------------------------------------------------------------------------


;--------------------------------------------------------------------------
; launch firefox -- used to be for maximizing window size (10/14/2014 4:54:AM) 
    MButton & space::RunOrActivate("C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
    CapsLock & space::RunOrActivate("C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
    xbutton1 & space::RunOrActivate("C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
;--------------------------------------------------------------------------

; # : windows key
; ^ : control key
; ! : alt key
; + : shift key
;--------------------------------------------------------------------------
; alt+win+v -> vncviewer
    #!v::RunOrActivate("C:\Users\takanori\Dropbox\programs\VNC-Viewer-5.2.3-Windows-64bit.exe")
    #v::RunOrActivate("C:\Users\takanori\Dropbox\programs\VNC-Viewer-5.2.3-Windows-64bit.exe")
    #!+v::RunOrActivate("C:\Users\takanori\Dropbox\programs\VNC-Viewer-5.2.3-Windows-64bit.exe")

    MButton & v::
        RunOrActivate("C:\Program Files (x86)\PicPick\picpick.exe")
    ; if GetKeyState("Shift","P")
        ; RunOrActivate("C:\Users\takanori\Dropbox\programs\VNC-Viewer-5.2.3-Windows-64bit.exe")
    ; else
        ; RunOrActivate("C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe")
        Return
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; alt+win+b -> virtual-box
#!b::
RunOrActivate("C:\Program Files\Oracle\VirtualBox\VirtualBox.exe")
SendInput {F9} ; % turn off hostkey as default when jumping to VB
return

MButton & b::
    RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
;     if GetKeyState("Shift","P")
;         ; RunOrActivate("C:\Program Files (x86)\K-Lite Codec Pack\Media Player Classic\mpc-hc.exe")
;     else
;     {
;         RunOrActivate("C:\Program Files\Oracle\VirtualBox\VirtualBox.exe")
;         SendInput {F9} ; % turn off hostkey as default when jumping to VB
;     }
    return
; ;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; alt+win+s -> sublime text
#!s::RunOrActivate("C:\Program Files\Sublime Text 3\sublime_text.exe")
!^s::RunOrActivate("C:\Program Files\Sublime Text 3\sublime_text.exe")
; MButton & s::RunOrActivate("C:\Program Files\Sublime Text 3\sublime_text.exe")
;--------------------------------------------------------------------------
; C/Program Files (x86)/SumatraPDF/SumatraPDF.exe
; Mbutton + Shift + S -> Sumatra PDF
; MButton + S -> Sublime Text
MButton & s::
if GetKeyState("Shift","P")
    ; RunOrActivate("C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe")
    RunOrActivate("C:\Program Files\Sublime Text 3\sublime_text.exe")
else
{
    RunOrActivate("C:\Program Files\Sublime Text 3\sublime_text.exe")
}
return

; (10/30/2014) changed my mind...use MButton + v for sumatra 
; (here hot-key not based on any mneumonic...just ease of key press here)
MButton & r::
if GetKeyState("Shift","P")
    RunOrActivate("control.exe desk.cpl,Settings,@Settings")
else
    RunOrActivate("C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe")
return

#!r::RunOrActivate("C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe") ; alt+win+r
!^r::RunOrActivate("C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe") ; alt+ctrl+r





;++++++++++++++++++++++++++++++++++++++++++++++++++;
; control panel stuffs
;++++++++++++++++++++++++++++++++++++++++++++++++++;
 ;--------------------------------------------------------------------------
; win+c -> launch control panel (surprisingly, this hotkey was open)
#c::RunOrActivate("control")
; MButton & c::RunOrActivate("control") <- reserve for "console" program
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; alt+win+t -> task manager
#!t::RunOrActivate("C:\Windows\System32\taskmgr.exe")
; MButton & t::RunOrActivate("C:\Windows\System32\taskmgr.exe")
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; alt+win+r -> screen resolution (disabled...i never use this anyways...use 'r' for sumatrapdf (10/30/2014))
#+r::RunOrActivate("control.exe desk.cpl,Settings,@Settings")
#+!r::RunOrActivate("control.exe desk.cpl,Settings,@Settings")
; MButton & r::RunOrActivate("control.exe desk.cpl,Settings,@Settings")
;--------------------------------------------------------------------------


;--------------------------------------------------------------------------
; (08/17/2014) disabled...launch matlab instead
; alt+win+m -> mouse control 
; #!m::RunOrActivate("control /name Microsoft.Mouse")
; MButton & m::RunOrActivate("control /name Microsoft.Mouse")
;--------------------------------------------------------------------------
; Win+Alt+m
#!m::RunOrActivate("C:\Program Files\MATLAB\R2013a\bin\matlab.exe")
; Win+alt+shift+m
#!+m::RunOrActivate("control /name Microsoft.Mouse")

MButton & m::
if GetKeyState("Shift","P")
    RunOrActivate("control /name Microsoft.Mouse")
else
    RunOrActivate("C:\Program Files\MATLAB\R2013a\bin\matlab.exe")
; RunOrActivate("C:\Users\takanori\Desktop\MATLAB.lnk")
return


; Win+a -> display ...crappy mneumonic but it'll do (01/18/2015)
; http://support.microsoft.com/kb/192806
#a::RunOrActivate("control desk.cpl")
#z::RunOrActivate("control /name Microsoft.Mouse")

;--------------------------------------------------------------------------
;**************************************************************************
; Launching programs via hotstrings 
; (since I often forget my key strokes)
;--------------------------------------------------------------------------
; "# + name of the program" will be the syntax
;**************************************************************************
; ::#vnc::
; Run C:\Program Files\RealVNC\VNC Viewer\vncviewer.exe
; return
;;; "Send" keystrokes & mouse clicks)     

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                     "Send" keystrokes & mouse clicks                          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;**************************************************************************
; References
;   http://ahkscript.org/docs/commands/Send.htm
;
; List of keys &mouse-buttons that must be enclosed in {} brackets to "Send"
; (normal key-strokes can be sent by typing in w/o the {} bracket)
;   http://ahkscript.org/docs/commands/Send.htm#Parameters
;   http://ahkscript.org/docs/KeyList.htm
;**************************************************************************


;**************************************************************************
; Creating empty documents
; - http://www.autohotkey.com/board/topic/38347-create-new-folder-in-current-directory-resolved/
;--------------------------------------------------------------------------
; {AppsKey} = Windows App key (invokes the right-click or context menu)
;**************************************************************************
;--------------------------------------------------------------------------
; (alt + n) -> create new .txt file
!n::send {AppsKey}wt 
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; (alt+shift+n) -> create new folder
!+n::send {AppsKey}wf
;--------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Window control (mostly by the middle mouse button...some with caps lock key                                           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;***************************************************************************;
; Jump cursors left/right with the media buttons
;***************************************************************************;
;-----------------------------------------------------------------;
; Use with left/right mouse button click to move window
;-----------------------------------------------------------------;
; Lbutton & A::
; MouseGetPos, xpos, ypos 
; MouseMove, xpos-1500, ypos
; return

; Lbutton & F::
; MouseGetPos, xpos, ypos 
; MouseMove, xpos+1500, ypos
; return

;-----------------------------------------------------------------;
; Jump left/right
;-----------------------------------------------------------------;
; Mbutton & k:: 
; GetKeyState, state, Alt
; if state = D
; SendInput !{Up}
; Return 

; Mbutton & +a::
; MouseGetPos, xpos, ypos 
; MouseMove, xpos-1500, ypos
; return

; Mbutton & +f::
; MouseGetPos, xpos, ypos 
; MouseMove, xpos+1500, ypos
; return


;***************************************************************************;
; Jump cursors to different monitors I have: Mbutton + {1,2,3}
;***************************************************************************;
; Mbutton & 4::
; CoordMode, Mouse, Screen
; MouseMove, -562, 0
; ; SysGet, Mon1, Monitor, 1
; ; MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
; return

; Mbutton & 5::
; CoordMode, Mouse, Screen
; MouseMove, 950, 0
; ; SysGet, Mon2, Monitor, 2
; ; MsgBox, Left: %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%.
; return

; Mbutton & 6::
; CoordMode, Mouse, Screen
; MouseMove, 2600, 0
; ; SysGet, Mon3, Monitor, 3
; ; MsgBox, Left: %Mon3Left% -- Top: %Mon3Top% -- Right: %Mon3Right% -- Bottom %Mon30Bottom%.
; return

;--------------------------------------------------;
; Numpad1::
; SysGet, Mon1, Monitor, 1
; MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
; return

; Numpad2::
; SysGet, Mon1, Monitor, 2
; MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
; return

; Numpad3::
; SysGet, Mon1, Monitor, 3
; MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
; return
;***************************************************************************;


;==============================================================================;
; Window controls (11/12/2014 11:07:PM)
;==============================================================================;  
    ; Minimize current window (capslock+w added (10/14/2014 5:12:AM))
    ; MButton & w::
    Capslock & w::
    #!w::
    WinMinimize, A ; minimize current window
    return

    ; Close current window
    MButton & q::
    Capslock & q::
    #!q::
    WinClose, A ; close current window ("Q"uit for menumonic)
    ; Maximize current window <- not needed...controlled by winsplit
    ; MButton & m::WinMaximize, A ; minimize current window
    return

    ; ; d -> toggle-show desktop
    ; MButton & d::
    ; ; Capslock & d::
    ; ; #!d::
    ; Send #d
    ; return

    ;--------------------------------------------------------------------------;
    ; Window control in sync with Winsplit hotkeys
    ;--------------------------------------------------------------------------;
    ; Mbutton & 1::Send !^a ; -> left 
    Mbutton & 1::Send #{left} ; -> left 
    ; Mbutton & 2::Send !^d ; -> right
    Mbutton & 2::Send #{right} ; -> right
    Mbutton & 3::Send !^n ; -> up
    Mbutton & 4::Send !^x ; -> Down (Ctrl+Alt+x in winsplit)

    ; Mbutton & 1::Send !^1 ; ->  full screen 
    Mbutton & F1::Send !^9 ; -> maximize horizontally
    Mbutton & F2::Send !^0 ; -> maximize vertically

    ;--------------------------------------------------------------------------;
    ; Toggle full screen
    ; http://xahlee.info/mswin/autohotkey_toggle_maximize_window.html
    ;--------------------------------------------------------------------------;
    Mbutton & `::
    ; MButton & space::
    ; #NoTrayIcon
    WinGetPos, winWidth, winHeight, , , A  ; "A" to get the active window's pos.
    if ( winWidth == -8 and winHeight == -8) {
    WinRestore, A
    } else
    {
    WinMaximize, A
    }
    return    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Using Capslock as a prefix key (note: I cannot use capslock together with <+# prefix keys)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ; "tab" by 4 spaces
; Capslock & Tab::Send {Space}{Space}{Space}{Space}

Capslock & Tab::
if GetKeyState("Shift","P")
    Send +{Tab}
else
    Send {Tab}
return

;--------------------------------------------------------------------------
; Windows Control (used in conjunction with winsplit hotkeys)
;--------------------------------------------------------------------------
; maximize to left 
CapsLock & F5::
; CapsLock & j::
CapsLock & 1:: 
Send !^a 
return


; maximize to right
CapsLock & F6::
; CapsLock & `;::
CapsLock & 2:: 
Send !^d 
return

; maximize to top
; CapsLock & F3::
CapsLock & F7::
; CapsLock & k::
CapsLock & 3:: 
Send !^n
return

; maximize to bottom
; CapsLock & F4::
CapsLock & F8:: 
CapsLock & 4:: 
; CapsLock & l::
Send !^x 
return

; toggle maximization state
CapsLock & `::
CapsLock & 5::
; CapsLock & 7::
; CapsLock & space::
WinGetPos, winWidth, winHeight, , , A  ; "A" to get the active window's pos.
if ( winWidth == -8 and winHeight == -8) {
WinRestore, A
} else
{
WinMaximize, A
}
return

; maximize horizontally
; CapsLock & h::
CapsLock & F1::
Send !^9 
return

; maximize vertically
; CapsLock & '::
CapsLock & F2::
Send !^0 
return
;--------------------------------------------------------------------------

;*****************************************************************;
; Cursor control using the capslock-key (gives an "Emacs" like cursor movement)
; - note: a bit tricky to use...must hit Capslock first, then shift+r...cannot hit shift then caplock......
;*****************************************************************;
CapsLock & a::
    if GetKeyState("Shift","P")
        Send +{Home} 
    else if GetKeyState("Alt","P")
        RunOrActivate("C:\Program Files (x86)\PDF Annotator\PDFAnnotator.exe")
        ; RunOrActivate("C:\Anaconda\pythonw.exe")
    else
        Send {Home}
    return

CapsLock & e::
    if GetKeyState("Shift","P")
        Send +{End} 
    else if GetKeyState("alt","P")
        RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
    else
        Send {End}
    return

CapsLock & r::
if GetKeyState("Shift","P")
    Send +^{Right}
else if GetKeyState("Alt","P")
    RunOrActivate("C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe")
else
    Send ^{Right} 
return

CapsLock & l::
    if GetKeyState("Shift","P")
        Send +^{Left} 
    else
        Send ^{Left} 
    return

CapsLock & f::
    if GetKeyState("Shift","P")
        Send +{Right} 
    else if GetKeyState("Alt","P")
        RunOrActivate("C:\Program Files (x86)\Foxit Software\Foxit Reader\FoxitReader.exe")
    else
        Send {Right} 
    return

CapsLock & b::
    if GetKeyState("Shift","P")
        Send +{Left} 
    else if GetKeyState("Alt","P")
        RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
    else
        Send {Left} 
    return

CapsLock & p::
    if GetKeyState("Shift","P")
        Send +{Up} 
    else if GetKeyState("Alt","P")
        Send {WheelUp}    
    else
        Send {Up} 
    return

CapsLock & n::
    if GetKeyState("Shift","P")
        Send +{down} 
    else if GetKeyState("Alt","P")
        Send {WheelDown}
    else
        Send {down} 
    return

CapsLock & -::
    if GetKeyState("Shift","P")
        Send ^+{Home}
    else
        Send ^{Home}
    return

CapsLock & +::
    if GetKeyState("Shift","P")
        Send ^+{End}
    else
        Send ^{End}
    return
CapsLock & m::RunOrActivate("C:\Program Files\MATLAB\R2013a\bin\matlab.exe")

CapsLock & 9::Send {WheelUp}{WheelUp}{WheelUp}{WheelUp}{WheelUp}
CapsLock & 0::Send {WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}

; -- changed these: D overlaps with "d"elete command i'd like to use ---
; CapsLock & u::Send {PgUp}     ; Think of this as page "U"p to remember
; CapsLock & d::Send {PgDn}   ; Think of this as page "D"own to remember
; ;--------------------------------------------------------------------------
;-----------------------------------


; made these require the shiftkey to be held down
CapsLock & [::
if GetKeyState("Shift","P")
    Send +{Up}+{Up}+{Up}+{Up}+{Up}
else 
    Send {Up}{Up}{Up}{Up}{Up}
return

CapsLock & ]::
if GetKeyState("Shift","P")
    Send +{Down}+{Down}+{Down}+{Down}+{Down}
else 
    Send {Down}{Down}{Down}{Down}{Down}
return

CapsLock & c::RunOrActivate("C:\Users\takanori\Dropbox\programs\Console2\Console.exe")


; (ctrl+capslock)/(shift+capslock)+d -> delete entire word forward
CapsLock & d::
if GetKeyState("Ctrl","P")
    Send ^{Delete}
else if GetKeyState("Shift","P")
    Send ^{Delete}
else
    Send {Delete}
return

; (ctrl+capslock)/(shift+capslock) +h -> delete entire word backward
CapsLock & h::
if GetKeyState("Ctrl","P")
    Send ^{Backspace}
else if GetKeyState("Shift","P")
    Send ^{Backspace}
else
    Send {Backspace}
return

; capslock + backspace -> delete entire word backward
CapsLock & Backspace::SendInput ^{Backspace}

; capslock + delete -> delete entire word forward
CapsLock & Delete::SendInput ^{DELETE}

; capslock + space -> ctrl+delete
CapsLock & \::SendInput ^{DELETE}

;+++++++++++++++++++++++++++++++++
; these will be handy for copy&pasting stuffs with capslock highlihgting
; CapsLock & c::SendInput ^c
; CapsLock & x::SendInput ^x
; CapsLock & v::SendInput ^v

; these are handy for switching tabs
CapsLock & PgUp::SendInput ^{PgUp}
CapsLock & PgDn::SendInput ^{PgDn}
;-----------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                     Mouse controls                                                
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;**************************************************************************
; Remapping the "Middle mouse button" (08/14/2014 8:47:PM)
;--------------------------------------------------------------------------
; - since most standard modifier keys "win", "ctrl", "alt", "shift" are 
;   already used as defaults in many programs, I'd like to make use of
;   of the middle-mouse button.
; - Map the middle mouse button to an exotic "windows+ctrl+alt+shift" modifier-key-combo,
;   which probably isn't used as defaults in most softwares, so I can safely
;   assign new HotKeys without conflicts.
;**************************************************************************
; MButton::#&^&!&+

;**************************************************************************
; Enhancement for page/doc navigation (helps with lengthy document/scripts)
;   http://ahkscript.org/docs/Hotkeys.htm#Wheel
;**************************************************************************

;--------------------------------------------------------------------------
; middle mouse button + wheel up/down -> Home/End key
MButton & WheelUp::Send ^{Home}
MButton & WheelDown::Send ^{End}
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; rightClick + wheelp up/down -> triple wheel-up/down (helps navigating long documents)
; - disabled...need a way to debounce this....
; - meh...can't find a way to suppress the AppsKey that pops out afterwards, but i can live with it.
; - argh...donno why but this does something crazy in Sublimetext...
; ~LButton & Wheelup::Send {WheelUp}{WheelUp}{WheelUp}
; ~LButton & WheelDown::Send {WheelDown}{WheelDown}{WheelDown}
; ~RButton & Wheelup::Send {WheelLeft}
; ~RButton & WheelDown::Send {WheelRight}
; ~LButton & Wheelup::
; ~LButton & WheelDown::
; ~RButton & Wheelup::
; ~RButton & WheelDown::
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; left alt + wheelp up/down -> triple wheel-up/down (helps navigating long documents)
<!Wheelup::Send {WheelUp}{WheelUp}{WheelUp}{WheelUp}{WheelUp}{WheelUp}
<!WheelDown::Send {WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}
;--------------------------------------------------------------------------



;--------------------------------------------------------------------------
; (alt+ctrl) + wheelp up/down -> ctrl+home/end 
; <!^Wheelup::Send ^{Home}
; <!^WheelDown::Send ^{End}
; - Note: ctrl added since some navigators such as sublime-text requires the control key to go to top/bottom of script, which is what i expect the home/end key to do.  Plus I've found so far that {home} and {ctrl+home} has the same functionaltiy in many programs (chrome, foxit, etc...) 
;--------------------------------------------------------------------------


;--------------------------------------------------------------------------
; (LeftControl + shift + wheel up/down) -> fast scroll left/right
; <^+Wheelup::Send {WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}
; <^+WheelDown::Send {WheelRight}{WheelRight}{WheelRight}{WheelRight}{WheelRight}{WheelRight}
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; (LeftControl + shift + wheel up/down) -> fast scroll left/right
; Numpad4::Send {WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}
; Numpad6::Send {WheelRight}{WheelRight}{WheelRight}{WheelRight}{WheelRight}{WheelRight}
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; NOTE: Meh, fullly working horizontal scroll not out there...
;       give up on it for now....
;--------------------------------------------------------------------------
; ; rightalt + wheelp up/down -> horitonzal scroll left/right
; RAlt & WheelUp:: ; Scroll left.
; ControlGetFocus, fcontrol, A
; Loop 2  ; <-- Increase this value to scroll faster.
;     SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.
; return

; RAlt & WheelDown::  ; Scroll right.
; ControlGetFocus, fcontrol, A
; Loop 2  ; <-- Increase this value to scroll faster.
;     SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 1 after it is SB_LINERIGHT.
; return
; ; ; (code from http://ahkscript.org/docs/Hotkeys.htm#Wheel)
; ; - argh...above side-scrolling doesn't work on my script editors...works on chrome and pdf-reader...
;--------------------------------------------------------------------------
; script below doesn't do it either (source: http://www.autohotkey.com/board/topic/3443-enhanced-scrollbars-like-in-genius-mouse-any-script/)
; RAlt & WheelUp::  ; Turning the wheel up scrolls to the left.
; ControlGetFocus, FocusedControl, A
; SendMessage, 0x114, 0, 0, %FocusedControl%, A  ; 0x114 is WM_HSCROLL
; return

; RAlt & WheelDown::   ; Turning the wheel down scrolls to the right.
; ControlGetFocus, FocusedControl, A
; SendMessage, 0x114, 1, 0, %FocusedControl%, A  ; 1 vs. 0 causes SB_LINEDOWN vs. UP
; return
;--------------------------------------------------------------------------

;*************************************************************************
; Other "mouse" controls
;**************************************************************************
; Simultaneous Left & Right -> Return key (nopes, this screws up the left click...argh...)
; LButton & RButton::Send {Return}


; XButton1::NumpadAdd
; XButton2::NumpadSub
; ~XButton1 & Wheelup::Send {WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}
; NumpadSub & WheelDown::Send {WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}{WheelLeft}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                         4 & 5th mouse button                                      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;*************************************************************;
; XButton1::Alt  ; 
; meh, for some reason alt doesn't work here....resort to this alternative approach
XButton2 & WheelUp::Send {WheelUp}{WheelUp}{WheelUp}{WheelUp}{WheelUp}
XButton2 & WheelDown::Send {WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}
XButton1 & WheelUp::Send {WheelLeft}
XButton1 & WheelDown::Send {WheelRight}

; for web browsing
XButton1 & Lbutton::Send ^{PgUp} ; <- control+Pg up (move one tab to left)
XButton1 & Rbutton::Send ^{PgDn} ; <- control+Pg Dn (move one tab to right)

XButton1 & Mbutton::SendInput ^{w} ; close window
XButton2 & MButton::Send ^{F5} ; refresh window
~Lbutton & Rbutton::SendInput ^{LButton} ; new window
~Rbutton & Mbutton::SendInput ^{LButton} ; new window

; Update (09/04/2014)
XButton2 & Lbutton::Send !{Left}  ; <- alt+left ("go back")
XButton2 & Rbutton::Send !{Right} ; <- alt+right ("go back")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                          REMAPPMING KEYS                                          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;**************************;
;*************************************************************;
;**************************************************************************
; Useful references
;   http://ahkscript.org/docs/misc/Remap.htm
;   http://ahkscript.org/docs/KeyList.htm
;   http://ahkscript.org/docs/Hotkeys.htm#Wheel
;--------------------------------------------------------------------------
; Remapping multiple keys to one key? (or one key to multiple keys?)
;   http://superuser.com/questions/669524/using-autohotkey-to-remap-keys
;   http://superuser.com/questions/168380/how-to-remap-capslock-to-ctrlaltshift-in-autohotkey
;   http://superuser.com/questions/160881/how-to-combine-three-keys-as-a-hotkey-with-autohotkey?rq=1
;   http://www.autohotkey.com/board/topic/
;***********************************77982-how-to-map-multiple-keys-into-one-key/
;   http://www.autohotkey.com/board/topic/43121-remapping-one-key-to-two-keys/
;**************************************************************************

;**************************************************************************
; Remap keys
;   http://ahkscript.org/docs/misc/Remap.htm
;   http://ahkscript.org/docs/KeyList.htm
;--------------------------------------------------------------------------
; - The syntax for the built-in remapping feature is: 
;           OriginKey::DestinationKey
; - For a list of keys/mouse buttons, see http://ahkscript.org/docs/KeyList.htm
;**************************************************************************
; - Makes the middle button behave like the Left windows key (I only see LWin and RWin on the list in the above link....
; MButton::LWin  



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                         New stuffs (08/17/2014 3:06:PM)                                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-----------------------------------------------------------------;
; Useful for moving windows around left-right on my triple monitor setup
;-----------------------------------------------------------------;
Lbutton & A::
SetKeyDelay, -1
SetMouseDelay, -1
MouseMove, -1800, 0, 0, R
return

Lbutton & F::
SetKeyDelay, -1
SetMouseDelay, -1
MouseMove, 1800, 0, 0, R
return

Lbutton & S::
SetKeyDelay, -1
SetMouseDelay, -1
MouseMove, 0, 500, 0, R
return

Lbutton & E::
SetKeyDelay, -1
SetMouseDelay, -1
MouseMove, 0, -500, 0, R
return


; CapsLock & j::SendInput {Media_Prev}
; CapsLock & k::SendInput {Media_Play_Pause}
; CapsLock & `;::SendInput {Media_Next}

;*********************************************************************;
; change maximization state when dragging stuffs
LButton & 1::Send !^a ; -> left 
LButton & 2::Send !^d ; -> right 
LButton & 3::Send !^n ; -> top
LButton & 4::Send !^x ; -> bottom
LButton & F1::Send !^9 ; -> maximize horizontally
LButton & F2::Send !^0 ; -> maximize vertically
; Toggle full screen
; http://xahlee.info/mswin/autohotkey_toggle_maximize_window.html
Lbutton & `::
LButton & space::
; #NoTrayIcon
WinGetPos, winWidth, winHeight, , , A  ; "A" to get the active window's pos.
if ( winWidth == -8 and winHeight == -8) {
WinRestore, A
} else
{
WinMaximize, A
}
return
;*********************************************************************;

;-----------------------------------------------------------------;
; move cursor by keyboard using the keyboard
;-----------------------------------------------------------------;
; #Persistent ; http://superuser.com/questions/495587/how-can-i-define-a-variable-and-then-use-it-in-multiple-hotkeys
; mouseSpeed=0
; RETURN

; ; (right_shift + right_alt + right ctrl
; >!>+>^a::
;     SetKeyDelay, -1
;     SetMouseDelay, -1
;     MouseMove, -50, 0, 0, R ; the last number here is the speed
; Return 



; ; (right_shift + right_alt + right ctrl
; >!>+>^f::
;     SetKeyDelay, -1
;     SetMouseDelay, -1
;     MouseMove, 50, 0, 0, R ; the last number here is the speed
; Return 




; ; (right_shift + right_alt + right ctrl
; >!>+>^e::
;     SetKeyDelay, -1
;     SetMouseDelay, -1
;     MouseMove, 0, -50, 0, R ; the last number here is the speed
; Return 



; ; (right_shift + right_alt + right ctrl
; >!>+>^s::
;     SetKeyDelay, -1
;     SetMouseDelay, -1
;     MouseMove, 0, 50, 0,R ; the last number here is the speed
; Return 



; ; (right_shift + right_alt + right ctrl
; ; (right_shift + right_alt + right ctrl
; >!>+>^d::RButton ; for right clicking while controlling the cursor with the keyboard


;***************************************************************;
; some void commands i can use in the future with the MButton
;***************************************************************;
; MButton & F5::RunOrActivate("")
; MButton & F6::RunOrActivate("")
; MButton & F7::RunOrActivate("")

; % left mouse click 
; Capslock & Enter::SendInput {LButton}

;*************************************************************************;
;        New stuffs with the "Footkey"! (09/27/2014)
;*************************************************************************;
;=========================================================================;
; - map footkey to all 4 modifier keys (safe to say these won't overlap with other hotkeys)
; {#^!+}
; # : windows key
; ^ : control key
; ! : alt key
; + : shift key
;=========================================================================;
; #^!+

NumpadEnter::Space


;==============================================================================;
; Stuffs from after year 2015
;==============================================================================;
#space:: send #t{tab}{tab}{left}{enter} ; win+space -> pop-up calendar


Capslock & s::RunOrActivate("C:\Program Files\Sublime Text 3\sublime_text.exe")
Capslock & g::RunOrActivate("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
Capslock & v::RunOrActivate("C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe")

; 
Capslock & Lbutton::Send ^{PgUp} ; <- control+Pg up (move one tab to left)
Capslock & Rbutton::Send ^{PgDn} ; <- control+Pg Dn (move one tab to right)

;==============================================================================;
; microsoft office
;==============================================================================;
  ; onenote
  ; !#o::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
  ; !^2::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
  ; !^o::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
  MButton & o::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")

  ; excel
  !#e::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
  !^e::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
  MButton & e::
  ; if GetKeyState("Shift","P")
  ; {
  ;     ; RunOrActivate("C:\Users\takanori\Dropbox\my-work-log.xlsx")
  ;     RunOrActivate("C:\Users\takanori\Dropbox\research_dropbox\word-notes\spread-sheets\lit-review-matrix.xlsx")
  ; }    
  ; else
      RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
    Return

  ; powerpoint
  !#p:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
  !^p:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
  ; !^3:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
  MButton & p::
  if GetKeyState("Shift","P")
  {
      RunOrActivate("C:\Program Files (x86)\PicPick\picpick.exe")
  }    
  else
      RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
  Return
  #!+p:: RunOrActivate("C:\Program Files (x86)\PicPick\picpick.exe")

  ; word
  ; MButton & z:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\\WINWORD.EXE")
  ; !#1:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\WINWORD.EXE")
  !#z:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\WINWORD.EXE")
  ; !^1:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\WINWORD.EXE")
  !^z:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\WINWORD.EXE")
;--------------------------------------------------------------------------



MButton & down::SendInput {Media_Play_Pause}
#!down::SendInput {Media_Play_Pause}

MButton & right::SendInput {Media_Next}
#!right::SendInput {Media_Next}

MButton & left::SendInput {Media_Prev}
#!left::SendInput {Media_Prev}

MButton & up::SendInput {Volume_mute}
#!up::SendInput {Volume_mute}

MButton & F10::SendInput {Volume_mute}
MButton & F11::SendInput {Volume_down}
MButton & F12::SendInput {Volume_up}

Capslock & left::
    if GetKeyState("Shift","P")
        SendInput {Media_Prev}
    return

Capslock & right::
    if GetKeyState("Shift","P")
        SendInput {Media_Next}
    return

Capslock & Down::
    if GetKeyState("Shift","P")
        SendInput {Media_Play_Pause}
    else
        SendInput {WheelDown}
    return
Capslock & Up::
    if GetKeyState("Shift","P")
        SendInput {Volume_mute}
    else
        SendInput {WheelUp}
    return
    
;------------------------------------------------------------------------------;
; Launch windows explorer
; MButton & h::RunOrActivate("explorer")
MButton & h::
#!h::
; RunOrActivate("explorer")
; RunOrActivate("C:\Users\takanori\Dropbox\research_dropbox\word-notes") ; H for "h"ome....i guess (pretty crappy mneumonic here...)
RunOrActivate("C:\Users\takanori\Dropbox\2015") 
return 

;==============================================================================;
; media player using xbuttons
;==============================================================================;
XButton2 & f::SendInput {Media_Next}
XButton2 & a::SendInput {Media_Prev}
XButton2 & space:: SendInput {Media_Play_Pause}
XButton2 & e:: SendInput {Volume_up}
XButton2 & s:: SendInput {Volume_down}
XButton2 & x:: SendInput {Volume_mute}


;==============================================================================;
; (05/20/2015)
; Search highlighted words on google or wikipedia
; From http://www.autohotkey.com/board/topic/13404-google-search-on-highlighted-text/
;==============================================================================;

MButton & g:: 
if GetKeyState("Shift","P")
    { 
       BlockInput, on 
       prevClipboard = %clipboard% 
       clipboard = 
       Send, ^c 
       BlockInput, off 
       ClipWait, 2 
       if ErrorLevel = 0 
       { 
          searchQuery=%clipboard% 
          GoSub, GoogleSearch 
       } 
       clipboard = %prevClipboard% 
       return 
    } 
else
    RunOrActivate("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
return

MButton & w::
if GetKeyState("Shift","P")
    { 
       BlockInput, on 
       prevClipboard = %clipboard% 
       clipboard = 
       Send, ^c 
       BlockInput, off 
       ClipWait, 2 
       if ErrorLevel = 0 
       { 
          searchQuery=%clipboard% 
          GoSub, WikiSearch 
       } 
       clipboard = %prevClipboard% 
       return 
    } 
else
    WinMinimize, A ; minimize current window
return

MButton & d::
if GetKeyState("Shift","P")
    { 
       BlockInput, on 
       prevClipboard = %clipboard% 
       clipboard = 
       Send, ^c 
       BlockInput, off 
       ClipWait, 2 
       if ErrorLevel = 0 
       { 
          searchQuery=%clipboard% 
          GoSub, MedSearch 
       } 
       clipboard = %prevClipboard% 
       return 
    }
else if GetKeyState("Alt","P")
    SendInput {Media_Play_Pause} 
else
    Send #d ; show desktop (win+d)
return

; T for translate
MButton & t::
if GetKeyState("Shift","P")
    { 
       BlockInput, on 
       prevClipboard = %clipboard% 
       clipboard = 
       Send, ^c 
       BlockInput, off 
       ClipWait, 2 
       if ErrorLevel = 0 
       { 
          searchQuery=%clipboard% 
          GoSub, JapaSearch 
       } 
       clipboard = %prevClipboard% 
       return 
    } 
else
    RunOrActivate("C:\Windows\System32\taskmgr.exe") ; task manager
return

; wiki-search
XButton2 & w::
{ 
   BlockInput, on 
   prevClipboard = %clipboard% 
   clipboard = 
   Send, ^c 
   BlockInput, off 
   ClipWait, 2 
   if ErrorLevel = 0 
   { 
      searchQuery=%clipboard% 
      GoSub, WikiSearch 
   } 
   clipboard = %prevClipboard% 
   return 
}

; wiki-dict
XButton1 & j::
{ 
   BlockInput, on 
   prevClipboard = %clipboard% 
   clipboard = 
   Send, ^c 
   BlockInput, off 
   ClipWait, 2 
   if ErrorLevel = 0 
   { 
      searchQuery=%clipboard% 
      GoSub, WikiJapan 
   } 
   clipboard = %prevClipboard% 
   return 
}

; med-dict
XButton1 & z::
if GetKeyState("Shift","P")
{
   BlockInput, on 
   prevClipboard = %clipboard% 
   clipboard = 
   Send, ^c 
   BlockInput, off 
   ClipWait, 2 
   if ErrorLevel = 0 
   { 
      searchQuery=%clipboard% 
      GoSub, MedSearch 
   } 
   clipboard = %prevClipboard% 
   return 
}
else
    ;RunOrActivate("C:\Program Files\MATLAB\R2013a\bin\matlab.exe")
    RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\\WINWORD.EXE")
return

; dict
; XButton2 & d::
; { 
;    BlockInput, on 
;    prevClipboard = %clipboard% 
;    clipboard = 
;    Send, ^c 
;    BlockInput, off 
;    ClipWait, 2 
;    if ErrorLevel = 0 
;    { 
;       searchQuery=%clipboard% 
;       GoSub, DictSearch 
;    } 
;    clipboard = %prevClipboard% 
;    return 
; }

; thesaurus
XButton2 & t::
{ 
   BlockInput, on 
   prevClipboard = %clipboard% 
   clipboard = 
   Send, ^c 
   BlockInput, off 
   ClipWait, 2 
   if ErrorLevel = 0 
   { 
      searchQuery=%clipboard% 
      GoSub, ThesSearch 
   } 
   clipboard = %prevClipboard% 
   return 
}

;******************************************************************************;
; search function definitinos
;******************************************************************************;
GoogleOpen: 
   ; StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
   Loop 
   { 
      noExtraSpaces=1 
      StringLeft, leftMost, searchQuery, 1 
      IfInString, leftMost, %A_Space% 
      { 
         StringTrimLeft, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      StringRight, rightMost, searchQuery, 1 
      IfInString, rightMost, %A_Space% 
      { 
         StringTrimRight, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      If (noExtraSpaces=1) 
         break 
   } 
   ; StringReplace, searchQuery, searchQuery, \, `%5C, All 
   ; StringReplace, searchQuery, searchQuery, %A_Space%, +, All 
   StringReplace, searchQuery, searchQuery, `%, `%25, All 
   IfInString, searchQuery, . 
   { 
      IfInString, searchQuery, + 
         Run, %browser% %searchQuery% 
      else 
         Run, %browser% %searchQuery% 
   } 
   else 
      Run, %browser% %searchQuery% 
return

GoogleSearch: 
   StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
   Loop 
   { 
      noExtraSpaces=1 
      StringLeft, leftMost, searchQuery, 1 
      IfInString, leftMost, %A_Space% 
      { 
         StringTrimLeft, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      StringRight, rightMost, searchQuery, 1 
      IfInString, rightMost, %A_Space% 
      { 
         StringTrimRight, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      If (noExtraSpaces=1) 
         break 
   } 
   StringReplace, searchQuery, searchQuery, \, `%5C, All 
   StringReplace, searchQuery, searchQuery, %A_Space%, +, All 
   StringReplace, searchQuery, searchQuery, `%, `%25, All 
   IfInString, searchQuery, . 
   { 
      IfInString, searchQuery, + 
         Run, %browser% http://www.google.com/search?hl=en&q=%searchQuery% 
      else 
         Run, %browser% %searchQuery% 
   } 
   else 
      Run, %browser% http://www.google.com/search?hl=en&q=%searchQuery% 
return

WikiSearch: 
   StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
   Loop 
   { 
      noExtraSpaces=1 
      StringLeft, leftMost, searchQuery, 1 
      IfInString, leftMost, %A_Space% 
      { 
         StringTrimLeft, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      StringRight, rightMost, searchQuery, 1 
      IfInString, rightMost, %A_Space% 
      { 
         StringTrimRight, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      If (noExtraSpaces=1) 
         break 
   } 
   StringReplace, searchQuery, searchQuery, \, `%5C, All 
   StringReplace, searchQuery, searchQuery, %A_Space%, _, All 
   StringReplace, searchQuery, searchQuery, `%, `%25, All 
   IfInString, searchQuery, . 
   { 
      IfInString, searchQuery, + 
         Run, %browser% http://en.wikipedia.org/wiki/%searchQuery% 
      else 
         Run, %browser% %searchQuery% 
   } 
   else 
      Run, %browser% en.wikipedia.org/wiki/%searchQuery% 
return

WikiJapan: 
   StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
   Loop 
   { 
      noExtraSpaces=1 
      StringLeft, leftMost, searchQuery, 1 
      IfInString, leftMost, %A_Space% 
      { 
         StringTrimLeft, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      StringRight, rightMost, searchQuery, 1 
      IfInString, rightMost, %A_Space% 
      { 
         StringTrimRight, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      If (noExtraSpaces=1) 
         break 
   } 
   StringReplace, searchQuery, searchQuery, \, `%5C, All 
   StringReplace, searchQuery, searchQuery, %A_Space%, _, All 
   StringReplace, searchQuery, searchQuery, `%, `%25, All 
   IfInString, searchQuery, . 
   { 
      IfInString, searchQuery, + 
         Run, %browser% http://ja.wikipedia.org/wiki/%searchQuery% 
      else 
         Run, %browser% %searchQuery% 
   } 
   else 
      Run, %browser% ja.wikipedia.org/wiki/%searchQuery% 
return

MedSearch: 
   StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
   Loop 
   { 
      noExtraSpaces=1 
      StringLeft, leftMost, searchQuery, 1 
      IfInString, leftMost, %A_Space% 
      { 
         StringTrimLeft, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      StringRight, rightMost, searchQuery, 1 
      IfInString, rightMost, %A_Space% 
      { 
         StringTrimRight, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      If (noExtraSpaces=1) 
         break 
   } 
   StringReplace, searchQuery, searchQuery, \, `%5C, All 
   StringReplace, searchQuery, searchQuery, %A_Space%, +, All 
   StringReplace, searchQuery, searchQuery, `%, `%25, All 
   IfInString, searchQuery, . 
   { 
      IfInString, searchQuery, + 
         Run, %browser% http://medical-dictionary.thefreedictionary.com/%searchQuery% 
      else 
         Run, %browser% %searchQuery% 
   } 
   else 
      Run, %browser% medical-dictionary.thefreedictionary.com/%searchQuery% 
return

JapaSearch: 
   StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
   Loop 
   { 
      noExtraSpaces=1 
      StringLeft, leftMost, searchQuery, 1 
      IfInString, leftMost, %A_Space% 
      { 
         StringTrimLeft, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      StringRight, rightMost, searchQuery, 1 
      IfInString, rightMost, %A_Space% 
      { 
         StringTrimRight, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      If (noExtraSpaces=1) 
         break 
   } 
   StringReplace, searchQuery, searchQuery, \, `%5C, All 
   StringReplace, searchQuery, searchQuery, %A_Space%, +, All 
   StringReplace, searchQuery, searchQuery, `%, `%25, All 
   IfInString, searchQuery, . 
   { 
      IfInString, searchQuery, + 
         Run, %browser% http://dic.search.yahoo.co.jp/search?ei=UTF-8&fr=top_ga1_sa&p=%searchQuery% 
      else 
         Run, %browser% %searchQuery% 
   } 
   else 
      Run, %browser% dic.search.yahoo.co.jp/search?ei=UTF-8&fr=top_ga1_sa&p=%searchQuery% 
return

DictSearch: 
   StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
   Loop 
   { 
      noExtraSpaces=1 
      StringLeft, leftMost, searchQuery, 1 
      IfInString, leftMost, %A_Space% 
      { 
         StringTrimLeft, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      StringRight, rightMost, searchQuery, 1 
      IfInString, rightMost, %A_Space% 
      { 
         StringTrimRight, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      If (noExtraSpaces=1) 
         break 
   } 
   StringReplace, searchQuery, searchQuery, \, `%5C, All 
   StringReplace, searchQuery, searchQuery, %A_Space%, +, All 
   StringReplace, searchQuery, searchQuery, `%, `%25, All 
   IfInString, searchQuery, . 
   { 
      IfInString, searchQuery, + 
         Run, %browser% http://www.thefreedictionary.com/%searchQuery% 
      else 
         Run, %browser% %searchQuery% 
   } 
   else 
      Run, %browser% www.thefreedictionary.com/%searchQuery% 
return

ThesSearch: 
   StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
   Loop 
   { 
      noExtraSpaces=1 
      StringLeft, leftMost, searchQuery, 1 
      IfInString, leftMost, %A_Space% 
      { 
         StringTrimLeft, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      StringRight, rightMost, searchQuery, 1 
      IfInString, rightMost, %A_Space% 
      { 
         StringTrimRight, searchQuery, searchQuery, 1 
         noExtraSpaces=0 
      } 
      If (noExtraSpaces=1) 
         break 
   } 
   StringReplace, searchQuery, searchQuery, \, `%5C, All 
   StringReplace, searchQuery, searchQuery, %A_Space%, +, All 
   StringReplace, searchQuery, searchQuery, `%, `%25, All 
   IfInString, searchQuery, . 
   { 
      IfInString, searchQuery, + 
         Run, %browser% http://www.thesaurus.com/browse/%searchQuery% 
      else 
         Run, %browser% %searchQuery% 
   } 
   else 
      Run, %browser% www.thesaurus.com/browse/%searchQuery% 
return






; undo with mouse
XButton1 & XButton2:: 
{ 
   BlockInput, on 
   prevClipboard = %clipboard% 
   clipboard = 
   Send, ^c 
   BlockInput, off 
   ClipWait, 2 
   if ErrorLevel = 0 
   { 
      searchQuery=%clipboard% 
      GoSub, GoogleSearch 
   } 
   clipboard = %prevClipboard% 
   return 
}
   
XButton2 & b:: SendInput {Backspace}
; XButton1 & space:: SendInput {Backspace}
XButton2 & r:: SendInput {return}
XButton1 & r:: SendInput {return}
XButton2 & d:: ; delete
    if GetKeyState("Shift","P")
    { 
       BlockInput, on 
       prevClipboard = %clipboard% 
       clipboard = 
       Send, ^c 
       BlockInput, off 
       ClipWait, 2 
       if ErrorLevel = 0 
       { 
          searchQuery=%clipboard% 
          GoSub, MedSearch 
       } 
       clipboard = %prevClipboard% 
       return 
    }
    else
        SendInput {Del}
    return
; XButton1 & e::RunOrActivate("C:\Anaconda\pythonw.exe")
; XButton1 & e::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
; XButton1 & e::SendInput {Backspace}
XButton1 & e::RunOrActivate("C:\Program Files (x86)\Evernote\Evernote\Evernote.exe")
; XButton1 & e::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
XButton1 & d:: 
    if GetKeyState("shift","P")
    { 
       BlockInput, on 
       prevClipboard = %clipboard% 
       clipboard = 
       Send, ^c 
       BlockInput, off 
       ClipWait, 2 
       if ErrorLevel = 0 
       { 
          searchQuery=%clipboard% 
          GoSub, DictSearch 
       } 
       clipboard = %prevClipboard% 
       return 
    }
    else if GetKeyState("alt","P")
        SendInput {Backspace}
    else
        SendInput {Delete}
    return
XButton1 & c::RunOrActivate("C:\Users\takanori\Dropbox\programs\Console2\Console.exe")    
XButton1 & m::RunOrActivate("C:\Program Files\MATLAB\R2013a\bin\matlab.exe")
XButton1 & s::RunOrActivate("C:\Program Files\Sublime Text 3\sublime_text.exe")
XButton1 & b::SendInput {Backspace}
XButton1 & x::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
XButton1 & n::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
XButton1 & v::RunOrActivate("C:\Program Files (x86)\PicPick\picpick.exe")
XButton1 & f::RunOrActivate("C:\Program Files (x86)\Foxit Software\Foxit Reader\FoxitReader.exe")
XButton1 & a::RunOrActivate("C:\Users\takanori\Anaconda2\pythonw.exe")
; XButton1 & t::RunOrActivate("C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe")
XButton1 & q::WinClose, A ; close current window ("Q"uit for menumonic)
XButton1 & w::
    if GetKeyState("Shift","P")
    { 
       BlockInput, on 
       prevClipboard = %clipboard% 
       clipboard = 
       Send, ^c 
       BlockInput, off 
       ClipWait, 2 
       if ErrorLevel = 0 
       { 
          searchQuery=%clipboard% 
          GoSub, WikiSearch 
       } 
       clipboard = %prevClipboard% 
       return 
    }
    else
        WinMinimize, A ; minimize current window
    return
XButton1 & g:: ; google-search or google
    if GetKeyState("Shift","P") 
        { ; google search
           BlockInput, on 
           prevClipboard = %clipboard% 
           clipboard = 
           Send, ^c 
           BlockInput, off 
           ClipWait, 2 
           if ErrorLevel = 0 
           { 
              searchQuery=%clipboard% 
              GoSub, GoogleSearch 
           } 
           clipboard = %prevClipboard% 
           return 
        } 
    else
        RunOrActivate("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
    return

XButton1 & t:: ; japanese translation or itunes
    if GetKeyState("Shift","P")
    { ; japanese translation
       BlockInput, on 
       prevClipboard = %clipboard% 
       clipboard = 
       Send, ^c 
       BlockInput, off 
       ClipWait, 2 
       if ErrorLevel = 0 
       { 
          searchQuery=%clipboard% 
          GoSub, JapaSearch 
       } 
       clipboard = %prevClipboard% 
       return 
    }
    else
    {
        RunOrActivate("C:\Program Files (x86)\iTunes\iTunes.exe") ; for desktop
        ; RunOrActivate("C:\Program Files\iTunes\iTunes.exe") ; for surface
    }
    return


#!i:: ; itunes
    MButton & i::    
    RunOrActivate("C:\Program Files (x86)\iTunes\iTunes.exe") for desktop
    ; RunOrActivate("C:\Program Files\iTunes\iTunes.exe") ; for surface
    return

;==============================================================================;
; full screen stuffs with xbutton1
;==============================================================================;
XButton1 & 1::SendInput #{left}
XButton1 & 2::SendInput #{right} 
XButton1 & 3::SendInput !^n ; -> top half
XButton1 & 4::SendInput !^x ; -> bottom half (Ctrl+Alt+x in winsplit)
XButton1 & f1::SendInput !^9 ; -> maximize horizontally
XButton1 & f2::SendInput !^0; -> maximize vertically
XButton1 & `:: ; toggle fullscreen (http://www.autohotkey.com/board/topic/16755-help-toggle-maximizerestore-with-same-hotkey/)
    WinGet MX, MinMax, A
    If MX
        WinRestore A
    Else WinMaximize A
    return

;XButton1 & x::RunOrActivate("C:\Anaconda\pythonw.exe")
MButton & x::RunOrActivate("C:\Anaconda\pythonw.exe")
MButton & z::RunOrActivate("C:\Program Files\MATLAB\R2013a\bin\matlab.exe")
; XButton1 & a::RunOrActivate("C:\Program Files (x86)\PDF Annotator\PDFAnnotator.exe")