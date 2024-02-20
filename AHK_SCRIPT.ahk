; Initialize variable to track the state of shortcuts (1 for enabled, 0 for disabled)
shortcutsEnabled := 1

; Ctrl+Shift+F1 key to toggle shortcuts
^+F1::
    ; Toggle the state
    shortcutsEnabled := !shortcutsEnabled

    ; Display a tooltip indicating the current state
    ;Tooltip, Shortcuts (shortcutsEnabled ? "Enabled" : "Disabled")
    SetTimer, RemoveToolTip, 500 ; Remove tooltip after 2 seconds
    return

; Volume Down (F7) - Enabled only when shortcuts are enabled
F7:: 
    if (shortcutsEnabled)
        Send {Volume_Down}
    return

; Volume Up (F8) - Enabled only when shortcuts are enabled
F8:: 
    if (shortcutsEnabled)
        Send {Volume_Up}
    return

; Volume Up (F6) - Enabled only when shortcuts are enabled
F6:: 
    if (shortcutsEnabled)
        Send {Volume_Mute}
    return

; Play/Pause (F5) - Enabled only when shortcuts are enabled
F5:: 
    if (shortcutsEnabled)
        Send {Media_Play_Pause}
    return

; Next Track (F9) - Enabled only when shortcuts are enabled
F9:: 
    if (shortcutsEnabled)
        Send {Media_Prev}
    return

; Previous Track (F10) - Enabled only when shortcuts are enabled
F10:: 
    if (shortcutsEnabled)
        Send {Media_Next}
    return

; Lock User (Win+L) - Enabled only when shortcuts are enabled
F4:: 
    if (shortcutsEnabled)
        Run % "rundll32.exe user32.dll,LockWorkStation"
    return

; Function to remove tooltip
RemoveToolTip:
    Tooltip
    return
