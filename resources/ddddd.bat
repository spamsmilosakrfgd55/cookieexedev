@echo off
setlocal enabledelayedexpansion

echo STARTING DESKTOP SETUP SCRIPT...
echo.

set "DesktopPath=%userprofile%\Desktop"
echo Current Desktop Path: %DesktopPath%
echo.

echo 1. Attempting to delete old desktop icons...
del /q "%DesktopPath%\*.lnk"
del /q "%DesktopPath%\*.url"
del /q "%DesktopPath%\*.ico"
echo Deletion attempt finished.
echo.

echo 2. Checking for icon file existence...
if not exist "resources\cookie.ico" (
    echo ERROR: The icon file "resources\cookie.ico" was NOT found!
    echo Ensure the file is in a folder named 'resources' next to this script.
    pause
    goto :eof
)
echo Icon file found successfully.
echo.

echo 3. Creating 50 folders and setting icons...
for /L %%i in (1,1,50) do (
    set "FolderName=cookie_%%i"
    set "FolderPath=%DesktopPath%\!FolderName!"
    
    echo Creating folder: !FolderPath!
    md "!FolderPath!"
    
    copy "resources\cookie.ico" "!FolderPath!\cookie.ico" >nul 2>&1
    
    (
        echo [.ShellClassInfo]
        echo IconResource=.\cookie.ico,0
        echo [ViewState]
    ) > "!FolderPath!\desktop.ini"
    
    attrib +s +h "!FolderPath!\desktop.ini"
    attrib +r "!FolderPath!"
)

echo.
echo 4. Forcing desktop icon refresh (restarting Explorer)...
taskkill /f /im explorer.exe
start explorer.exe

echo.
echo SCRIPT FINISHED.
pause
