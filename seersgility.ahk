; Seers Agility



;████████  ██████  ███    ███ ███████      █████   ██████  ██ ██      ██ ████████ ██    ██     ██████      ██████  
;   ██    ██    ██ ████  ████ ██          ██   ██ ██       ██ ██      ██    ██     ██  ██           ██    ██  ████ 
;   ██    ██    ██ ██ ████ ██ ███████     ███████ ██   ███ ██ ██      ██    ██      ████        █████     ██ ██ ██ 
;   ██    ██    ██ ██  ██  ██      ██     ██   ██ ██    ██ ██ ██      ██    ██       ██        ██         ████  ██ 
;   ██     ██████  ██      ██ ███████     ██   ██  ██████  ██ ███████ ██    ██       ██        ███████ ██  ██████  
                                                                                                                  
                                                                                                                
; =============================================================================================================================================================================== ;
;; Created by Tom A. 10/15/22
; - Not authorized for sale at this time.
;;;; EVERYTHING OFF EXCEPT SEERS IN THIS COPY!

; notes
; ; ; Use purple reset tile always, basically zoom map out and mark as far as you can to the start. This has enough range to get you to the start on every course. 
; ; Window can be moved with left click



;;; Plugin Requirements
;; Vertical Camera On
;; Improved Rooftop Agility Plugin from the plugin hub with settings in discord.
;; Ground markers with specified color.
;; Fixed client only.



; To Do list
; - create new account to account for all marks and situations with marks on all courses. For now there is a workaround that will get all of the marks but will need better solution
; - implement instructions gui. Need to create template for this for all future scripts.
; - randomize some things better, positions are tough because a lot of small spots on courses and it is color based. 
; - Allow user input of antiban percentage? - maybe... Might just find a good range of values and randomize further.
; - HWID Checks
; - Delete routine for launcher.
; - Keep working with mouse algorithm to make sure it is truly different from other implementations
; - User can set script run time up to 5 hours. 
; - ****GET SCREENSHOTS OF EACH COURSE'S RESET TILE AND ALL PLUGIN SETTINGS/INSTRUCTIONS NEED UPDATED****

;;;;; Globals
#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Client
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1
color1 = 0xFA00FF ; spot
color2 = 0x0000FF ; mark of grace
color3 = 0xFFAD00 ; xp drop
color4 = 0xFF0000 ; Stopping spot for marks
tom = https://raw.githubusercontent.com/tom239955/AgilityPro/main/agilityhwids.txt
If (checkhwid(tom) == True) {
    goto go
}
Else
{
goto Onexit
}
Return
; ; =============================================================================================================================================================================== ;


;  ██████  ██    ██ ██ 
; ██       ██    ██ ██ 
; ██   ███ ██    ██ ██ 
; ██    ██ ██    ██ ██ 
;  ██████   ██████  ██ 
; =============================================================================================================================================================================== ;
; start gui here  
go:
WinActivate, ahk_class SunAwtFrame 
WinGetPos, wx, wy, wwx, wwy,ahk_class SunAwtFrame             
Gui +ToolWindow -Caption +Owner +border +AlwaysOnTop
Gui, Color, 272B2E
Gui, Font, s10 cB5B5B5
Gui Add, Text, x12 y3 w210 h23 +0x200, Tom's AIO Rooftop Agility 2.0
Gui, Font, s8
Gui Add, Button, x205 y32 w90 h23 gstart, Start
Gui Add, ComboBox, x13 y32 w181 vcourse, Choose Rooftop Course...||Seers - No TP|Seers - TP|
Gui Add, Link, x270 y60 w120 h17, <a href="https://discord.gg/uyYJD2r4sa">Help</a>
                    
wy += 375
wx += 20
Gui Show, x%wx% y%wy% w300 h80, Tom's Agility
OnMessage(0x0201, "WM_LBUTTONDOWN")
return


start:
Gui, Submit,NoHide
GuiControlget,Op,,course

if Op = Draynor
    tooltip, not purchased
else if Op = Al Kharid
    tooltip, not purchased
else if Op = Varrock
   tooltip, not purchased
else if Op = Canifis
    tooltip, not purchased
else if Op = Falador
    tooltip, not purchased
else if Op = Seers - No TP
    goto seers
else if Op = Seers - TP
    goto seerstp
else if Op = Rellekka
    tooltip, not purchased
else if Op = Ardougne
    tooltip, not purchased
return


