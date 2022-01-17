#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 34, 200
; reminder to replace needles with actual unique placeholders and to update script setup.ahk with those placeholders.

FileRead, ConNavTabCheckPixelSearchDiameter, %A_ScriptDir%\UserSpecificData\PixelSearchDiameterVar.txt
FileRead, ConNavTabCheckX1, %A_ScriptDir%\UserSpecificData\NavTabCoordXVar.txt
FileRead, ConNavTabCheckY1, %A_ScriptDir%\UserSpecificData\NavTabCoordYVar.txt
FileRead, ConNavTabCheckColor, %A_ScriptDir%\UserSpecificData\NavTabColorVar.txt

Sleep, 1200
PixelSearch, MatchCoordX, MatchCoordY, %ConNavTabCheckX1%, %ConNavTabCheckY1%, %ConNavTabCheckX1% + %ConNavTabCheckPixelSearchDiameter%, %ConNavTabCheckY1% + %ConNavTabCheckPixelSearchDiameter%, %ConNavTabCheckColor%, 5, Fast
	If ErrorLevel
		ExitApp
	Else
	{
		SendEvent, e
		Sleep, 200
		SendEvent, e
		Sleep, 100
		ExitApp
	}