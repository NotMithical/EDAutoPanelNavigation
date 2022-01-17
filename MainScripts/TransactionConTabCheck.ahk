#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 34, 200
; reminder to replace needles with actual unique placeholders and to update script setup.ahk with those placeholders.

FileRead, TransactionConTabCheckPixelSearchDiameter, %A_ScriptDir%\UserSpecificData\PixelSearchDiameterVar.txt
FileRead, TransactionConTabCheckX1, %A_ScriptDir%\UserSpecificData\ConTabCoordXVar.txt
FileRead, TransactionConTabCheckY1, %A_ScriptDir%\UserSpecificData\ConTabCoordYVar.txt
FileRead, TransactionConTabCheckColor, %A_ScriptDir%\UserSpecificData\ConTabColorVar.txt

Sleep, 1200
PixelSearch, MatchCoordX, MatchCoordY, %TransactionConTabCheckX1%, %TransactionConTabCheckY1%, %TransactionConTabCheckX1% + %TransactionConTabCheckPixelSearchDiameter%, %TransactionConTabCheckY1% + %TransactionConTabCheckPixelSearchDiameter%, %TransactionConTabCheckColor%, 5, Fast
	If ErrorLevel
		ExitApp
	Else
	{
		SendEvent, q
		Sleep, 100
		ExitApp
	}