#Requires AutoHotkey v2.0
#SingleInstance Force
InstallKeybdHook()
SetKeyDelay(-1, 10)

; Arrow keys with full modifier support
RAlt & o:: {
    SendInput(GetModifiers() . "{Up}")
}

RAlt & h:: {
    SendInput(GetModifiers() . "{Left}")
}

RAlt & a:: {
    SendInput(GetModifiers() . "{Down}")
}

RAlt & e:: {
    SendInput(GetModifiers() . "{Right}")
}

; Escape key
RAlt & i::Send("{Escape}")

; Function to get active modifiers
GetModifiers() {
    modifiers := ""
    
    ; Check Ctrl state
    if GetKeyState("Ctrl", "P")
        modifiers .= "^"
    
    ; Check Shift state
    if GetKeyState("Shift", "P")
        modifiers .= "+"
    
    ; Check Left Alt state (not RAlt)
    if GetKeyState("Alt", "P") && !GetKeyState("RAlt", "P")
        modifiers .= "!"
    
    return modifiers
}