
Set WshShell = CreateObject("WScript.Shell")

WshShell.Run "cmd /c ""wallpaper.bat""", 0, False
WshShell.Run "cmd /c ""desktop.bat""", 0, False
Set WshShell = Nothing
