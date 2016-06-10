;==========================================================================;
; Toggle AHK on and off using "numlock" key
;==========================================================================;
$numlock::
; Pause
Suspend
return
;**************************************************************************
; http://ahkscript.org/docs/misc/Remap.htm
; - Remap some of the keys for my laptop
;--------------------------------------------------------------------------
; - The syntax for the built-in remapping feature is: 
;           OriginKey::DestinationKey
; - For a list of keys/mouse buttons, see: 
;           http://ahkscript.org/docs/KeyList.htm
;**************************************************************************
; on my laptop, i use F1-F8 key fairly often, but rarely use F9-F12...

; Swap F9 & F10 key with as "Home/End"
F9::Home
F10::End
Home::F9
End::F10

; Swap F11 & F12 key with as "Page Up/Down"
F11::PgUp  
F12::PgDn
PgUp::F11
PgDn::F12

RAlt::RCtrL