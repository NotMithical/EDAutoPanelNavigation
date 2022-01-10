#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Pixel Mouse, Screen
MsgBox, 0, , This script is design to collect information on your game's resolution and colors in order to generate additional scripts. Press OK to continue.
IfMsgBox OK
{
	WinGetPos, TopLeftX, TopLeftY, ScreenWidth, ScreenHeight, Program Manager
	My_Submit:
	{
		Gui, Submit
		MsgBox, 4, , %ScreenWidth% by %ScreenHeight% - Is this your current resolution?
		IfMsgBox Yes
		{
			MsgBox, Thank you for confirming.
			{
				IfMsgBox OK
				PixelSearchDiameter := ScreenHeight/72
				MsgBox, 0, , If Elite Dangerous is not already running, launch it now. Once you are logged in, open the external panel to your left and select the navigation tab. Press OK once you have done this.
				IfMsgBox OK
				MsgBox, , , Place your cursor over the highlighted navigation tab a short way to the left of the N. This window will automatically close in 15 seconds and get the location of your cursor as well as the color of the pixel at that location., 15
				IfMsgBox TIMEOUT
				MouseGetPos, NavTabCoordX, NavTabCoordY
				PixelGetColor, NavTabColor, NavTabCoordX, NavTabCoordY, Slow
				MsgBox, 0, , When you are ready, select the transaction tab and press OK
				IfMsgBox OK
				MsgBox, , , Place your cursor over the highlighted transaction tab a short way to the left of the T. This window will automatically close in 15 seconds and get the location of your cursor as well as the color of the pixel at that location., 15
				IfMsgBox TIMEOUT
				MouseGetPos, TransactionTabCoordX, TransactionTabCoordY
				PixelGetColor, TransactionTabColor, TransactionTabCoordX, TransactionTabCoordY, Slow
				MsgBox, 0, , When you are ready, select the contacts tab and press OK
				IfMsgBox OK
				MsgBox, , , Place your cursor over the highlighted contacts tab a short way to the left of the C. This window will automatically close in 15 seconds and get the location of your cursor as well as the color of the pixel at that location., 15
				IfMsgBox TIMEOUT
				MouseGetPos, ConTabCoordX, ConTabCoordY
				PixelGetColor, ConTabColor, ConTabCoordX, ConTabCoordY, Slow
				MsgBox, 0, , You may now close Elite Dangerous. When you have done so, press OK and the script will automatically use the collected data to generate new scripts.
				IfMsgBox OK
				{
					FileRead, NavNavTabCheckContents, %A_ScriptDir%\MainScripts\NavNavTabCheck.txt
					NavNavTabCheckContents := StrReplace(NavNavTabCheckContents, "NavNavTabCheckX1", NavTabCoordX)
					NavNavTabCheckContents := StrReplace(NavNavTabCheckContents, "NavNavTabCheckY1", NavTabCoordY)
					NavNavTabCheckContents := StrReplace(NavNavTabCheckContents, "NavNavTabCheckColor", NavTabColor)
					NavNavTabCheckContents := StrReplace(NavNavTabCheckContents, "NavNavTabCheckPixelSearchDiameter", PixelSearchDiameter)
					FileDelete, %A_ScriptDir%\MainScripts\NavNavTabCheck.txt
					FileAppend, %NavNavTabCheckContents%, %A_ScriptDir%\MainScripts\NavNavTabCheck.txt
					FileRead, NavTransactionTabCheckContents, %A_ScriptDir%\MainScripts\NavTransactionTabCheck.txt
					NavTransactionTabCheckContents := StrReplace(NavTransactionTabCheckContents, "NavTransactionTabCheckX1", TransactionTabCoordX)
					NavTransactionTabCheckContents := StrReplace(NavTransactionTabCheckContents, "NavTransactionTabCheckY1", TransactionTabCoordY)
					NavTransactionTabCheckContents := StrReplace(NavTransactionTabCheckContents, "NavTransactionTabCheckColor", TransactionTabColor)
					NavTransactionTabCheckContents := StrReplace(NavTransactionTabCheckContents, "NavTransactionTabCheckPixelSearchDiameter", PixelSearchDiameter)
					FileDelete, %A_ScriptDir%\MainScripts\NavTransactionTabCheck.txt
					FileAppend, %NavTransactionTabCheckContents%, %A_ScriptDir%\MainScripts\NavTransactionTabCheck.txt
					FileRead, NavConTabCheckContents, %A_ScriptDir%\MainScripts\NavConTabCheck.txt
					NavConTabCheckContents := StrReplace(NavConTabCheckContents, "NavConTabCheckX1", ConTabCoordX)
					NavConTabCheckContents := StrReplace(NavConTabCheckContents, "NavConTabCheckY1", ConTabCoordY)
					NavConTabCheckContents := StrReplace(NavConTabCheckContents, "NavConTabCheckColor", ConTabColor)
					NavConTabCheckContents := StrReplace(NavConTabCheckContents, "NavConTabCheckPixelSearchDiameter", PixelSearchDiameter)
					FileDelete, %A_ScriptDir%\MainScripts\NavConTabCheck.txt
					FileAppend, %NavConTabCheckContents%, %A_ScriptDir%\MainScripts\NavConTabCheck.txt
					FileRead, TransactionNavTabCheckContents, %A_ScriptDir%\MainScripts\TransactionNavTabCheck.txt
					TransactionNavTabCheckContents := StrReplace(TransactionNavTabCheckContents, "TransactionNavTabCheckX1", NavTabCoordX)
					TransactionNavTabCheckContents := StrReplace(TransactionNavTabCheckContents, "TransactionNavTabCheckY1", NavTabCoordY)
					TransactionNavTabCheckContents := StrReplace(TransactionNavTabCheckContents, "TransactionNavTabCheckColor", NavTabColor)
					TransactionNavTabCheckContents := StrReplace(TransactionNavTabCheckContents, "TransactionNavTabCheckPixelSearchDiameter", PixelSearchDiameter)
					FileDelete, %A_ScriptDir%\MainScripts\TransactionNavTabCheck.txt
					FileAppend, %TransactionNavTabCheckContents%, %A_ScriptDir%\MainScripts\TransactionNavTabCheck.txt
					FileRead, TransactionTransactionTabCheckContents, %A_ScriptDir%\MainScripts\TransactionTransactionTabCheck.txt
					TransactionTransactionTabCheckContents := StrReplace(TransactionTransactionTabCheckContents, "TransactionTransactionTabCheckX1", TransactionTabCoordX)
					TransactionTransactionTabCheckContents := StrReplace(TransactionTransactionTabCheckContents, "TransactionTransactionTabCheckY1", TransactionTabCoordY)
					TransactionTransactionTabCheckContents := StrReplace(TransactionTransactionTabCheckContents, "TransactionTransactionTabCheckColor", TransactionTabColor)
					TransactionTransactionTabCheckContents := StrReplace(TransactionTransactionTabCheckContents, "TransactionTransactionTabCheckPixelSearchDiameter", PixelSearchDiameter)
					FileDelete, %A_ScriptDir%\MainScripts\TransactionTransactionTabCheck.txt
					FileAppend, %TransactionTransactionTabCheckContents%, %A_ScriptDir%\MainScripts\TransactionTransactionTabCheck.txt
					FileRead, TransactionConTabCheckContents, %A_ScriptDir%\MainScripts\TransactionConTabCheck.txt
					TransactionConTabCheckContents := StrReplace(TransactionConTabCheckContents, "TransactionConTabCheckX1", ConTabCoordX)
					TransactionConTabCheckContents := StrReplace(TransactionConTabCheckContents, "TransactionConTabCheckY1", ConTabCoordY)
					TransactionConTabCheckContents := StrReplace(TransactionConTabCheckContents, "TransactionConTabCheckColor", ConTabColor)
					TransactionConTabCheckContents := StrReplace(TransactionConTabCheckContents, "TransactionConTabCheckPixelSearchDiameter", PixelSearchDiameter)
					FileDelete, %A_ScriptDir%\MainScripts\TransactionConTabCheck.txt
					FileAppend, %TransactionConTabCheckContents%, %A_ScriptDir%\MainScripts\TransactionConTabCheck.txt
					FileRead, ConNavTabCheckContents, %A_ScriptDir%\MainScripts\ConNavTabCheck.txt
					ConNavTabCheckContents := StrReplace(ConNavTabCheckContents, "ConNavTabCheckX1", NavTabCoordX)
					ConNavTabCheckContents := StrReplace(ConNavTabCheckContents, "ConNavTabCheckY1", NavTabCoordY)
					ConNavTabCheckContents := StrReplace(ConNavTabCheckContents, "ConNavTabCheckColor", NavTabColor)
					ConNavTabCheckContents := StrReplace(ConNavTabCheckContents, "ConNavTabCheckPixelSearchDiameter", PixelSearchDiameter)
					FileDelete, %A_ScriptDir%\MainScripts\ConNavTabCheck.txt
					FileAppend, %ConNavTabCheckContents%, %A_ScriptDir%\MainScripts\ConNavTabCheck.txt
					FileRead, ConTransactionTabCheckContents, %A_ScriptDir%\MainScripts\ConTransactionTabCheck.txt
					ConTransactionTabCheckContents := StrReplace(ConTransactionTabCheckContents, "ConTransactionTabCheckX1", TransactionTabCoordX)
					ConTransactionTabCheckContents := StrReplace(ConTransactionTabCheckContents, "ConTransactionTabCheckY1", TransactionTabCoordY)
					ConTransactionTabCheckContents := StrReplace(ConTransactionTabCheckContents, "ConTransactionTabCheckColor", TransactionTabColor)
					ConTransactionTabCheckContents := StrReplace(ConTransactionTabCheckContents, "ConTransactionTabCheckPixelSearchDiameter", PixelSearchDiameter)
					FileDelete, %A_ScriptDir%\MainScripts\ConTransactionTabCheck.txt
					FileAppend, %ConTransactionTabCheckContents%, %A_ScriptDir%\MainScripts\ConTransactionTabCheck.txt
					FileRead, ConConTabCheckContents, %A_ScriptDir%\MainScripts\ConConTabCheck.txt
					ConConTabCheckContents := StrReplace(ConConTabCheckContents, "ConConTabCheckX1", ConTabCoordX)
					ConConTabCheckContents := StrReplace(ConConTabCheckContents, "ConConTabCheckY1", ConTabCoordY)
					ConConTabCheckContents := StrReplace(ConConTabCheckContents, "ConConTabCheckColor", ConTabColor)
					ConConTabCheckContents := StrReplace(ConConTabCheckContents, "ConConTabCheckPixelSearchDiameter", PixelSearchDiameter)
					FileDelete, %A_ScriptDir%\MainScripts\ConConTabCheck.txt
					FileAppend, %ConConTabCheckContents%, %A_ScriptDir%\MainScripts\ConConTabCheck.txt
				}
				MsgBox, 0, , Script setup is now complete. Before using, you will have to manually change all .txt file extensions in %A_ScriptDir%\MainScripts to .ahk. Information on how to use these scripts is available at link. Press OK to exit. ; make sure to add the link here. probably the github page for this with a youtube video or something.
				IfMsgBox OK
				ExitApp
			}
			
		}
		Else
		{
			Gui, New,
			Gui, Add, Text,, Please enter your resolution and press OK when you are finished.
			Gui, Add, Edit, r1 vScreenWidth w50 Number, Width
			Gui, Add, Edit, r1 vScreenHeight w50 Number, Height
			Gui, Add, Button, Default W80 gMy_Submit, OK
			Gui, Show
			Return
		}
	}
}