#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 34, 200
; reminder to replace needles with actual unique placeholders and to update script setup.ahk with those placeholders.

FileRead, NavConTabCheckPixelSearchDiameter, %A_ScriptDir%\UserSpecificData\PixelSearchDiameterVar.txt
FileRead, NavConTabCheckX1, %A_ScriptDir%\UserSpecificData\ConTabCoordXVar.txt
FileRead, NavConTabCheckY1, %A_ScriptDir%\UserSpecificData\ConTabCoordYVar.txt
FileRead, NavConTabCheckColor, %A_ScriptDir%\UserSpecificData\ConTabColorVar.txt

Sleep, 1200
PixelSearch, MatchCoordX, MatchCoordY, %NavConTabCheckX1%, %NavConTabCheckY1%, %NavConTabCheckX1% + %NavConTabCheckPixelSearchDiameter%, %NavConTabCheckY1% + %NavConTabCheckPixelSearchDiameter%, %NavConTabCheckColor%, 5, Fast
	If ErrorLevel
		ExitApp
	Else
	{
		SendEvent, q
		Sleep, 200
		SendEvent, q
		Sleep, 100
		ExitApp
	}