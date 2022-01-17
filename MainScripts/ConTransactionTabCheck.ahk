#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 34, 200
; reminder to replace needles with actual unique placeholders and to update script setup.ahk with those placeholders.

FileRead, ConTransactionTabCheckPixelSearchDiameter, %A_ScriptDir%\UserSpecificData\PixelSearchDiameterVar.txt
FileRead, ConTransactionTabCheckX1, %A_ScriptDir%\UserSpecificData\TransactionTabCoordXVar.txt
FileRead, ConTransactionTabCheckY1, %A_ScriptDir%\UserSpecificData\TransactionTabCoordYVar.txt
FileRead, ConTransactionTabCheckColor, %A_ScriptDir%\UserSpecificData\TransactionTabColorVar.txt

Sleep, 1200
PixelSearch, MatchCoordX, MatchCoordY, %ConTransactionTabCheckX1%, %ConTransactionTabCheckY1%, %ConTransactionTabCheckX1% + %ConTransactionTabCheckPixelSearchDiameter%, %ConTransactionTabCheckY1% + %ConTransactionTabCheckPixelSearchDiameter%, %ConTransactionTabCheckColor%, 5, Fast
	If ErrorLevel
		ExitApp
	Else
	{
		SendEvent, e
		Sleep, 100
		ExitApp
	}