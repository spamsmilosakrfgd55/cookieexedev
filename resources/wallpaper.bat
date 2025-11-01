@echo off
setlocal

REG ADD "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f

REG ADD "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f

REG ADD "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "2" /f
REG ADD "HKCU\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d "0" /f

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /f

RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True

TASKKILL /F /IM explorer.exe
start explorer.exe
desktop.bat
endlocal
exit
