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

; Swap F11 & F12 key with as "Home/End"
;F11::PgUp
;F12::End
;Home::F11
;End::F12


; Swap F11 & F12 key with as "Home/End"
F11::PgUp
F12::PgDn
;Home::F11
;End::F12

; Swap F11 & F12 key with as "Page Up/Down"
Pause::Home
PrintScreen::End

; Swap F11 & F12 key with as "Page Up/Down"
;Pause::PgUp
;PrintScreen::PgDn

appskey::rwin