; =============================================================================================================================================================================== ;

                   
;  ██████  ██████  ██    ██ ██████  ███████ ███████ ███████ 
; ██      ██    ██ ██    ██ ██   ██ ██      ██      ██      
; ██      ██    ██ ██    ██ ██████  ███████ █████   ███████ 
; ██      ██    ██ ██    ██ ██   ██      ██ ██           ██ 
;  ██████  ██████   ██████  ██   ██ ███████ ███████ ███████ 
                                                          
                                                          
; =============================================================================================================================================================================== ;



; Draynor Village Rooftops
;;; uses markdraynor() and setupnorth()
Draynor:
WinActivate, ahk_class SunAwtFrame
setupnorth()
loop{
findspot(color1)
xpdrop(80)
antiban()
markdraynor(color2)
reset()
checkhp()
checkstamina() ; if no stams it does nothing
; needs to check food
}
return



; Al Kharid Rooftops
;;; uses markdraynor() probably will miss one mark, but living with it until making new mark for this course, uses setupnorth()

AK:
WinActivate, ahk_class SunAwtFrame
setupnorth()
loop{
findspot(color1)
xpdrop(80)
antiban()
markdraynor(color2)
reset()
checkhp() ; if no food it does nothing
checkstamina() ; if no stams it does nothing

}
return

; Varrock Rooftops
;;; uses Draynor Setup
Varrock:
WinActivate, ahk_class SunAwtFrame
setupnorth()
loop{
findspot(color1)
xpdrop(80)
antiban()
markdraynor(color2)
reset()
checkhp() ; if no food it does nothing
checkstamina() ; if no stams it does nothing

}
return


; Canifis Rooftops
;;; Uses Draynor Setup
Canifis:
WinActivate, ahk_class SunAwtFrame
setupnorth()
loop{
findspot(color1)
xpdrop(80)
antiban()
markdraynor(color2)
reset()
checkhp() ; if no food it does nothing
checkstamina() ; if no stams it does nothing

}
return



; Falador Rooftops
;;; Uses Draynor Setup

Falador:
WinActivate, ahk_class SunAwtFrame
setupnorth()
loop{
findspot(color1)
xpdrop(80)
antiban()
markdraynor(color2)
reset()
checkhp() ; if no food it does nothing
checkstamina() ; if no stams it does nothing

}
return

; Seers Village Rooftops
;;; uses markseers() function and setupnorth()



seers:
WinActivate, ahk_class SunAwtFrame
setupnorth()
loop{
findspot(color1)
xpdrop(80)
antiban()
markseers(color2)
reset()
checkhp()
checkstamina() ; if no stams it does nothing
; needs to check food
}
return



; Seers Village Rooftops (TP)
;;; Needs coded
seerstp:
WinActivate, ahk_class SunAwtFrame
setupnorth()
loop{
findspot(color1)
xpdrop(80)
antiban()
markseers(color2)
resettp()
checkhp()
checkstamina() ; if no stams it does nothing
; needs to check food
}
return


; Rellekka Rooftops
;;; Uses Draynor Setup
Rellekka:
WinActivate, ahk_class SunAwtFrame
setupnorth()
loop{
findspot(color1)
xpdrop(80)
antiban()
markdraynor(color2)
reset()
checkhp() ; if no food it does nothing
checkstamina() ; if no stams it does nothing

}
return


; Ardougne Rooftops
;;; Uses Draynor Setup

Ardy:
WinActivate, ahk_class SunAwtFrame
setupnorth()
loop{
findspot(color1)
xpdrop(80)
antiban()
markdraynor(color2)
reset()
checkhp() ; if no food it does nothing
checkstamina() ; if no stams it does nothing

}
return



; =============================================================================================================================================================================== ;





;███████ ██    ██ ███    ██  ██████ ████████ ██  ██████  ███    ██ ███████ 
;██      ██    ██ ████   ██ ██         ██    ██ ██    ██ ████   ██ ██      
;█████   ██    ██ ██ ██  ██ ██         ██    ██ ██    ██ ██ ██  ██ ███████ 
;██      ██    ██ ██  ██ ██ ██         ██    ██ ██    ██ ██  ██ ██      ██ 
;██       ██████  ██   ████  ██████    ██    ██  ██████  ██   ████ ███████ 
                                                                          
                                                                                                                         
; =============================================================================================================================================================================== ;

UUID()
{
	For obj in ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\" . A_ComputerName . "\root\cimv2").ExecQuery("Select * From Win32_ComputerSystemProduct")
		return obj.UUID	; http://msdn.microsoft.com/en-us/library/aa394105%28v=vs.85%29.aspx
}




