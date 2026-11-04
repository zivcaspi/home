@ECHO OFF
SETLOCAL


REM ****************************************************************************
REM Prelim
REM ****************************************************************************

REM Set ESC to be an escapte
SET ESC=

REM Verify that we have winget
where winget
IF ERRORLEVEL 1 (
  ECHO %ESC%[31mFailed to locate winget%ESC%[0m
  EXIT /B 1
)

where cargo.exe
IF ERRORLEVEL 1 (
  ECHO %ESC%[31mFailed to locate cargo/rust%ESC%[0m
  EXIT /B 1
)

REM ****************************************************************************
REM Work starts here
REM ****************************************************************************
CALL :Bin
ECHO.
CALL :Git
ECHO.
CALL :Copilot
ECHO.
CALL :Agency
ECHO.
CALL :Clink
ECHO.
CALL :GitHubCli
ECHO.
CALL :SpotifyPlayer
ECHO.
CALL :Bat
ECHO.
CALL :StorageExplorer
ECHO.
GOTO :EOF

REM ****************************************************************************
REM C:\Bin
REM ****************************************************************************
:Bin
REM TODO
GOTO :EOF

REM ****************************************************************************
REM Git
REM ****************************************************************************
:Git

ECHO TODO - Install GIT if it's not already installed...
GOTO :EOF

REM ****************************************************************************
REM Copilot
REM ****************************************************************************
:Copilot
ECHO %ESC%[32mInstalling GitHub Copilot CLI...%ESC%[0m
winget install GitHub.Copilot
GOTO :EOF

REM ****************************************************************************
REM Agency (Microsoft internal)
REM ****************************************************************************
:Agency
ECHO %ESC%[32mInstalling Agency...%ESC%[0m
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0installtool-agency.ps1"
ECHO %ESC%[33mTODO - Run 'agency copilot', then run '/login' and then login using 'zivc_microsoft' (EMU)%ESC%[0m

TOCO - Does this work or do we need to set up the PATH before running this?
CALL agency install vscode

GOTO :EOF

REM ****************************************************************************
REM Clink
REM ****************************************************************************
:Clink
ECHO %ESC%[32mInstalling Clink...%ESC%[0m
winget install --id=chrisant996.Clink -e
ECHO %ESC%[33mTODO - Configure Clink, set up Lua scripts, etc.%ESC%[0m
GOTO :EOF

REM ****************************************************************************
REM GitHubCli
REM ****************************************************************************
:GitHubCli
ECHO %ESC%[32mInstalling GitHub CLI...%ESC%[0m
winget install --id GitHub.cli
ECHO TODO - Configure GitHubCli...
GOTO :EOF

REM ****************************************************************************
REM Spotify-Player
REM ****************************************************************************
:SpotifyPlayer
REM Very complex to set up (need a dev key)... Rething if I need this
REM ECHO %ESC%[32mInstalling Spotify-Player...%ESC%[0m
REM cargo install spotify_player --locked
REM ECHO %ESC%[33mDone - Configure Spotify-Player.%ESC%[0m
GOTO :EOF

REM ****************************************************************************
REM Bat
REM ****************************************************************************
:Bat
CALL :WinGetInstall sharkdp.bat "Bat - like cat with wings"
GOTO :EOF

REM ****************************************************************************
REM StorageExplorer
REM ****************************************************************************
:StorageExplorer
CALL :WinGetInstall Microsoft.Azure.StorageExplorer "Microsoft Azure Storage Explorer"
GOTO :EOF

REM ****************************************************************************
REM WinGetInstall ID
REM ****************************************************************************
:WinGetInstall
IF "%1" EQU "" (
  ECHO Bah... No package ID to install
  GOTO :EOF
)

ECHO %ESC%[32mInstalling %1...%ESC%[0m
IF "%~2" NEQ "" (
  ECHO %ESC%[32m...%~2%ESC%[0m
)

winget.exe install --id %1 --exact
IF ERRORLEVEL 1 (
  ECHO Bah... Error code %ERRORLEVEL%
)
GOTO :EOF

:EOF