@ECHO OFF
SETLOCAL

REM This script copies files under the sync folder to the local machine provided they are "younger".
xcopy %~dp0sync\localappdata\agency\* %LOCALAPPDATA%\agency /D /S /E /Y /I

xcopy %~dp0sync\appdata\NuGet\* %LOCALAPPDATA%\NuGet /D /S /E /Y /I