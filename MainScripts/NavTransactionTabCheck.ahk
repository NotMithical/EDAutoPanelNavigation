#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 34, 200
; reminder to replace needles with actual unique placeholders and to update script setup.ahk with those unique placeholders

FileRead, NavTransactionTabCheckPixelSearchDiameter, %A_ScriptDir%\UserSpecificData\PixelSearchDiameterVar.txt
FileRead, NavTransactionTabCheckX1, %A_ScriptDir%\UserSpecificData\TransactionTabCoordXVar.txt
FileRead, NavTransactionTabCheckY1, %A_ScriptDir%\UserSpecificData\TransactionTabCoordYVar.txt
FileRead, NavTransactionTabCheckColor, %A_ScriptDir%\UserSpecificData\TransactionTabColorVar.txt

Sleep, 1200
PixelSearch, MatchCoordX, MatchCoordY, %NavTransactionTabCheckX1%, %NavTransactionTabCheckY1%, %NavTransactionTabCheckX1% + %NavTransactionTabCheckPixelSearchDiameter%, %NavTransactionTabCheckY1% + %NavTransactionTabCheckPixelSearchDiameter%, %NavTransactionTabCheckColor%, 5, Fast
	If ErrorLevel
		ExitApp
	Else
	{
		SendEvent, q
		Sleep, 100
		ExitApp
	}