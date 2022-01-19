#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
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
				PixelSearchDiameter := Round(PixelSearchDiameter)
				MsgBox, 0, , If Elite Dangerous is not already running, launch it now. Once you are logged in, open the external panel to your left and select the navigation tab. Press OK once you have done this.
				IfMsgBox OK
				Gui, New
				Gui, Add, Text, % " w"ScreenWidth/8, Place your cursor over the highlighted navigation tab a short way to the left of the N as shown below. This window will automatically close in 15 seconds and get the location of your cursor as well as the color of the pixel at that location.
				Gui, Add, Picture, % " w"ScreenWidth/8 " h"-1, %A_ScriptDir%\Images\NavigationTabExample.png
				Gui, Show
				Sleep, 15000
				Gui, Destroy
				CoordMode, Mouse, Screen
				MouseGetPos, NavTabCoordX, NavTabCoordY
				CoordMode, Pixel, Screen
				PixelGetColor, NavTabColor, NavTabCoordX, NavTabCoordY, Slow
				MsgBox, 0, , When you are ready, select the transaction tab and press OK
				IfMsgBox OK
				Gui, New
				Gui, Add, Text, % " w"ScreenWidth/8, Place your cursor over the highlighted transaction tab a short way to the left of the T as shown below. This window will automatically close in 15 seconds and get the location of your cursor as well as the color of the pixel at that location.
				Gui, Add, Picture, % " w"ScreenWidth/8 " h"-1, %A_ScriptDir%\Images\TransactionsTabExample.png
				Gui, Show
				Sleep, 15000
				Gui, Destroy
				CoordMode, Mouse, Screen
				MouseGetPos, TransactionTabCoordX, TransactionTabCoordY
				CoordMode, Pixel, Screen
				PixelGetColor, TransactionTabColor, TransactionTabCoordX, TransactionTabCoordY, Slow
				MsgBox, 0, , When you are ready, select the contacts tab and press OK
				IfMsgBox OK
				Gui, New
				Gui, Add, Text, % " w"ScreenWidth/8, Place your cursor over the highlighted contacts tab a short way to the left of the C as shown below. This window will automatically close in 15 seconds and get the location of your cursor as well as the color of the pixel at that location.
				Gui, Add, Picture, % " w"ScreenWidth/8 " h"-1, %A_ScriptDir%\Images\ContactsTabExample.png
				Gui, Show
				Sleep, 15000
				Gui, Destroy
				CoordMode, Mouse, Screen
				MouseGetPos, ConTabCoordX, ConTabCoordY
				CoordMode, Pixel, Screen
				PixelGetColor, ConTabColor, ConTabCoordX, ConTabCoordY, Slow
				MsgBox, 0, , Data collection is now complete. Press OK and the script will automatically use the collected data to generate new scripts.
				IfMsgBox OK
				{
					FileCreateDir, %A_ScriptDir%\MainScripts\UserSpecificData
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\PixelSearchDiameterVar.txt
					FileAppend, %PixelSearchDiameter%, %A_ScriptDir%\MainScripts\UserSpecificData\PixelSearchDiameterVar.txt
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\NavTabCoordXVar.txt
					FileAppend, %NavTabCoordX%, %A_ScriptDir%\MainScripts\UserSpecificData\NavTabCoordXVar.txt
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\NavTabCoordYVar.txt
					FileAppend, %NavTabCoordY%, %A_ScriptDir%\MainScripts\UserSpecificData\NavTabCoordYVar.txt
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\NavTabColorVar.txt
					FileAppend, %NavTabColor%, %A_ScriptDir%\MainScripts\UserSpecificData\NavTabColorVar.txt
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\TransactionTabCoordXVar.txt
					FileAppend, %TransactionTabCoordX%, %A_ScriptDir%\MainScripts\UserSpecificData\TransactionTabCoordXVar.txt
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\TransactionTabCoordYVar.txt
					FileAppend, %TransactionTabCoordY%, %A_ScriptDir%\MainScripts\UserSpecificData\TransactionTabCoordYVar.txt
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\TransactionTabColorVar.txt
					FileAppend, %TransactionTabColor%, %A_ScriptDir%\MainScripts\UserSpecificData\TransactionTabColorVar.txt
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\ConTabCoordXVar.txt
					FileAppend, %ConTabCoordX%, %A_ScriptDir%\MainScripts\UserSpecificData\ConTabCoordXVar.txt
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\ConTabCoordYVar.txt
					FileAppend, %ConTabCoordY%, %A_ScriptDir%\MainScripts\UserSpecificData\ConTabCoordYVar.txt
					FileDelete, %A_ScriptDir%\MainScripts\UserSpecificData\ConTabColorVar.txt
					FileAppend, %ConTabColor%, %A_ScriptDir%\MainScripts\UserSpecificData\ConTabColorVar.txt
				}
				MsgBox, 0, , Script setup is now complete. Information on how to use these scripts is available at https://github.com/NotMithical/EDAutoPanelNavigation. Press OK to exit. ; make sure to add the link here. probably the github page for this with a youtube video or something.
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