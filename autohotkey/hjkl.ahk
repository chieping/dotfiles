#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

<!h::
  Send,{Left}
  return
<!l::
  Send,{Right}
  return
<!j::
  Send,{Down}
  return
<!k::
  Send,{Up}
  return
; shift対応
<!+h::
  Send,+{Left}
  return
<!+l::
  Send,+{Right}
  return
<!+j::
  Send,+{Down}
  return
<!+k::
  Send,+{Up}
  return
; left alt+uiopでPageDown/PageUp/Home/End
<!u::
  Send,{PgDn}
  return
<!i::
  Send,{PgUp}
  return
<!o::
  Send,{Home}
  return
<!p::
  Send,{End}
  return
