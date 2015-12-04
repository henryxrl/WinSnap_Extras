;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WinSnap_Extras.ahk
;; WinSnap Extras for Windows/Autohotkey
;; Copyright (C) 2015   Ruilin Xu / https://github.com/henryxrl
;;
;; WinSnap Extras is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; WinSnap_Extras is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with WinSnap Extras. If not, see <http://www.gnu.org/licenses/>.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This tools allows you to efficiently manage windows using your keyboard
;; in Windows.
;;
;; Windows + Arrow keys is mapped like this:
;; (remain unchanged)
;;                 +----+
;;                 |####| Up: maximize
;;                 |####|
;;                 |####|
;;            +----+----+----+
;; Left:      |##  |    |  ##|
;; use left   |##  |    |  ##| right: use right half of the screen
;; half of    |##  |    |  ##|
;; the screen +----+----+----+
;;                  Down: restore or minimize
;;
;; Windows + Numpad keys is mapped like this:
;; (screen divided in halfs/thirds/quarters)
;; +------+ +------+ +------+
;; |777   | |888888| |   999|
;; |777   | |888888| |   999|
;; |      | |      | |      |
;; |      | |      | |      |
;; +------+ +------+ +------+
;; |44    | |  55  | |    66|
;; |44    | |  55  | |    66|
;; |44    | |  55  | |    66|
;; |44    | |  55  | |    66|
;; +------+ +------+ +------+
;; |      | |      | |      |
;; |      | |      | |      |
;; |111   | |222222| |   333|
;; |111   | |222222| |   333|
;; +------+ +------+ +------+
;; 0: Restore/Minimize
;;
;; Windows + Ctrl + Numpad keys is mapped like this:
;; (screen divided in thirds)
;; +---+ +---+ +---+
;; |7  | | 8 | |  9|
;; |   | |   | |   |
;; |   | |   | |   |
;; +---+ +---+ +---+
;; |   | |   | |   |
;; |4  | | 5 | |  6|
;; |   | |   | |   |
;; +---+ +---+ +---+
;; |   | |   | |   |
;; |   | |   | |   |
;; |1  | | 2 | |  3|
;; +---+ +---+ +---+
;; 0: Restore/Minimize
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Skips the gentle method of activating a window and goes straight to the forceful method.
#WinActivateForce

; Don't display a tray icon
; #NoTrayIcon

; Permanently running
; #Persistent

;; Variable Initialization
; Window variables
SysGet, Scr, MonitorWorkArea
PADDING := 0
TOP := ScrTop
BOTTOM := ScrBottom + PADDING
LEFT := ScrLeft - PADDING
RIGHT := ScrRight + PADDING
;MsgBox % "TOP: " TOP "`nBOTTOM: " BOTTOM "`nLEFT: " LEFT "`nRIGHT: " RIGHT

; Dictionary which saves windows' data: 1. original x; 2. original y; 3. original w; 4. original h; 5. docked; 6. docked x; 7. docked y
DICT := {}

CAN_ADD_NEW := true
PREV_ID := -1
DOCKED := false
BUSY := false

; Timer for constantly checking window status
SetTimer, CheckMove, 200
return

;; Check if active window has been moved
CheckMove:
    if (!BUSY) {
        WinGet, active_id, ID, A
        if !(!DICT[active_id]) {
            ;MsgBox % "DICT[active_id][5]: " DICT[active_id][5]
            if (DICT[active_id][5]) {
                KeyWait, LButton
                KeyWait, Numpad0
                KeyWait, Numpad1
                KeyWait, Numpad2
                KeyWait, Numpad3
                KeyWait, Numpad4
                KeyWait, Numpad5
                KeyWait, Numpad6
                KeyWait, Numpad7
                KeyWait, Numpad8
                KeyWait, Numpad9
                KeyWait, LWin
                KeyWait, RWin

                a := DICT[active_id][6]
                b := DICT[active_id][7]
                if (a <> "" and b <> "") {
                    WinGetPos, x, y, , , A
                    if (a <> x or b <> y) {
                        SetTimer, CheckMove, Off
                        ;MsgBox % "a: " a "`nb: " b "`nx: " x "`ny: " y
                        DOCKED := false
                        DICT[active_id][5] := DOCKED
                        WinMove, A,, , , DICT[active_id][3], DICT[active_id][4]
                        DICT.Delete(active_id)
                        CAN_ADD_NEW := true
                        ;Gosub, MoveInit
                        SetTimer, CheckMove, 200
                    }
                }
            }
        }
    }
return

