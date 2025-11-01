@echo off
setlocal enabledelayedexpansion
set "DesktopPath=%userprofile%\Desktop"

del /q "%DesktopPath%\*.lnk"
del /q "%DesktopPath%\*.url"
del /q "%DesktopPath%\*.ico"

if not exist "resources\cookie.ico" (
    echo Error: The icon file resources\cookie.ico was not found!
    goto :eof
)

for /L %%i in (1,1,50) do (
    set "FolderName=cookie_%%i"
    set "FolderPath=%DesktopPath%\!FolderName!"

    md "!FolderPath!"

    copy "resources\cookie.ico" "!FolderPath!\cookie.ico" >nul

    echo [.ShellClassInfo]> "!FolderPath!\desktop.ini"
    echo IconResource=.\cookie.ico,0>> "!FolderPath!\desktop.ini"
    echo [ViewState]>> "!FolderPath!\desktop.ini"

    attrib +s +h "!FolderPath!\desktop.ini"
    attrib +r "!FolderPath!"
)

echo Done. 50 "cookie" folders were created on the desktop.
pause
