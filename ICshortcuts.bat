
@echo off
echo(
echo(
echo                             Replenishing shortcuts, please wait ~30 seconds for this to complete...

cd "%USERPROFILE%\Desktop"

rem   ***Add files by adding more lines here. Recommend using * for wildcards, as seen in the 3rd entry.***

IF EXIST "FILENAME.lnk" del /q "FILENAME.lnk"
IF EXIST "FILENAME.url" del /q "FILENAME.url"
IF EXIST "*FILENAME*" del /q "*FILENAME*"

rem   ***Include deletion of FOLDERS / directories by editing the following line:***

IF EXIST "%USERPROFILE%\Desktop\UnwantedApps" rd /s /q "%USERPROFILE%\Desktop\UnwantedApps"

rem   ***We must be sure remove any shortcuts or files on the Public desktop.***

IF EXIST "C:\Users\Public\Desktop\*.lnk" del "C:\Users\Public\Desktop\*.lnk"
IF EXIST "C:\Users\Public\Desktop\*.url" del "C:\Users\Public\Desktop\*.url"
IF EXIST "C:\Users\Public\Desktop\filename*" del "C:\Users\Public\Desktop\filename*"
IF EXIST "%USERPROFILE%\Desktop\UnwantedApps" rd /s /q "%USERPROFILE%\Desktop\UnwantedApps"

rem   ***We want to check if the log file exists, and if not, create it.***

IF NOT EXIST "%USERPROFILE%\Documents\Projects\ICshortcuts\ICshortcutsLOG.txt" (
    echo Creating log file... > "%USERPROFILE%\Documents\Projects\ICshortcuts\ICshortcutsLOG.txt"
)

rem   ***Now that files have been removed, we want to restore our custom shortcuts that have gone missing. My path is \Documents\Projects\ICshortcuts\Shortcuts***
rem   ***IMPORTANT: Make sure you CHANGE ALL OF THESE PATHS AND FILENAMES to match where your custom shorcuts are saved, and their names.***

IF NOT EXIST "%USERPROFILE%\Desktop\OrgProgram.lnk" (
	echo %date% %time% OrgProgram.lnk Shortcut had to be replicated: Organization Program >> "%USERPROFILE%\Documents\Projects\ICshortcuts\ICshortcutsLOG.txt"
	robocopy "%USERPROFILE%\Documents\Projects\ICshortcuts\Shortcuts" "%USERPROFILE%\Desktop" "OrgProgram.lnk"
	)
IF NOT EXIST "%USERPROFILE%\Desktop\FREQFILE.lnk" (
	echo %date% %time% FREQFILE.lnk Shortcut had to be replicated: Frequency File >> "%USERPROFILE%\Documents\Projects\ICshortcuts\ICshortcutsLOG.txt"
	robocopy "%USERPROFILE%\Documents\Projects\ICshortcuts\Shortcuts" "%USERPROFILE%\Desktop" "FREQFILE.lnk"
	)

rem   ***We'll show a message on the screen warning the user that File Explorer needs to restart in order to refresh the icon cache.***

msg %USERNAME% "Refreshing Shortcut Key cache. Please Wait while File Explorer restarts.                                                (You can press OK.)"
timeout /t 2

rem   ***Kill explorer.exe and delete the IconCache.db file to refresh the icon cache, restoring functionality to "stale" Shortcut Keys.***

taskkill /IM explorer.exe /F
DEL /A:H "%USERPROFILE%\AppData\Local\IconCache.db"

rem   ***Restart File Explorer.***
start explorer.exe