;; Resize window (MAIN WORK)
resizeWindow(x0,y0,w0,h0) {
    global BUSY
    global DOCKED
    global DICT
    global PREV_ID
    global CAN_ADD_NEW

    if (!BUSY) {
        BUSY := true
        WinGet, active_id, ID, A

        ; Preparation for window resize
        ; Intentionally set DOCKED to false to prevent super quick key press
        ; Will set back to true later
        DOCKED := false

        if (PREV_ID <> active_id) {
           PREV_ID := active_id
           if (!DICT[active_id])
               CAN_ADD_NEW := true
        }

        if (CAN_ADD_NEW) {
           ;MsgBox, Inside!
           WinGet, maximized, MinMax, A
           WinGetPos, X, Y, W, H, A
           DICT[active_id] := Array(X, Y, W, H, DOCKED)
           if (maximized)
               WinRestore, A
           CAN_ADD_NEW := false
        }

        ; Resize window
        x := Round(x0)
        y := Round(y0)
        w := Round(w0)
        h := Round(h0)
        WinMove,A,,x,y,w,h

        WinGet, active_id, ID, A
        DICT[active_id][6] := x
        DICT[active_id][7] := y
        ;MsgBox % "a: " DICT[active_id][6] "`nb: " DICT[active_id][7]
        DOCKED := true
        DICT[active_id][5] := DOCKED
        BUSY := false
    }
}

;; Restore window to undocked condition
restoreWindow() {
    global BUSY
    global DOCKED
    global DICT
    global CAN_ADD_NEW

    if (!BUSY) {
        BUSY := true

        DOCKED := false
        DICT[active_id][5] := DOCKED
        WinGet, active_id, ID, A
        ;MsgBox, % "DICT[active_id]: " DICT[active_id][1] " " DICT[active_id][2] " " DICT[active_id][3] " " DICT[active_id][4]
        WinMove, A,, DICT[active_id][1], DICT[active_id][2], DICT[active_id][3], DICT[active_id][4]
        DICT.Delete(active_id)

        CAN_ADD_NEW := true
        BUSY := false
    }
}

;; Key combinations
; Win + numpad numbers
#Numpad0::
    restoreWindow()
return
#Numpad1::
    resizeWindow(LEFT,BOTTOM/2.0,RIGHT/2.0,BOTTOM/2.0)
return
#Numpad2::
    resizeWindow(LEFT,BOTTOM/2.0,RIGHT,BOTTOM/2.0)
return
#Numpad3::
    resizeWindow(RIGHT/2.0,BOTTOM/2.0,RIGHT/2.0,BOTTOM/2.0)
return
#Numpad4::
    resizeWindow(LEFT,TOP,RIGHT/3.0+PADDING*2,BOTTOM)
return
#Numpad5::
    resizeWindow(RIGHT/3.0-PADDING,TOP,RIGHT/3.0+PADDING*2,BOTTOM)
return
#Numpad6::
    resizeWindow(RIGHT/3.0*2.0-PADDING,TOP,RIGHT/3.0+PADDING*2,BOTTOM)
return
#Numpad7::
    resizeWindow(LEFT,TOP,RIGHT/2.0,BOTTOM/2.0)
return
#Numpad8::
    resizeWindow(LEFT,TOP,RIGHT,BOTTOM/2.0)
return
#Numpad9::
    resizeWindow(RIGHT/2.0,TOP,RIGHT/2.0,BOTTOM/2.0)
return

; Ctrl + Win + numpad numbers
#^Numpad0::
    restoreWindow()
return
#^Numpad1::
    resizeWindow(LEFT,BOTTOM/3.0*2,RIGHT/3.0,BOTTOM/3.0)
return
#^Numpad2::
    resizeWindow(RIGHT/3.0,BOTTOM/3.0*2,RIGHT/3.0,BOTTOM/3.0)
return
#^Numpad3::
    resizeWindow(RIGHT/3.0*2,BOTTOM/3.0*2,RIGHT/3.0,BOTTOM/3.0)
return
#^Numpad4::
    resizeWindow(LEFT,BOTTOM/3.0,RIGHT/3.0,BOTTOM/3.0)
return
#^Numpad5::
    resizeWindow(RIGHT/3.0,BOTTOM/3.0,RIGHT/3.0,BOTTOM/3.0)
return
#^Numpad6::
    resizeWindow(RIGHT/3.0*2,BOTTOM/3.0,RIGHT/3.0,BOTTOM/3.0)
return
#^Numpad7::
    resizeWindow(LEFT,TOP,RIGHT/3.0,BOTTOM/3.0)
return
#^Numpad8::
    resizeWindow(RIGHT/3.0,TOP,RIGHT/3.0,BOTTOM/3.0)
return
#^Numpad9::
    resizeWindow(RIGHT/3.0*2,TOP,RIGHT/3.0,BOTTOM/3.0)
return