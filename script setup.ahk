#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Pixel Mouse, Screen
MsgBox, 0, , This script is design to collect information on your game's resolution and colors in order to generate additional scripts. Press OK to continue.
	IfMsgBox OK
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
																FileRead, NavNavTabCheckContents, %A_ScriptDir%\MainScripts\NavNavTabCheck.txt
																StringReplace, NavNavTabCheckContents, NavNavTabCheckContents, NavNavTabCheckX1, %NavTabCoordX%, All
																StringReplace, NavNavTabCheckContents, NavNavTabCheckContents, NavNavTabCheckY1, %NavTabCoordY%, All
																StringReplace, NavNavTabCheckContents, NavNavTabCheckContents, NavNavTabCheckColor, %NavTabColor%, All
																FileDelete, %A_ScriptDir%\MainScripts\NavNavTabCheck.txt
																FileAppend, %NavNavTabCheckContents%, %A_ScriptDir%\MainScripts\NavNavTabCheck.txt
																FileRead, NavTransactionTabCheckContents, %A_ScriptDir%\MainScripts\NavTransactionTabCheck.txt
																StringReplace, NavTransactionTabCheckContents, NavTransactionTabCheckContents, NavTransactionTabCheckX1, %TransactionTabCoordX%, All
																StringReplace, NavTransactionTabCheckContents, NavTransactionTabCheckContents, NavTransactionTabCheckY1, %TransactionTabCoordY%, All
																StringReplace, NavTransactionTabCheckContents, NavTransactionTabCheckContents, NavTransactionTabCheckColor, %TransactionTabColor%, All
																FileDelete, %A_ScriptDir%\MainScripts\NavTransactionTabCheck.txt
																FileAppend, %NavTransactionTabCheckContents%, %A_ScriptDir%\MainScripts\NavTransactionTabCheck.txt
																FileRead, NavConTabCheckContents, %A_ScriptDir%\MainScripts\NavConTabCheck.txt
																StringReplace, NavConTabCheckContents, NavConTabCheckContents, NavConTabCheckX1, %ConTabCoordX%, All
																StringReplace, NavConTabCheckContents, NavConTabCheckContents, NavConTabCheckY1, %ConTabCoordY%, All
																StringReplace, NavConTabCheckContents, NavConTabCheckContents, NavNavTabCheckColor, %ConTabColor%, All
																FileDelete, %A_ScriptDir%\MainScripts\NavConTabCheck.txt
																FileAppend, %NavConTabCheckContents%, %A_ScriptDir%\MainScripts\NavConTabCheck.txt
																FileRead, TransactionNavTabCheckContents, %A_ScriptDir%\MainScripts\TransactionNavTabCheck.txt
																StringReplace, TransactionNavTabCheckContents, TransactionNavTabCheckContents, TransactionNavTabCheckX1, %NavTabCoordX%, All
																StringReplace, TransactionNavTabCheckContents, TransactionNavTabCheckContents, TransactionNavTabCheckY1, %NavTabCoordY%, All
																StringReplace, TransactionNavTabCheckContents, TransactionNavTabCheckContents, TransactionNavTabCheckColor, %NavTabColor%, All
																FileDelete, %A_ScriptDir%\MainScripts\TransactionNavTabCheck.txt
																FileAppend, %TransactionNavTabCheckContents%, %A_ScriptDir%\MainScripts\TransactionNavTabCheck.txt
																FileRead, TransactionTransactionTabCheckContents, %A_ScriptDir%\MainScripts\TransactionTransactionTabCheck.txt
																StringReplace, TransactionTransactionTabCheckContents, TransactionTransactionTabCheckContents, TransactionTransactionTabCheckX1, %TransactionTabCoordX%, All
																StringReplace, TransactionTransactionTabCheckContents, TransactionTransactionTabCheckContents, TransactionTransactionTabCheckY1, %TransactionTabCoordY%, All
																StringReplace, TransactionTransactionTabCheckContents, TransactionTransactionTabCheckContents, TransactionTransactionTabCheckColor, %TransactionTabColor%, All
																FileDelete, %A_ScriptDir%\MainScripts\TransactionTransactionTabCheck.txt
																FileAppend, %TransactionTransactionTabCheckContents%, %A_ScriptDir%\MainScripts\TransactionTransactionTabCheck.txt
																FileRead, TransactionConTabCheckContents, %A_ScriptDir%\MainScripts\TransactionConTabCheck.txt
																StringReplace, TransactionConTabCheckContents, TransactionConTabCheckContents, TransactionConTabCheckX1, %ConTabCoordX%, All
																StringReplace, TransactionConTabCheckContents, TransactionConTabCheckContents, TransactionConTabCheckY1, %ConTabCoordY%, All
																StringReplace, TransactionConTabCheckContents, TransactionConTabCheckContents, TransactionConTabCheckColor, %ConTabColor%, All
																FileDelete, %A_ScriptDir%\MainScripts\TransactionConTabCheck.txt
																FileAppend, %TransactionConTabCheckContents%, %A_ScriptDir%\MainScripts\TransactionConTabCheck.txt
																FileRead, ConNavTabCheckContents, %A_ScriptDir%\MainScripts\ConNavTabCheck.txt
																StringReplace, ConNavTabCheckContents, ConNavTabCheckContents, ConNavTabCheckX1, %NavTabCoordX%, All
																StringReplace, ConNavTabCheckContents, ConNavTabCheckContents, ConNavTabCheckY1, %NavTabCoordY%, All
																StringReplace, ConNavTabCheckContents, ConNavTabCheckContents, ConNavTabCheckColor, %NavTabColor%, All
																FileDelete, %A_ScriptDir%\MainScripts\ConNavTabCheck.txt
																FileAppend, %ConNavTabCheckContents%, %A_ScriptDir%\MainScripts\ConNavTabCheck.txt
																FileRead, ConTransactionTabCheckContents, %A_ScriptDir%\MainScripts\ConTransactionTabCheck.txt
																StringReplace, ConTransactionTabCheckContents, ConTransactionTabCheckContents, ConTransactionTabCheckX1, %TransactionTabCoordX%, All
																StringReplace, ConTransactionTabCheckContents, ConTransactionTabCheckContents, ConTransactionTabCheckY1, %TransactionTabCoordY%, All
																StringReplace, ConTransactionTabCheckContents, ConTransactionTabCheckContents, ConTransactionTabCheckColor, %TransactionTabColor%, All
																FileDelete, %A_ScriptDir%\MainScripts\ConTransactionTabCheck.txt
																FileAppend, %ConTransactionTabCheckContents%, %A_ScriptDir%\MainScripts\ConTransactionTabCheck.txt
																FileRead, ConConTabCheckContents, %A_ScriptDir%\MainScripts\ConConTabCheck.txt
																StringReplace, ConConTabCheckContents, ConConTabCheckContents, ConConTabCheckX1, %ConTabCoordX%, All
																StringReplace, ConConTabCheckContents, ConConTabCheckContents, ConConTabCheckY1, %ConTabCoordY%, All
																StringReplace, ConConTabCheckContents, ConConTabCheckContents, ConConTabCheckColor, %ConTabColor%, All
																FileDelete, %A_ScriptDir%\MainScripts\ConConTabCheck.txt
																FileAppend, %ConConTabCheckContents%, %A_ScriptDir%\MainScripts\ConConTabCheck.txt
																MsgBox, 0, , Script setup is now complete. Before using, you will have to manually change all .txt file extensions in %A_ScriptDir%\MainScripts to .ahk. Information on how to use these scripts is available at link. Press OK to exit. ; make sure to add the link here. probably the github page for this with a youtube video or something.
																	IfMsgBox OK
																		Exit