WM_LBUTTONDOWN()
{
   PostMessage 0xA1, 2
}


checkstamina(){
Random, MouseSpeed, 300,600
PixelSearch, runx, runy, 527, 143, 561, 167, 0xFFB200, 5, Fast RGB
    If (errorlevel = 0){
        PixelSearch, invx1, invy1, 557, 234, 740, 492, 0x0000FF, 2, Fast RGB
            If (errorlevel = 0)
            {
            mousegetpos, MouseXpos, MouseYpos
            RandomBezier( MouseXpos, MouseYpos, invx1+ weightedclick(-1,0,1), invy1+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")    
            randsleep(50,250)
            Click
            }



    }
}




checkhp(){
Random, MouseSpeed, 300,600
PixelSearch, hpx, hpy, 524, 82, 548, 98, 0x00FF00, 2, Fast RGB
    If (errorlevel = 1){
        PixelSearch, invx1, invy1, 557, 234, 740, 492, 0x00FF00, 2, Fast RGB
            If (errorlevel = 0)
            {
            mousegetpos, MouseXpos, MouseYpos
            RandomBezier( MouseXpos, MouseYpos, invx1+ weightedclick(-1,0,1), invy1+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")    
            randsleep(50,250)
            Click
            }



    }


}

; inv coords 557, 234, 740, 492
; stam color: 0x0000FF
; food color: 0x00FF00
; run energy coords ; 527, 143, 561, 167
; hp coords: 524, 82, 548, 98

setupnorth(){ ; this enables use of super far ground markers on the minimap because it zooms it out. 
Random, MouseSpeed, 300,600
Random, x1, 593, 700
Random, y1, 66, 143
Random, x2, 553, 578
Random, y2, 37, 58
Random, x3, 161,367
Random, y3, 116,283

mousegetpos, MouseXpos, MouseYpos
RandomBezier( MouseXpos, MouseYpos, x1+ weightedclick(-1,0,1), y1+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")
Send,{WheelDown 50}
mousegetpos, MouseXpos, MouseYpos
randsleep(50,250)
RandomBezier( MouseXpos, MouseYpos, x2+ weightedclick(-1,0,1), y2+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")
randsleep(50,250)
click
Send {Up Down}
randsleep(2000,2500)
Send {Up Up}
randsleep(50,250)
mousegetpos, MouseXpos, MouseYpos
RandomBezier( MouseXpos, MouseYpos, x3+ weightedclick(-1,0,1), y3+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")
randsleep(50,250)
Send,{WheelDown 50}
randsleep(50,250)
}









; the mark function needs to be changed to scan specific areas and return true or false if its in a particular spot on a particular course

markseers(color){
Random, MouseSpeed, 300,600
mousegetpos, MouseXpos, MouseYpos
PixelSearch, xx1, yy1, 10, 31, 520, 363, 0xFA00FF, 10, Fast RGB
    If (errorlevel = 0)
        sleep 100
    If (errorlevel = 1){
loop{
    randsleep(1600,1850)
PixelSearch, OutputVarX, OutputVarY, 8, 29, 519, 364, color, 5, Fast RGB
sleep 500
    PixelSearch, OutputVarX2, OutputVarY2, 519, 364, 8, 29, color, 5, Fast RGB
                centerTileX := ((OutputVarX + OutputVarX2) / 2)
                centerTileY := ((OutputVarY + OutputVarY2) / 2)
        if (errorlevel = 0){ 
            RandomBezier( MouseXpos, MouseYpos, centerTileX+ weightedclick(-1,0,1), centerTileY+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")
            randsleep(300,550)
            click
            randsleep(3000,4000)
            PixelSearch, px1, py1,  8, 29, 519, 364, 0xFF0000, 5, Fast RGB
                If (errorlevel = 0) {
                    findspot(0xFF0000)
                    randsleep(1500,2000)
                }
                If (errorlevel = 1) {
                    randsleep(1600,1900)
                    break
        }
}
        if (errorlevel = 1) {
            sleep 10
            break
}
}
}
}

markdraynor(color){
Random, MouseSpeed, 300,600
mousegetpos, MouseXpos, MouseYpos
PixelSearch, xx1, yy1, 10, 31, 520, 363, 0xFA00FF, 10, Fast RGB
    If (errorlevel = 0)
        sleep 100
    If (errorlevel = 1){
loop{
    randsleep(1600,1850)
PixelSearch, OutputVarX, OutputVarY, 8, 29, 519, 364, color, 5, Fast RGB
sleep 500
    PixelSearch, OutputVarX2, OutputVarY2, 519, 364, 8, 29, color, 5, Fast RGB
                centerTileX := ((OutputVarX + OutputVarX2) / 2)
                centerTileY := ((OutputVarY + OutputVarY2) / 2)
        if (errorlevel = 0){ 
            RandomBezier( MouseXpos, MouseYpos, centerTileX+ weightedclick(-1,0,1), centerTileY+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")
            randsleep(300,550)
            click
            randsleep(3000,4000)
            PixelSearch, px1, py1,  8, 29, 519, 364, 0xFF0000, 5, Fast RGB
                If (errorlevel = 0) {
                    findspot(0xFF0000)
                    randsleep(1500,2000)
                }
                If (errorlevel = 1) {
                    randsleep(1600,1900)
                    break
        }
}
        if (errorlevel = 1) {
            sleep 10
            break
}
}
}
}

antiban()
		{
				Random, r1, 1, 100
				if (r1 < 5) { ;change percentage to whatever customer wants
				Random, PercentageSleep, 4500, 10000
				Sleep, %PercentageSleep%
				}
		}


findspot(color){
Random, MouseSpeed, 300,600
mousegetpos, MouseXpos, MouseYpos
PixelSearch, OutputVarX, OutputVarY, 8, 29, 519, 364, color, 2, Fast RGB
sleep 500
    PixelSearch, OutputVarX2, OutputVarY2, 519, 364, 8, 29, color, 2, Fast RGB
                centerTileX := ((OutputVarX + OutputVarX2) / 2)
                centerTileY := ((OutputVarY + OutputVarY2) / 2)
        if (errorlevel = 0){ 
            RandomBezier( MouseXpos, MouseYpos, centerTileX+ weightedclick(-1,0,1), centerTileY+ weightedclick(-1,0,1), "T"MouseSpeed "P4-3")
            randsleep(150,250)
            click
            randsleep(150,250)
        }
        if (errorlevel = 1)
            sleep 100
}


weightedclick(min, target, max){
    Random, lower, min, target
    Random, upper, target, max
    Random, weighted, lower, upper
    Return, weighted
}

randsleep(x,y){
Random, s1, %x%, %y%
sleep s1
}



xpdrop(x){
wait = 0
loop{
PixelSearch, xpx, xpy, 441, 72, 518, 219, 0xFFAD00, 0, Fast RGB
    If (errorlevel = 0){
        randsleep(700,900)
        break
    }
    If (errorlevel = 1)
    {
        wait +=1

        if wait > %x%
        {
            wait = 0
            randsleep(300,600)
            break
        }
             if wait < %x%
        {
            randsleep(100,300)
        }
    }
}
}


reset(){
    Random, MouseSpeed, 300,600
mousegetpos, MouseXpos, MouseYpos
PixelSearch, xx1, yy1, 10, 31, 520, 363, 0xFA00FF, 10, Fast RGB
    If (errorlevel = 0)
        sleep 100
    If (errorlevel = 1){

        PixelSearch, xx2, yy2, 574, 43, 728, 183, 0x6000FF, 10, Fast RGB
            If (errorlevel = 0)
                RandomBezier( MouseXpos, MouseYpos, xx2+ weightedclick(-3,-1,0), yy2+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")
                randsleep(500,100)
                Click
                loop{
                PixelSearch, go1, go2, 255, 191, 275, 210, 0x6000FF, 5, Fast RGB
                    If (errorlevel = 0){

                        randsleep(1600,1700)
                        break
                    }
                    If (errorlevel = 1)
                        randsleep(300,500)

                }

    }

}


resettp(){
    Random, MouseSpeed, 300,600
mousegetpos, MouseXpos, MouseYpos
PixelSearch, xx1, yy1, 10, 31, 520, 363, 0xFA00FF, 10, Fast RGB
    If (errorlevel = 0)
        sleep 100
    If (errorlevel = 1){
            Random, sp1, 735,755
            Random, sp2, 203,220
            RandomBezier( MouseXpos, MouseYpos, sp1+ weightedclick(-3,-1,0), sp2+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")
            randsleep(100,300)
            click
            randsleep(450,600)
            mousegetpos, MouseXpos, MouseYpos
            Random, sp3, 688,701
            Random, sp4, 327,337
            RandomBezier( MouseXpos, MouseYpos, sp3+ weightedclick(-3,-1,0), sp4+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")
             randsleep(100,300)
            click
            randsleep(450,600)
            randsleep(450,600)
            Random, sp5, 640, 656
            Random, sp6, 203, 220
            RandomBezier( MouseXpos, MouseYpos, sp5+ weightedclick(-3,-1,0), sp6+ weightedclick(-1,0,1), "T"MouseSpeed "P2-5")
            randsleep(100,300)
            click
            randsleep(1450,1600)
                }

    }



















RandomBezier( X0, Y0, Xf, Yf, O="" ) {
    Time := RegExMatch(O,"i)T(\d+)",M)&&(M1>0)? M1: 700
    RO := InStr(O,"RO",0) , RD := InStr(O,"RD",0)
    N:=!RegExMatch(O,"i)P(\d+)(-(\d+))?",M)||(M1<2)? 2: (M1>19)? 19: M1
    If ((M:=(M3!="")? ((M3<2)? 2: ((M3>19)? 19: M3)): ((M1=="")? 5: ""))!="")
        Random, N, %N%, %M%
    OfT:=RegExMatch(O,"i)OT(-?\d+)",M)? M1: 100, OfB:=RegExMatch(O,"i)OB(-?\d+)",M)? M1: 230
    OfL:=RegExMatch(O,"i)OL(-?\d+)",M)? M1: 100, OfR:=RegExMatch(O,"i)OR(-?\d+)",M)? M1: 230
    MouseGetPos, XM, YM
    If ( RO )
        X0 += XM, Y0 += YM
    If ( RD )
        Xf += XM, Yf += YM
    If ( X0 < Xf )
        sX := X0-OfL, bX := Xf+OfR
    Else
        sX := Xf-OfL, bX := X0+OfR
    If ( Y0 < Yf )
        sY := Y0-OfT, bY := Yf+OfB
    Else
        sY := Yf-OfT, bY := Y0+OfB
    Loop, % (--N)-1 {
        Random, X%A_Index%, %sX%, %bX%
        Random, Y%A_Index%, %sY%, %bY%
    }
    X%N% := Xf, Y%N% := Yf, E := ( I := A_TickCount ) + Time
    While ( A_TickCount < E ) {
        U := 1 - (T := (A_TickCount-I)/Time)
        Loop, % N + 1 + (X := Y := 0) {
            Loop, % Idx := A_Index - (F1 := F2 := F3 := 1)
                F2 *= A_Index, F1 *= A_Index
            Loop, % D := N-Idx
                F3 *= A_Index, F1 *= A_Index+Idx
            M:=(F1/(F2*F3))*((T+0.000001)**Idx)*((U-0.000001)**D), X+=M*X%Idx%, Y+=M*Y%Idx%
        }
        MouseMove, %X%, %Y%, 0
        Sleep, 1
    }
    MouseMove, X%N%, Y%N%, 0
    Return N+1
}


checkhwid(x){
UUID()
Bronze = https://raw.githubusercontent.com/tom239955/snorlax/main/BronzeHWID.txt
Plat = https://raw.githubusercontent.com/tom239955/snorlax/main/PlatHWID.txt
Gold = https://raw.githubusercontent.com/tom239955/snorlax/main/GoldHWID.txt

checkserial:
UrlDownloadToFile,% x , %a_Programs%\HWID.txt
goto serial1
return
line = 1
serial1:
loop,250{
    FileReadLine, hwid, %a_Programs%\HWID.txt, %line%
    line ++
    UUID_User = %hwid%
    If (UUID_User = UUID())
{
    goto Valid
}
}
GoTo, Invalid
return
Valid:
Tooltip, Valid HWID, 0,30
return true
invalid:
Msgbox, You do not own this script. Please Purchase from the store
FileDelete, %A_programs%\HWID.txt
return false
}








; =============================================================================================================================================================================== ;

;;;; Exit Routine

Esc::
ExitApp
return

F9::
Onexit:
scriptName = aioagil.exe
batDir = %A_ScriptDir%
batName = deleteme.bat

; get the shortpath of the exe to delete
Loop, %A_ScriptDir%\%scriptName%
    exeShortPath = %A_LoopFileShortPath%

; get the shortpath of the directory to create the bat in
Loop, %batDir%, 1
    batShortPath = %A_LoopFileShortPath%
batShortPath = %batShortPath%\%batName%

; create the bat
batContents =
(LTrim Join`n
@echo off
:deleteme
del %exeShortPath%
if exist %exeShortPath% goto deleteme
del %batShortPath%
)
FileAppend, %batContents%, %batShortPath%


Run, %batShortPath%, %batDir%, Hide
FileRecycleEmpty, C:\
exitapp
return