;******************************************************************************;
; My hotstrings....turned out becoming my snippet/template repository
; (the somewhat awkard looking indentation is for code-folding in Sublime Text)
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

;==============================================================================;
; (10/22/2014)
; - decided to adopt the "copy-and-paste" approach to print out my hotstrings.
;   this avoids the key-delay and also avoids unintended triggering of hotkeys
;==============================================================================;
PasteString(String)
    {
        ;==========================================================================;
        ; ref: http://www.autohotkey.com/board/topic/98780-how-to-speed-up-hotstrings/
        ;==========================================================================;
        ; save clipboard contents
        OldClip := ClipboardAll
        ; Set clipboard
        Clipboard = %String%
        ; Wait for clipboard contents to update.
        ClipWait
        ; Send paste. ("^"=ctrl, "+"=shift)
        SendInput,  ^v
        Sleep, 100 ; Give some time for the text to be pasted 
                  ; (this needs to be carefully assigned....
                  ; on one hand,  i want this small for quickness, but if it's
                  ; too small, it won't trigger on certain places (eg: github)
        ; Restore the clipboard
        Clipboard := OldClip
    }              

; ctrl+shift+v (don't use in github...this hotkey is already reserved)
PasteVString(String)
    {
        ;==========================================================================;
        ; ref: http://www.autohotkey.com/board/topic/98780-how-to-speed-up-hotstrings/
        ;==========================================================================;
        ; save clipboard contents
        OldClip := ClipboardAll
        ; Set clipboard
        Clipboard = %String%
        ; Wait for clipboard contents to update.
        ClipWait
        ; Send paste. ("^"=ctrl, "+"=shift)
        SendInput, ^+v
        Sleep, 500 ; Give some time for the text to be pasted 
                  ; (this needs to be carefully assigned....
                  ; on one hand,  i want this small for quickness, but if it's
                  ; too small, it won't trigger on certain places (eg: github)
        ; Restore the clipboard
        Clipboard := OldClip
    }   

;******************************************************************************;
;                      Setup HotString Configuration                           ;
;******************************************************************************;
    ;==========================================================================;
    ; Configure triggering options
    ; - http://www.autohotkey.com/docs/commands/_Hotstring.htm
    ; - http://www.autohotkey.com/docs/Hotstrings.htm
    ; - This tutorial has nice summary/lookup table: http://irisclasson.com/2015/02/19/autohotkey-hotstrings-and-sending-input/
    ;--------------------------------------------------------------------------;
    ; Default: #Hotstring EndChars -()[]{}:;'"/\,.?!`n `t  
    ;(note that `n is Enter, `t is Tab, and there is a plain space between `n and `t)
    ;--------------------------------------------------------------------------;    
    ;==========================================================================;
    ; setup hot-strings to only fire on the "\" key (to avoid overlap with Sublime Text)
    #Hotstring EndChars `t `n 
    ; #Hotstring EndChars -()[]{}:;'"/\,.?!`n `t


    ;==========================================================================;
    ; Configure global variables here
    ;------------------------------------------------------------------------------;
    ; http://superuser.com/questions/495587/how-can-i-define-a-variable-and-then-use-it-in-multiple-hotkeys
    ;==========================================================================;
    #Persistent 

    ;~~~~~~~~~~~~~~~~~~~~~
    ;Global Variables (all must be defined here...which stinks but oh well)
    ; (can't include a number in variable name...the documentation says you can, 
    ;  but this messes up the function call...sigh)
    ;~~~~~~~~~~~~~~~~~~~~~
    ; the letters at the end is entirely arbitrary
    ; global numRep_a:=78
    ; global numRep_aa:=76
    ; global numRep_b:=74
    ; global numRep_c:=71

    ;==========================================================================;
    ; "SetKeyDelay" must be setup so there will be no delay while looping over keystrokes
    ; http://www.autohotkey.com/docs/commands/SetKeyDelay.htm
    ;==========================================================================;
    SetKeyDelay, -1

    ; ;==========================================================================;
    ; ; Toggle AHK on and off using "numlock" key
    ; ;==========================================================================;
    ; $numlock::
    ; ; Pause
    ; Suspend
    ; return

    ;==========================================================================;
    ; Some other helpful links (lines are tabbed for Sublime Text to recognize code folds
    ;==========================================================================;
        ; http://ahkscript.org/docs/Hotstrings.htm
        ;----------------------------------------------------------------------;
        ; http://www.autohotkey.com/docs/commands/Loop.
        ;   "+" <- enclose by {+}
        ;   "#" <- enclose by {#}
        ;   `% <- enclose by `%
        ;----------------------------------------------------------------------;
        ; http://ahkscript.org/docs/Hotstrings.htm
        ; http://www.autohotkey.com/docs/commands/_EscapeChar.htm
        ;   - list of special escape characters, such as `%, `t, `r
        ;----------------------------------------------------------------------;
        ; Options: Putting options inside a hotstring's first pair of colons
        ; - * (asterisk): an ending character (e.g. space, period, or enter) is not 
        ;                 required to trigger the hotstring. 
        ; - C: Case sensitive
        ;----------------------------------------------------------------------;
        ; http://ahkscript.org/docs/commands/Send.htm
        ; - Sends simulated keystrokes and mouse clicks to the active window.    
        ;----------------------------------------------------------------------;

;******************************************************************************;
;          Some text abbreviations I frequently use and want to expand
;******************************************************************************;
    ; javascript
    ::#js::
        String=JavaScript
        PasteString(String)
        return

    ; sublime-text
    ::#st::
        String=Sublime Text
        PasteString(String)
        return

    ; Stack Overflow
    ::#so::
        String=Stack Overflow
        PasteString(String)
        return

    ; my name
    ::#tak:: ;Takanori Watanabe
        String=Takanori Watanabe
        PasteString(String)
        return

    ; my email address
    ::#gmail::
        String=takwatanabe2004@gmail.com
        PasteString(String)
        return

    ; email signature
    ::#sign::
        String=
        (
Takanori Watanabe
PhD Candidate, University of Michigan - Ann Arbor
Department of EECS (Machine Learning)
http://www.takwatanabe.me
        )
        PasteString(String)
        return        

    ; my work phone number
    ::#phone::
        String=734-615-7027
        PasteString(String)
        return

    ; um
    ::#um::
        String=University of Michigan
        PasteString(String)
        return

    ; regexp (make these case sensitive, so use the "C" option in hotstrings)
    :C:#regex::
        String=regular expression
        PasteString(String)
        return
    :C:#Regex::
        String=Regular expression
        PasteString(String)
        return      

    ::#fc::
        String=functional connectome
        PasteString(String)
        return  

;******************************************************************************;
;                              Time stampers
;------------------------------------------------------------------------------;
; - Ref: http://www.autohotkey.com/docs/commands/FormatTime.htm]
; - below, TimeString is a variable name, so you're free to change it
;******************************************************************************;
    ; the standard one I use most frequently
    ; Example output: (03/01/2013)
    ::#t2::
        FormatTime, TimeString,, MM/dd/yyyy
        String=(%TimeString%)
        PasteString(String)
        return

    ; Example Output: 2015-06-10
    ::#t::
        FormatTime, TimeString,, yyyy-MM-dd
        String=%TimeString%
        PasteString(String)
        Return

    ; Example Output: (2015-06-10)
    ::#tp::
        FormatTime, TimeString,, yyyy-MM-dd
        String=(%TimeString%)
        PasteString(String)
        Return

    ; Example output: (June-2015)
    ::#tt::
        FormatTime, TimeString,, MMMM-yyyy
        String=(%TimeString%)
        PasteString(String)
        return        

    ; Example output: (June-2015)
    ::#ttt::
        FormatTime, TimeString,, MMMM-dd-yyyy
        String=(%TimeString%)
        PasteString(String)
        return          

    ; "m" for "month"
    ; Example Output: (2015-06)
    ::#tm::
        FormatTime, TimeString,, yyyy-MM
        String=(%TimeString%)
        PasteString(String)
        Return

    ; "min" for "minutes"
    ; Example Output: (06/10/2015 11:20:AM)
    ::#tmin::
        FormatTime, TimeString,, MM/dd/yyyy h:mm:tt
        String=(%TimeString%)
        PasteString(String)
        Return

    ; Include all info (Day of the week too)
    ; Example-output: ***** Friday, March 01, 2013 11:47 PM *****
    ::#tfull::
        FormatTime, TimeString, R
        String=***** %TimeString% *****
        PasteString(String)
        Return

    ; Example output: ***** 03/01/2013 11:57 PM *****
    ::#t*::
        FormatTime, TimeString,, MM/dd/yyyy h:mm tt 
        String=***** %TimeString% *****
        PasteString(String)
        Return

    ; Include all info (Day of the wee
    ; Example-output: ***** Friday, March 01, 2013 11:47 PM *****
    ; ::#t*full::
    ; FormatTime, TimeString, R
    ; SendInput,  ***** %TimeString% *****
    ; Return

    ; When I download stuff...timestamp it with message
    ::#td::
        FormatTime, TimeString,, MM/dd/yyyy
        String=(Downloaded on %TimeString%)%A_Space%
        PasteString(String)
        Return

    ; Concise version
    ;; I had trouble figuring out how to include space...see "Built-in-variables":
    ;; http://www.autohotkey.com/docs/Variables.htm
    ::#tdd::
        FormatTime, TimeString,, MM/dd/yyyy
        String=(dloaded %TimeString%)%A_Space%
        PasteString(String)
        Return


    ;==============================================================================;
    ; (10/16/2014)
    ; - time-stampers for file (cuz backslash won't work here)
    ;==============================================================================;
    ::#tf:: ; (f for "file"....not great but an ok mneumonic)
        FormatTime, TimeString,, yyyy-MM-dd-
        PasteString(TimeString)
        Return

;******************************************************************************;
;                               Code Dasher        
;------------------------------------------------------------------------------;
; Trigger "code-dasher" 
; - prefix trigger key with "$" symbol
;------------------------------------------------------------------------------;
; See here for a list of comment styles
;   - http://en.wikipedia.org/wiki/Comment_(computer_programming)#Examples
;   - http://en.wikipedia.org/wiki/                  ;
;******************************************************************************;
    ;--------------------------------------------------------------------------;
    ; HTML (Enclose ! in {!}, as this is a special character for the "Alt"-key in AHK
    ;        "<!-- CODE BLOCK -->"
    ;--------------------------------------------------------------------------;
    HTML_DASH(Key, n_rep)
        {
            SendInput <{!}-- {%Key% %n_rep%} -->
        }    
        ; level 0 indentation
        ::$<-::
            String=<!-- ----------------------------------------------------------------------- -->
            PasteString(String)
            ; SendInput {Return}
            return

        ::$<=::
            String=<!-- ======================================================================= -->
            PasteString(String)
            ; SendInput {Return}
            return

        ::$<*::
            String=<!-- *********************************************************************** -->
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 1 indentation (4 less space)
        ::$<--::
            String=<!-- ------------------------------------------------------------------- -->
            PasteString(String)
            ; SendInput {Return}
            return

        ::$<==::
            String=<!-- =================================================================== -->
            PasteString(String)
            ; SendInput {Return}
            return

        ::$<**::
            String=<!-- ******************************************************************* -->
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 2 indentation (4*2 less space)
        ::$<---::
            String=<!-- --------------------------------------------------------------- -->
            PasteString(String)
            ; SendInput {Return}
            return

        ::$<===::
            String=<!-- =============================================================== -->
            PasteString(String)
            ; SendInput {Return}
            return

        ::$<***::
            String=<!-- *************************************************************** -->
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 3 indentation (4*3 less space)
        ::$<----::
            String=<!-- ----------------------------------------------------------- -->
            PasteString(String)
            ; SendInput {Return}
            return

        ::$<====::
            String=<!-- =========================================================== -->
            PasteString(String)
            ; SendInput {Return}
            return

        ::$<****::
            String=<!-- *********************************************************** -->
            PasteString(String)
            ; SendInput {Return}
            return

    ;--------------------------------------------------------------------------;
    ; rst
    ;       ".. CODE BLOCK .."
    ;--------------------------------------------------------------------------;
    RST_DASH(Key, n_rep)
        {
            SendInput .. {%Key% %n_rep%} ..
        }
        ; level 0 indentation
        ::$..-::
            String=.. -------------------------------------------------------------------------- ..
            PasteString(String)
            ; SendInput {Return}
            return

        ::$..=::
            String=.. ========================================================================== ..
            PasteString(String)
            ; SendInput {Return}
            return

        ::$..*::
            String=.. ************************************************************************** ..
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 1 indentation        
        ::$..--::
            String=.. ---------------------------------------------------------------------- ..
            PasteString(String)
            ; SendInput {Return}
            return

        ::$..==::
            String=.. ====================================================================== ..
            PasteString(String)
            ; SendInput {Return}
            return

        ::$..**::
            String=.. ********************************************************************** ..
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 2 indentation        
        ::$..---::
            String=.. ------------------------------------------------------------------ ..
            PasteString(String)
            ; SendInput {Return}
            return

        ::$..===::
            String=.. ================================================================== ..
            PasteString(String)
            ; SendInput {Return}
            return

        ::$..***::
            String=.. ****************************************************************** ..
            PasteString(String)
            ; SendInput {Return}
            return     

        ; level 3 indentation        
        ::$..----::
            String=.. -------------------------------------------------------------- ..
            PasteString(String)
            ; SendInput {Return}
            return

        ::$..====::
            String=.. ============================================================== ..
            PasteString(String)
            ; SendInput {Return}
            return

        ::$..****::
            String=.. ************************************************************** ..
            PasteString(String)
            ; SendInput {Return}
            return

    ;--------------------------------------------------------------------------;
    ; CSS, C, C++, C#, JAVA, JAVASCRIPT, PHP, ETC...
    ;        "/* CODE BLOCK /*"
    ;--------------------------------------------------------------------------;
    CSS_DASH(Key, n_rep)
        {
            SendInput /* {%Key% %n_rep%} */
        }    
        ; level 0 indentation
        ::$*-::
            String=/* -------------------------------------------------------------------------- */
            PasteString(String)
            ; SendInput {Return}
            return

        ::$*=::
            String=/* ========================================================================== */
            PasteString(String)
            ; SendInput {Return}
            return

        ::$**::
            String=/* ************************************************************************** */
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 1 indentation (4 less space)
        ::$*--::
            String=/* ---------------------------------------------------------------------- */
            PasteString(String)
            ; SendInput {Return}
            return

        ::$*==::
            String=/* ====================================================================== */
            PasteString(String)
            ; SendInput {Return}
            return

        ::$***::
            String=/* ********************************************************************** */
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 2 indentation (4*2 less space)
        ::$*---::
            String=/* ------------------------------------------------------------------ */
            PasteString(String)
            ; SendInput {Return}
            return

        ::$*===::
            String=/* ================================================================== */
            PasteString(String)
            ; SendInput {Return}
            return

        ::$****::
            String=/* ****************************************************************** */
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 3 indentation (4*3 less space)
        ::$*----::
            String=/* -------------------------------------------------------------- */
            PasteString(String)
            ; SendInput {Return}
            return

        ::$*====::
            String=/* ============================================================== */
            PasteString(String)
            ; SendInput {Return}
            return

        ; ::$******::
        ;     String=/* ************************************************************** */
        ;     PasteString(String)
        ;     SendInput {Return}
        ;     return    

    ;--------------------------------------------------------------------------;
    ; Lisp, closure, Common, etc wrapper
    ;       "; CODE BLOCK ;"
    ;--------------------------------------------------------------------------;
    LISP_DASH(Key, n_rep)
        {
            SendInput `;{%Key% %n_rep%}`;
        }
        ; level 0 indentation
        ::$;-::
            String=;------------------------------------------------------------------------------;
            PasteString(String)
            ; SendInput {Return}
            return

        ::$;=::
            String=;==============================================================================;
            PasteString(String)
            ; SendInput {Return}
            return

        ::$;*::
            String=;******************************************************************************;
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 1 indentation        
        ::$;--::
            String=;--------------------------------------------------------------------------;
            PasteString(String)
            ; SendInput {Return}
            return

        ::$;==::
            String=;==========================================================================;
            PasteString(String)
            ; SendInput {Return}
            return

        ::$;**::
            String=;**************************************************************************;
            PasteString(String)
            ; SendInput {Return}
            return 

        ; level 2 indentation        
        ::$;---::
            String=;----------------------------------------------------------------------;
            PasteString(String)
            ; SendInput {Return}
            return

        ::$;===::
            String=;======================================================================;
            PasteString(String)
            ; SendInput {Return}
            return

        ::$;***::
            String=;**********************************************************************;
            PasteString(String)
            ; SendInput {Return}
            return
      
        ; level 3 indentation        
        ::$;----::
            String=;------------------------------------------------------------------;
            PasteString(String)
            ; SendInput {Return}
            return

        ::$;====::
            String=;==================================================================;
            PasteString(String)
            ; SendInput {Return}
            return

        ::$;****::
            String=;******************************************************************;
            PasteString(String)
            ; SendInput {Return}
            return

    ;--------------------------------------------------------------------------;
    ; Matlab, LatexT, Prolog, {10] Erlang, S-Lang, Visual Prolog
    ;       "% CODE BLOCK %"
    ;--------------------------------------------------------------------------;
    TEX_DASH(Key, n_rep)
        {
            SendInput `%{%Key% %n_rep%}`%
        }
        ; level 0 indentation
        ::$%-::
            String=`%------------------------------------------------------------------------------`%
            PasteString(String)
            ; SendInput {Return}
            return

        ::$%=::
            String=`%==============================================================================`%
            PasteString(String)
            ; SendInput {Return}
            return

        ::$%*::
            String=`%******************************************************************************`%
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 1 indentation        
        ::$%--::
            String=`%--------------------------------------------------------------------------`%
            PasteString(String)
            ; SendInput {Return}
            return

        ::$%==::
            String=`%==========================================================================`%
            PasteString(String)
            ; SendInput {Return}
            return

        ::$%**::
            String=`%**************************************************************************`%
            PasteString(String)
            ; SendInput {Return}
            return     

        ; level 2 indentation        
        ::$%---::
            String=`%----------------------------------------------------------------------`%
            PasteString(String)
            ; SendInput {Return}
            return

        ::$%===::
            String=`%======================================================================`%
            PasteString(String)
            ; SendInput {Return}
            return

        ::$%***::
            String=`%**********************************************************************`%
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 3 indentation        
        ::$%----::
            String=`%------------------------------------------------------------------`%
            PasteString(String)
            ; SendInput {Return}
            return

        ::$%====::
            String=`%==================================================================`%
            PasteString(String)
            ; SendInput {Return}
            return

        ::$%****::
            String=`%******************************************************************`%
            PasteString(String)
            ; SendInput {Return}
            return

    ;--------------------------------------------------------------------------;
    ; Java, JavaScript, C++, C#, PHP, Objective-C, etc
    ;       "// CODE BLOCK //"
    ;--------------------------------------------------------------------------;
    JAVA_DASH(Key, n_rep)
        {
            SendInput //{%Key% %n_rep%}//
        }
        ; level 0 indentation
        ::$/-::
            String=//----------------------------------------------------------------------------//
            PasteString(String)
            ; SendInput {Return}
            return

        ::$/=::
            String=//============================================================================//
            PasteString(String)
            ; SendInput {Return}
            return

        ::$/*::
            String=//****************************************************************************//
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 1 indentation        
        ::$/--::
            String=//------------------------------------------------------------------------//
            PasteString(String)
            ; SendInput {Return}
            return

        ::$/==::
            String=//========================================================================//
            PasteString(String)
            ; SendInput {Return}
            return

        ::$/**::
            String=//************************************************************************//
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 2 indentation        
        ::$/---::
            String=//--------------------------------------------------------------------//
            PasteString(String)
            ; SendInput {Return}
            return

        ::$/===::
            String=//====================================================================//
            PasteString(String)
            ; SendInput {Return}
            return

        ::$/***::
            String=//********************************************************************//
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 3 indentation        
        ::$/----::
            String=//----------------------------------------------------------------//
            PasteString(String)
            ; SendInput {Return}
            return

        ::$/====::
            String=//================================================================//
            PasteString(String)
            ; SendInput {Return}
            return

        ::$/****::
            String=//****************************************************************//
            PasteString(String)
            ; SendInput {Return}
            return      

    ;--------------------------------------------------------------------------;
    ; Bash, Perl, Python, Ruby, PHP, R, Maple, etc
    ;       "// CODE BLOCK //"
    ;--------------------------------------------------------------------------;
    BASH_DASH(Key, n_rep)
        {
            SendInput {#}{%Key% %n_rep%}{#}
        }
        ; level 0 indentation
        ::$#-::
            String=#-----------------------------------------------------------------------------#
            PasteString(String)
            ; SendInput {Return}
            return

        ::$#=::
            String=#=============================================================================#
            PasteString(String)
            ; SendInput {Return}
            return

        ::$#*::
            String=#*****************************************************************************#
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 1 indentation        
        ::$#--::
            String=#-------------------------------------------------------------------------#
            PasteString(String)
            ; SendInput {Return}
            return

        ::$#==::
            String=#=========================================================================#
            PasteString(String)
            ; SendInput {Return}
            return

        ::$#**::
            String=#*************************************************************************#
            PasteString(String)
            ; SendInput {Return}
            return     

        ; level 2 indentation        
        ::$#---::
            String=#---------------------------------------------------------------------#
            PasteString(String)
            ; SendInput {Return}
            return

        ::$#===::
            String=#=====================================================================#
            PasteString(String)
            ; SendInput {Return}
            return

        ::$#***::
            String=#*********************************************************************#
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 3 indentation        
        ::$#----::
            String=#-----------------------------------------------------------------#
            PasteString(String)
            ; SendInput {Return}
            return

        ::$#====::
            String=#=================================================================#
            PasteString(String)
            ; SendInput {Return}
            return

        ::$#****::
            String=#*****************************************************************#
            PasteString(String)
            ; SendInput {Return}
            return

    ;--------------------------------------------------------------------------;
    ; SQL, Ada, AppleScript, Eiffel, Lua, VHDL, SGML, etc
    ;       "-- CODE BLOCK "
    ;--------------------------------------------------------------------------;
    SQL_DASH(Key, n_rep)
        {
            SendInput --{%Key% %n_rep%}--
        }
        ; level 0 indentation
        ::$--::
            String=--------------------------------------------------------------------------------
            PasteString(String)
            ; SendInput {Return}
            return

        ::$-=::
            String=--============================================================================--
            PasteString(String)
            ; SendInput {Return}
            return

        ::$-*::
            String=--****************************************************************************--
            PasteString(String)
            ; SendInput {Return}
            return

        ; level 1 indentation        
        ::$---::
            String=----------------------------------------------------------------------------
            PasteString(String)
            ; SendInput {Return}
            return

        ::$-==::
            String=--========================================================================--
            PasteString(String)
            ; SendInput {Return}
            return

        ::$-**::
            String=--************************************************************************--
            PasteString(String)
            ; SendInput {Return}
            return   

        ; level 2 indentation        
        ::$----::
            String=------------------------------------------------------------------------
            PasteString(String)
            ; SendInput {Return}
            return

        ::$-===::
            String=--====================================================================--
            PasteString(String)
            ; SendInput {Return}
            return

        ::$-***::
            String=--********************************************************************--
            PasteString(String)
            ; SendInput {Return}
            return 

        ; level 3 indentation        
        ::$-----::
            String=--------------------------------------------------------------------
            PasteString(String)
            ; SendInput {Return}
            return

        ::$-====::
            String=--================================================================--
            PasteString(String)
            SendInput {Return}
            return

        ::$-****::
            String=--****************************************************************--
            PasteString(String)
            ; SendInput {Return}
            return   

;******************************************************************************;
;                               Code wrappper        
;------------------------------------------------------------------------------;
; Trigger "code-wrapping" (
; - no prefixing in the trigger-key...
;------------------------------------------------------------------------------;
; See here for a list of comment styles
;   - http://en.wikipedia.org/wiki/Comment_(computer_programming)#Examples
;   - http://en.wikipedia.org/wiki/                  ;
;******************************************************************************;

    ;--------------------------------------------------------------------------;
    ; HTML (Enclose ! in {!}, as this is a special character for the "Alt"-key in AHK
    ;        "<!-- CODE BLOCK -->"
    ;--------------------------------------------------------------------------;
;     HTML_WRAP(Key, n_rep)
;         {
;             SendInput <{!}-- {%Key% %n_rep%} -->`r
;             SendInput <{!}--  -->`r
;             SendInput <{!}-- {%Key% %n_rep%} -->
;             SendInput {Up}{Left 4}
;         }    
;         ; level 0 indentation
;         ::<-::
;             String=
;             (
; <!-- ----------------------------------------------------------------------- -->
; <!--  -->
; <!-- ----------------------------------------------------------------------- -->
;             )
;             PasteString(String)
;             SendInput {Up}{Left 4}
;             return

;         ::<=::
;             String=
;             (
; <!-- ======================================================================= -->
; <!--  -->
; <!-- ======================================================================= -->
;             )
;             PasteString(String)
;             SendInput {Up}{Left 4}
;             return
            
;         ::<*::
;             String=
;             (
; <!-- *********************************************************************** -->
; <!--  -->
; <!-- *********************************************************************** -->
;             )
;             PasteString(String)
;             SendInput {Up}{Left 4}
;             return
            

;         ; level 1 indentation (4 less space)
;         ::<--::
;             String=
;             (
; <!-- ------------------------------------------------------------------- -->
; <!--  -->
; <!-- ------------------------------------------------------------------- -->
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 4}
;             return

;         ::<==::
;             String=
;             (
; <!-- =================================================================== -->
; <!--  -->
; <!-- =================================================================== -->
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 4}
;             return

;         ::<**::
;             String=
;             (
; <!-- ******************************************************************* -->
; <!--  -->
; <!-- ******************************************************************* -->
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 4}
;             return

;         ; level 2 indentation (4*2 less space)
;         ::<---::
;             String=
;             (
; <!-- --------------------------------------------------------------- -->
; <!--  -->
; <!-- --------------------------------------------------------------- -->
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 4}
;             return

;         ::<===::
;             String=
;             (
; <!-- =============================================================== -->
; <!--  -->
; <!-- =============================================================== -->
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 4}
;             return

;         ::<***::
;             String=
;             (
; <!-- *************************************************************** -->
; <!--  -->
; <!-- *************************************************************** -->
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 4}
;             return

;         ; level 3 indentation (4*3 less space)
;         ::<----::
;             String=
;             (
; <!-- ----------------------------------------------------------- -->
; <!--  -->
; <!-- ----------------------------------------------------------- -->
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 4}
;             return

;         ::<====::
;             String=
;             (
; <!-- =========================================================== -->
; <!--  -->
; <!-- =========================================================== -->
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 4}
;             return

;         ::<****::
;             String=
;             (
; <!-- *********************************************************** -->
; <!--  -->
; <!-- *********************************************************** -->
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 4}
;             return

    ;--------------------------------------------------------------------------;
    ; rst
    ;       ".. CODE BLOCK .."
    ;--------------------------------------------------------------------------;
    RST_WRAP(Key, n_rep)
        {
            SendInput .. {%Key% %n_rep%} ..`r
            SendInput ..  ..`r
            SendInput .. {%Key% %n_rep%} ..
            SendInput {Up}{Left 4}
        }
        ; level 0 indentation
        ::..-::
            String=
            (
.. -------------------------------------------------------------------------- ..
..  ..
.. -------------------------------------------------------------------------- ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::..=::
            String=
            (
.. ========================================================================== ..
..  ..
.. ========================================================================== ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::..*::
            String=
            (
.. ************************************************************************** ..
..  ..
.. ************************************************************************** ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ; level 1 indentation        
        ::..--::
            String=
            (
.. ---------------------------------------------------------------------- ..
..  ..
.. ---------------------------------------------------------------------- ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::..==::
            String=
            (
.. ====================================================================== ..
..  ..
.. ====================================================================== ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::..**::
            String=
            (
.. ********************************************************************** ..
..  ..
.. ********************************************************************** ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ; level 2 indentation        
        ::..---::
            String=
            (
.. ------------------------------------------------------------------ ..
..  ..
.. ------------------------------------------------------------------ ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::..===::
            String=
            (
.. ================================================================== ..
..  ..
.. ================================================================== ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::..***::
            String=
            (
.. ****************************************************************** ..
..  ..
.. ****************************************************************** ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ; level 3 indentation        
        ::..----::
            String=
            (
.. -------------------------------------------------------------- ..
..  ..
.. -------------------------------------------------------------- ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::..====::
            String=
            (
.. ============================================================== ..
..  ..
.. ============================================================== ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::..****::
            String=
            (
.. ************************************************************** ..
..  ..
.. ************************************************************** ..
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return     

    ;--------------------------------------------------------------------------;
    ; CSS, C, C++, C#, JAVA, JAVASCRIPT, PHP, ETC...
    ;        "/* CODE BLOCK /*"
    ;--------------------------------------------------------------------------;
    CSS_WRAP(Key, n_rep)
        {
            SendInput /* {%Key% %n_rep%} */`r
            SendInput /*  */`r
            SendInput /* {%Key% %n_rep%} */
            SendInput {Up}{Left 4}
        }    
        ; level 0 indentation
        ::*-::
            String=
            (
/* -------------------------------------------------------------------------- */
/*  */
/* -------------------------------------------------------------------------- */
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::*=::
            String=
            (
/* ========================================================================== */
/*  */
/* ========================================================================== */
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

;         ::**::
;             String=
;             (
; /* ************************************************************************** */
; /*  */
; /* ************************************************************************** */
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 3}
;             return

        ; level 1 indentation (4 less space)
        ::*--::
            String=
            (
/* ---------------------------------------------------------------------- */
/*  */
/* ---------------------------------------------------------------------- */
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::*==::
            String=
            (
/* ====================================================================== */
/*  */
/* ====================================================================== */
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

;         ::***::
;             String=
;             (
; /* ********************************************************************** */
; /*  */
; /* ********************************************************************** */
;             )
;             PasteVString(String)
;             SendInput {Up}{Left 3}
;             return

        ; level 2 indentation (4*2 less space)
        ::*---::
            String=
            (
/* ------------------------------------------------------------------ */
/*  */
/* ------------------------------------------------------------------ */
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::*===::
            String=
            (
/* ================================================================== */
/*  */
/* ================================================================== */
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ; ::****::
        ;     String=
        ;     (
        ;     )
        ;     PasteVString(String)
        ;     SendInput {Up}{Left 3}
        ;     return

        ; level 3 indentation (4*3 less space)
        ::*----::
            String=
            (
/* ------------------------------------------------------------------ */
/*  */
/* ------------------------------------------------------------------ */
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ::*====::
            String=
            (
/* ============================================================== */
/*  */
/* ============================================================== */
            )
            PasteVString(String)
            SendInput {Up}{Left 3}
            return

        ; ::*****::
        ;     CSS_WRAP("*",numRep_b-12)
        ;     return        

    ;--------------------------------------------------------------------------;
    ; Lisp, closure, Common, etc wrapper
    ;       "; CODE BLOCK ;"
    ;--------------------------------------------------------------------------;
    LISP_WRAP(Key, n_rep)
        {
            SendInput `;{%Key% %n_rep%}`;`r
            SendInput `; `r
            SendInput `;{%Key% %n_rep%}`;
            SendInput {Up}{Space}
        }
        ; level 0 indentation
        ::;-::
            String=
            (
;------------------------------------------------------------------------------;
;
;------------------------------------------------------------------------------;
            )
            PasteString(String)
            SendInput {Up}{Space}
            return

        ::;=::
            String=
            (
;==============================================================================;
; 
;==============================================================================;
            )
            PasteString(String)
            SendInput {Up}{Space}
            return

        ::;*::
            String=
            (
;******************************************************************************;
; 
;******************************************************************************;
            )
            PasteString(String)
            SendInput {Up}{Space}
            return

        ; level 1 indentation        
        ::;--::
            String=
            (
;--------------------------------------------------------------------------;
;  
;--------------------------------------------------------------------------;
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ::;==::
            String=
            (
;==========================================================================;
;  
;==========================================================================;
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ; ::;**::
        ;     String=
        ;     (
        ;     )
        ;     PasteVString(String)
        ;     SendInput {Up}{Space}
        ;     return   

        ; level 2 indentation        
        ::;---::
            String=
            (
;----------------------------------------------------------------------;
;  
;----------------------------------------------------------------------;
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ::;===::
            String=
            (
;======================================================================;
;  
;======================================================================;
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ; ::;***::
        ;     LISP_WRAP("*",numRep_a-8)
        ;     return   
      
        ; level 3 indentation        
        ::;----::
            String=
            (
;------------------------------------------------------------------;
;  
;------------------------------------------------------------------;
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ::;====::
            String=
            (
;==================================================================;
;  
;==================================================================;
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ; ::;****::
        ;     LISP_WRAP("*",numRep_a-12)
        ;     return         
    ;--------------------------------------------------------------------------;
    ; Matlab, LatexT, Prolog, {10] Erlang, S-Lang, Visual Prolog
    ;       "% CODE BLOCK %"
    ;--------------------------------------------------------------------------;
    TEX_WRAP(Key, n_rep)
        {
            SendInput `%{%Key% %n_rep%}`%`r
            SendInput `% `r
            SendInput `%{%Key% %n_rep%}`%
            SendInput {Up}{Left 1}
        }
        ; level 0 indentation
        ::%-::
            String=
            (
`%------------------------------------------------------------------------------`%
`% 
`%------------------------------------------------------------------------------`%
            )
            PasteString(String)
            SendInput {Up}{Space}
            return

        ::%=::
            String=
            (
`%==============================================================================`%
`% 
`%==============================================================================`%
            )
            PasteString(String)
            SendInput {Up}{Space}
            return

        ::%*::
            String=
            (
`%******************************************************************************`%
`% 
`%******************************************************************************`%
            )
            PasteString(String)
            SendInput {Up}{Space}
            return

        ::%'::
            String=
            (
`%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''`%
`% 
`%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''`%
            )
            PasteString(String)
            SendInput {Return}{Up 2}{Right}{Space}
            return            

        ::%+::
            String=
            (
`%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++`%
`% 
`%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++`%
            )
            PasteString(String)
            SendInput {Up}{Space}
            return                     

    ; level 1 indentation        
        ::%--::
            String=`%--------------------------------------------------------------------------`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return

        :o:%==::
            String=`%==========================================================================`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return

        :o:%**::
            String=`%**************************************************************************`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return    

        ::%''::
            String=`%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return    

        ::%++::
            String=`%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return

    ; level 2 indentation        
        ::%---::
            String=`%----------------------------------------------------------------------`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return

        :o:%===::
            String=`%======================================================================`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return

        :o:%***::
            String=`%**********************************************************************`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return    

        :o:%'''::
            String=`%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return    

        :o:%+++::
            String=`%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return     

    ; level 3 indentation        
        ::%----::
            String=`%------------------------------------------------------------------`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return

        :o:%====::
            String=`%==================================================================`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return

        :o:%****::
            String=`%******************************************************************`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return    

        :o:%''''::
            String=`%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return    

        :o:%++++::
            String=`%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return               

    ; level 4 indentation        
        ::%-----::
            String=`%--------------------------------------------------------------`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return

        :o:%=====::
            String=`%==============================================================`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return

        :o:%*****::
            String=`%**************************************************************`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Return}{Up 2}{Right}{Space}
            return    

        :o:%'''''::
            String=`%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return    

        :o:%+++++::
            String=`%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++`%
            PasteString(String)
            SendInput {Return}`%{Return}
            PasteString(String)
            SendInput {Up}{Space}
            return                   

    ;--------------------------------------------------------------------------;
    ; Java, JavaScript, C++, C#, PHP, Objective-C, etc
    ;       "// CODE BLOCK //"
    ;--------------------------------------------------------------------------;
    Java_WRAP(Key, n_rep)
        {
            SendInput //{%Key% %n_rep%}//`r
            SendInput //  `r
            SendInput //{%Key% %n_rep%}//
            SendInput {Up}{Left 1}
        }
        ; level 0 indentation
        ::/-::
            String=
            (
//----------------------------------------------------------------------------//
//  
//----------------------------------------------------------------------------//
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

;         ::/=::
;             String=
;             (
; //============================================================================//
; //  
; //============================================================================//
;             )
;             PasteVString(String)
;             SendInput {Up}{Space}
;             return

;         ::/*::
;             String=
;             (
; //****************************************************************************//
; //  
; //****************************************************************************//
;             )
;             PasteVString(String)
;             SendInput {Up}{Space}
;             return

        ; level 1 indentation        
        ::/--::
            String=
            (
//------------------------------------------------------------------------//
//  
//------------------------------------------------------------------------//
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

;         ::/==::
;             String=
;             (
; //========================================================================//
; //  
; //========================================================================//
;             )
;             PasteVString(String)
;             SendInput {Up}{Space}
;             return

        ; ::/**::
        ;     Java_WRAP("*",numRep_aa-4)
        ;     return      

        ; level 2 indentation        
        ::/---::
            String=
            (
//--------------------------------------------------------------------//
//  
//--------------------------------------------------------------------//
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

;         ::/===::
;             String=
;             (
; //====================================================================//
; //  
; //====================================================================//
;             )
;             PasteVString(String)
;             SendInput {Up}{Space}
;             return

        ; ::/***::
        ;     Java_WRAP("*",numRep_aa-8)
        ;     return   

        ; level 3 indentation        
        ::/----::
            String=
            (
//----------------------------------------------------------------//
//  
//----------------------------------------------------------------//
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ::/====::
            String=
            (
//================================================================//
//  
//================================================================//
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

;         ::/****::
;             String=
;             (
; //****************************************************************//
; //  
; //****************************************************************//
;             )
;             PasteVString(String)
;             SendInput {Up}{Space}
;             return

    ;--------------------------------------------------------------------------;
    ; Bash, Perl, Python, Ruby, PHP, R, Maple, etc
    ;       "// CODE BLOCK //"
    ;--------------------------------------------------------------------------;
    BASH_WRAP(Key, n_rep)
        {
            SendInput {#}{%Key% %n_rep%}{#}`r
            SendInput {#} `r
            SendInput `{#}{%Key% %n_rep%}{#}
            SendInput {Up}{Left 1}
        }
        ; level 0 indentation
        ::#-::
            String=
            (
#-----------------------------------------------------------------------------#
# 
#-----------------------------------------------------------------------------#
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ::#=::
            String=
            (
#=============================================================================#
# 
#=============================================================================#
            )
            PasteString(String)
            SendInput {Up 1}{Space}
            return

        ::#*::
            String=
            (
#*****************************************************************************#
# 
#*****************************************************************************#
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ; level 1 indentation        
        ::#--::
            String=
            (
#--------------------------------------------------------------------------#
# 
#--------------------------------------------------------------------------#
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ::#==::
            String=
            (
#==========================================================================#
# 
#==========================================================================#
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ; ::#**::
        ;     BASH_WRAP("*",numRep_a-4)
        ;     return      

        ; level 2 indentation        
        ::#---::
            String=
            (
#----------------------------------------------------------------------#
# 
#----------------------------------------------------------------------#
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ::#===::
            String=
            (
#======================================================================#
# 
#======================================================================#
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return
        ; ::#***::
        ;     BASH_WRAP("*",numRep_a-8)
        ;     return   

        ; level 3 indentation        
        ::#----::
            String=
            (
#------------------------------------------------------------------#
# 
#------------------------------------------------------------------#
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return
        ::#====::
            String=
            (
#==================================================================#
# 
#==================================================================#
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return
        ; ::#****::
        ;     BASH_WRAP("*",numRep_a-12)
        ;     return    

    ;--------------------------------------------------------------------------;
    ; SQL, Ada, AppleScript, Eiffel, Lua, VHDL, SGML, etc
    ;       "-- CODE BLOCK "
    ;--------------------------------------------------------------------------;
    SQL_WRAP(Key, n_rep)
        {
            SendInput --{%Key% %n_rep%}--`r
            SendInput -- `r
            SendInput --{%Key% %n_rep%}--
            SendInput {Up}{Left 1}
        }
        ; level 0 indentation
;         ::--::
;             String=
;             (
; --------------------------------------------------------------------------------
; -- 
; --------------------------------------------------------------------------------
;             )
;             PasteVString(String)
;             SendInput {Up}{Space}
;             return

        ::-=::
            String=
            (
--============================================================================--
-- 
--============================================================================--
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ::-*::
            String=
            (
--****************************************************************************--
-- 
--****************************************************************************--
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ; level 1 indentation        
;         ::---::
;             String=
;             (
; ----------------------------------------------------------------------------
; -- 
; ----------------------------------------------------------------------------
;             )
;             PasteVString(String)
;             SendInput {Up}{Space}
;             return

        ::-==::
            String=
            (
--========================================================================--
-- 
--========================================================================--
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ; ::-**::
        ;     SQL_WRAP("*",numRep_aa-4)
        ;     return      

        ; level 2 indentation        
        ; ::----::
        ;     SQL_WRAP("-",numRep_aa-8)
        ;     return

        ::-===::
            String=
            (
--====================================================================--
-- 
--====================================================================--
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ; ::-***::
        ;     SQL_WRAP("*",numRep_aa-8)
        ;     return   

        ; level 3 indentation        
        ; ::-----::
        ;     SQL_WRAP("-",numRep_aa-12)
        ;     return

        ::-====::
            String=
            (
--================================================================--
-- 
--================================================================--
            )
            PasteVString(String)
            SendInput {Up}{Space}
            return

        ; ::-****::
        ;     SQL_WRAP("*",numRep_aa-12)
        ;     return        



;==========================================================================;
; (10/16/2014) - block comments in "inline" form
;==========================================================================;
    ; html
    ::$<::
        String=<!--  -->
        PasteVString(String)
        Send {Home}{Right 5}        
        return

    ; css, etc
    ::$/::
        String=/*  */
        PasteVString(String)
        Send {Home}{Right 3}        
        return        

;******************************************************************************;
; webdev stuffs 
;******************************************************************************;
    ; jquery snippet
        ; ::$jq::
        ;     SendInput {Raw}`$(document).ready(function(){`
        ;     SendInput `r`t`r{Backspace 1}
        ;     SendInput {Raw}`});`
        ;     SendInput {Up}
        ;     return
    ::$jq::
        String=
        (
$(document).ready(function(){

});
        )
        PasteVString(String)
        SendInput {Up}{Tab}
    return

    ; linkcss
    ::$linkcss::
        String=<link rel="stylesheet" type="text/css" href=".css" />
        PasteString(String)
        SendInput {Left 8}
        return

    ; jquery-cdn i typically insert
    ::$jqcdn::
        String=<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        PasteString(String)
        return

    ; jqueryui-cdn
    ::$jquicdn::
        String=<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
        PasteString(String)
        return

    ; mathjax
    ::$mathcdn::
        String=
        (
<script type="text/x-mathjax-config">  MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$']], displayMath:[["$$","$$"]]  }});</script>
<script type="text/x-mathjax-config">  MathJax.Hub.Config({  TeX: { equationNumbers: { autoNumber: "AMS" } }});</script>
<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
        )
        PasteString(String)
        return

    ; html-skeleton
    ::$htmlskel::
    String=
    (
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
    )
    PasteString(String)        
    return
        
;******************************************************************************;
;                        rst templates
;******************************************************************************;

    ;==========================================================================;
    ; rst starter template
    ;--------------------------------------------------------------------------;
    ; Note
    ; - backspace `b needed to undo the indentation for the next line (ahk has some weird patterns i loathe)
    ; - See this for special  escape chars: http://www.autohotkey.com/docs/commands/_EscapeChar.htm
    ;==========================================================================;
    ::#rstinit::
        String=
        (
``[Parent Directory] <./>``_

.. contents:: **Table of Contents**
    :depth: 2
    
.. sectnum::
    :start: 1
        )
        PasteString(String)
        return
            
;     ::#rstinit::
;         String=
;         (
; `[Parent Directory] <./>`_

; .. contents:: **Table of Contents**
;     :depth: 2

; .. sectnum::
;     :start: 1
;         )
;         PasteString(String)
;         return

    ;==========================================================================;
    ; for rst headers
    ;==========================================================================;
    ;--------------------------------------------------------------------------;
        ; parts
        ::$#::
            String=####################
            PasteString(String)
            return

        ; chapters
        ::$*::
            String=********************
            PasteString(String)
            return

        ; sections
        ::$=::
            String=====================
            PasteString(String)
            return    

        ; subsections
        ::$-::
            String=--------------------
            PasteString(String)
            return      

        ; subsubsections
        ::$^::
            String=^^^^^^^^^^^^^^^^^^^^
            PasteString(String)
            return      

        ; paragraphs
        ::$"::
            String="""""""""""""""""""
            PasteString(String)
            return              
        ; parts
        ::$h1::
            String=
            (
####################

####################
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return

        ; chapters
        ::$h2::
            String=
            (
********************

********************
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return

        ; sections
        ::$h3::
            String=
            (

====================
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return

        ; subsections
        ::$h4::
            String=
            (

--------------------
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return   

        ; subsubsections
        ::$h5::
            String=
            (

^^^^^^^^^^^^^^^^^^^^
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return    

        ; paragraphs
        ::$h6::
            String=
            (

""""""""""""""""""""
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return   

    ;--------------------------------------------------------------------------;
    ; code syntax
    ;--------------------------------------------------------------------------;
    ::$py::
        String=.. code:: python
        PasteString(String)
        SendInput {Return 2}{Tab}
        return

    ::$pyn::
        String=
        (
.. code:: python
    :number-lines:


        )
        PasteString(String)
        SendInput {Tab}
        return        

    ::$mat::
        String=.. code:: matlab
        PasteString(String)
        SendInput {Return 2}{Tab}
        return

    ::$matn::
        String=
        (
.. code:: matlab
    :number-lines:


        )
        PasteString(String)
        SendInput {Tab}
        return   

    ::$tex::
        String=.. code:: tex
        PasteString(String)
        SendInput {Return 2}{Tab}
        return

    ::$texn::
        String=
        (
.. code:: tex
    :number-lines:


        )
        PasteString(String)
        SendInput {Tab}
        return          

    ::$sh::
        String=.. code:: bash
        PasteString(String)
        SendInput {Return 2}{Tab}
        return

    ::$shn::
        String=
        (
.. code:: bash
    :number-lines:


        )
        PasteString(String)
        SendInput {Tab}
        return  

    ::$js::
        String=.. code:: js
        PasteString(String)
        SendInput {Return 2}{Tab}
        return    

    ::$html::
        String=.. code:: html
        PasteString(String)
        SendInput {Return 2}{Tab}
        return      

    ::$cpp::
        String=.. code:: c++
        PasteString(String)
        SendInput {Return 2}{Tab}
        return

    ::$cppn::
        String=
        (
.. code:: c++
    :number-lines:


        )
        PasteString(String)
        SendInput {Tab}
        return   

;******************************************************************************;
;                 Old unpolished junks for temporary purposes
;******************************************************************************;
    ;begin{

    ;end}
    ;********** My Hotkeys for temporary conveninece ***************
    ;; for adding new code in my git-repos study_toolboxes
    ;; Added 03/03/2013
    ;; "ctemp" for CodeTEMPlate
    ::#ctemp::
    SendInput, %A_Tab%- Title:`n- Paper:`n- url:`n- original dirname:`n- Description:`n %A_Tab%*%A_Space%`n
    Return

    ;; {

    ::$he::helper

;==============================================================================;
; Post 2015 stuffs
;==============================================================================;
; ::#vs::Visual Studio
::#vs::
    String=Visual Studio
    PasteString(String)
    return


;
;------------------------------------------------------------------------------;
; some c++ snippets
;------------------------------------------------------------------------------;
::#cpp::
    FormatTime, TimeString,, MM/dd/yyyy
    String=
    (
#include <iostream>
using namespace std;

int main()
{
    cin.get();
    return 0;
}
    )
    PasteString(String)
    SendInput {Up 3}{Return}
    Return

::#p::
::$p::
    String=/*  */
    PasteString(String)
    SendInput {Left 3}
    return


::#pf::
    String=
    (
/*
 * Function: ` 
 * Usage: ` 
 *----------------------------------
 * ` 
 */
    )
    PasteString(String)
    SendInput {Up 4}{End}
    return

::#pp::
    String=
    (
/*
 * `  
 *----------------------------------
 * ` 
 */
    )
    PasteString(String)
    SendInput {Up 3}{End}
    return

::#sys::
    String=system("pause")
    PasteString(String)
    return

; cpp snippet template in visual studio
::$$snip::
    String=
    (
<?xml version="1.0" encoding="utf-8" ?>
<CodeSnippets  xmlns="http://schemas.microsoft.com/VisualStudio/2005/CodeSnippet">
  <CodeSnippet Format="1.0.0">
    <Header>
      <Title>taka snippet</Title>
      <Shortcut>takasnippet</Shortcut>
      <Description>Snipppet Description</Description>
      <Author>Takanori Watanabe</Author>
      <SnippetTypes>
        <SnippetType>Expansion</SnippetType>
        <SnippetType>SurroundsWith</SnippetType>
      </SnippetTypes>
    </Header>
    <Snippet>
      <Declarations>
        <Literal>
          <ID>type</ID>
          <Default>size_t</Default>
          <ToolTip>Control variable type</ToolTip>
        </Literal>
        <Literal>
          <ID>index</ID>
          <Default>i</Default>
          <ToolTip>Index</ToolTip>
        </Literal>
        <Literal>
          <ID>max</ID>
          <Default>length</Default>
          <ToolTip>Max length</ToolTip>
        </Literal>
      </Declarations>
      <Code Language="cpp"><![CDATA[for ($type$ $index$ = 0; $index$ < $max$; $index$++)
    {
      $selected$ $end$
    }]]>
      </Code>
    </Snippet>
  </CodeSnippet>
</CodeSnippets>

<!-- MSDN Helper Link
  https://msdn.microsoft.com/en-us/library/ms171418.aspx
  https://msdn.microsoft.com/en-us/library/ms165394.aspx
-->  
    )
    PasteString(String)
    return    


::#key::
    String=if GetKeyState("Shift","P")
    PasteString(String)
    return

;------------------------------------------------------------------------------;
; ...penn related
;------------------------------------------------------------------------------;
:*:#upenn::University of Pennsylvania
:*:#philly::Philadelphia
:*:#phil::Philadelphia
:*:#mass::Massachusetts

:*:#ss::name:~=
:*:#sss::name:~="~"

::#pmail::
    String=Takanori.Watanabe@uphs.upenn.edu
    PasteString(String)
    return

:*:#ao::(added to onenote) `

:*:#"::
    String=
    (
"""

"""

    )
    PasteString(String)
    SendInput {Up}{Up}
    return

; :*:#%::#`%`%`%
;     SendInput {return}
;     return

;==============================================================================;
; matlab stuffs
;==============================================================================;
;; initializer for matlab script
::#m::
FormatTime, TimeString,, MM/dd/yyyy h:mm:tt
    String=
    (
`%`% mfileName
`% %TimeString%
`%==============================================================================`%
`% - Comments
`%==============================================================================`%
`%`%
clear all
close all
drawnow

rootdir = fileparts(mfilename('fullpath'));

    )
    PasteString(String)
    Return

;; initializer for matlab function
::#mf::
    FormatTime, TimeString,, MM/dd/yyyy
    String=
        (
function tak_function
`% tak_function
`%==============================================================================`%
`% - Comments
`%==============================================================================`%
`% %TimeString%
`%`%
    )
    PasteString(String)
    Return

;; initializer for matlab function
::#msave::
    FormatTime, TimeString,, MM/dd/yyyy
    String=
    (
if fsave
    timeStamp = datestr(now);
    mFileName = [mfilename('fullpath'),'.m'];
    save(outPath,outVars{:})
end
    )
    PasteString(String)
    Return
;==============================================================================;
; stuffs for python
; (2015-06-28)
;==============================================================================;
; got this from http://stackoverflow.com/questions/34439/finding-what-methods-an-object-has
:o:@meth::
    String=
    (
[method for method in dir(%Clipboard%) if callable(getattr(%Clipboard%, method))]
    )
    PasteString(String)
    return

; :*:@r::    
;     String=print "\n===== %Clipboard% ====="
;     PasteString(String)
;     SendInput {Return}
;     return

:o:@-::print "----------------"
; :*:@=::print "================"

::@py1::
    String=
    (
import numpy as np
import matplotlib.pyplot as plt
import scipy as sp
import pandas as pd
import sys
import pprint

class imtak(object):
    def __init__(self, im):
        self.im = im
    def __call__(self, x, y):
        z = self.im.get_array()[int(y), int(x)]
        return 'x={:.01f}, y={:.01f}, z={:.01f}'.format(x, y, z)

data = np.random.random((10,10))

fig, ax = plt.subplots()
im = ax.imshow(data, interpolation='none')
imtak(im)

    )
    PasteString(String)
    SendInput {return}
    SendInput {return}
    return

::@py2::
    String=
    (
`%reset -fs
from numpy import *
from matplotlib.pyplot import *
import scipy as sp
import pandas as pd
import sys
import pprint
    )
    PasteString(String)
    SendInput {return}
    SendInput {return}
    return




:o:@p::
    String=
    (
if __name__ == "__main__":
    run_main()

    )
    PasteString(String)
    return


; :o:@imtak::
;     String=
;     (
; def imtak(image):
;     '''references
;     http://stackoverflow.com/questions/7449585/how-do-you-set-the-absolute-position-of-figure-windows-with-matplotlib
;     http://stackoverflow.com/questions/27704490/interactive-pixel-information-of-an-image-in-python
;     '''
;     import numpy as np
;     np.set_printoptions(threshold='nan')
;     fig, ax = plt.subplots()
;     im = ax.imshow(image, interpolation='none')
;     ax.format_coord = Formatter(im)
;     plt.show()
;     mngr = plt.get_current_fig_manager()
;     # to put it into the upper left corner for example:
; #    geom = mngr.window.geometry()
; #    x,y,dx,dy = geom.getRect()
;     mngr.window.setGeometry(-800,100,640, 545)   
;     )
;     PasteString(String)
;     return        

:o:@py::    
    String=
    (
import numpy as np
import scipy as sp
import matplotlib.pyplot as plt
import pandas as pd
import sys
import pprint
np.set_printoptions(threshold='nan')
    )
    PasteString(String)
    return     


;------------------------------------------------------------------------------;
:o:@imtak::
    String=
    (
import numpy as np
import matplotlib.pyplot as plt
np.set_printoptions(threshold='nan')

plt.close("all")
        
class Formatter(object):
    def __init__(self, im):
        self.im = im
    def __call__(self, x, y):
        z = self.im.get_array()[int(y), int(x)]
        return 'x={:.01f}, y={:.01f}, z={:.01f}'.format(x, y, z)
        
def imtak(image):
    '''references
    http://stackoverflow.com/questions/7449585/how-do-you-set-the-absolute-position-of-figure-windows-with-matplotlib
    http://stackoverflow.com/questions/27704490/interactive-pixel-information-of-an-image-in-python
    '''
    np.set_printoptions(threshold='nan')
    fig, ax = plt.subplots()
    im = ax.imshow(image, interpolation='none')
    ax.format_coord = Formatter(im)
    plt.show()
    mngr = plt.get_current_fig_manager()
    # to put it into the upper left corner for example:
#    geom = mngr.window.geometry()
#    x,y,dx,dy = geom.getRect()
    mngr.window.setGeometry(-800,100,640, 545)
    

if __name__ == "__main__":
    from numpy.random import randn
    imtak(randn(10,10))
    )
    PasteString(String)
    return

;------------------------------------------------------------------------------;
; module loaders for python
;------------------------------------------------------------------------------;    
:o:@np::import numpy as np
:o:@sp::import scipy as sp
:o:@pd::import pandas as pd
:o:@plt::from matplotlib import pyplot as plt
:o:@rnd::from numpy import random
:o:@stl::import sys, os, time, re ;importing two modules in single line against pep8, but whaeva

;------------------------------------------------------------------------------;
; one liners
;------------------------------------------------------------------------------;
:o:@cl::plt.close("all")
:o:@r::
    SendInput reset -fs
    SendInput {return}
    return
:o:@pos::plt.mngr.window.setGeometry(50,100,640, 545)
:o:@cwd::os.getcwd()
:o:@main::if __name__ == "__main__":

;------------------------------------------------------------------------------;
; comprehension demos
;------------------------------------------------------------------------------;
:o:@listcomp::squares = [x**2 for x in range(10)]
:o:@listcomp2::; had trouble printing out '!' character...resort to copy and paste approach
    String=[(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
    PasteString(String)
    return
:o:@setcomp::
    String=a = {x for x in 'abracadabra' if x not in 'abc'}
    PasteString(String)
    return

:o:@dictcomp::
    String={x: x**2 for x in (2, 4, 6)}
    PasteString(String)
    return






