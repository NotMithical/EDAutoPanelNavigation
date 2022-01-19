#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 34, 34
; reminder to replace needles with actual unique placeholders and to update script setup.ahk with those placeholders.

FileRead, TransactionNavTabCheckPixelSearchDiameter, %A_ScriptDir%\UserSpecificData\PixelSearchDiameterVar.txt
FileRead, TransactionNavTabCheckX1, %A_ScriptDir%\UserSpecificData\NavTabCoordXVar.txt
FileRead, TransactionNavTabCheckY1, %A_ScriptDir%\UserSpecificData\NavTabCoordYVar.txt
FileRead, TransactionNavTabCheckColor, %A_ScriptDir%\UserSpecificData\NavTabColor.txt

Sleep, 1000
PixelSearch, MatchCoordX, MatchCoordY, %TransactionNavTabCheckX1%, %TransactionNavTabCheckY1%, %TransactionNavTabCheckX1% + %TransactionNavTabCheckPixelSearchDiameter%, %TransactionNavTabCheckY1% + %TransactionNavTabCheckPixelSearchDiameter%, %TransactionNavTabCheckColor%, 5, Fast
	If ErrorLevel
		ExitApp
	Else
	{
		SendEvent, e
		Sleep, 100
		ExitApp
	}