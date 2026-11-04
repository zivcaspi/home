@ECHO OFF
SETLOCAL

IF NOT EXIST git.exe (
  ECHO Error! git.exe is not on the path or not installed.
  EXIT /B 1
)

REM Configurations that are true globally (to all repos)

git config --global color.grep.filename "brightcyan"
git config --global color.grep.linenumber "brightblue"
git config --global color.grep.match "brightyellow bold"
git config --global color.grep.context "white"
git config --global color.grep.selected "brightgreen"
git config --global color.grep.separator "brightblack"
git config --global color.ui always
git config --global color.error "red bold"

REM Per-origin configuration
REM Here we detect if the origin is ADO or github/zivcaspi,
REM and switch identities based on the origin.

git rev-parse --is-inside-work-tree >nul 2>&1
IF ERRORLEVEL 1 (
    ECHO Not inside a Git repository.
    EXIT /B 1
)

SET "origin="
FOR /f "delims=" %%U in ('git remote get-url origin 2^>nul') DO SET "origin=%%U"

IF NOT DEFINED origin (
    ECHO This repository has no origin remote.
    EXIT /B 1
)

rem Match Azure DevOps HTTPS and SSH URLs.
ECHO(%origin% | findstr /i /r "dev\.azure\.com[/ :] ssh\.dev\.azure\.com[:/] \.visualstudio\.com[:/]" >nul
IF NOT ERRORLEVEL 1 (
    SET "email=zivc@microsoft.com"
    GOTO configure
)

rem Match repositories under the zivcaspi GitHub account, HTTPS or SSH.
ECHO(%origin% | findstr /i /r "github\.com[:/]zivcaspi/" >nul
IF NOT ERRORLEVEL 1 (
    SET "email=zivcaspi@hotmail.com"
    GOTO configure
)

ECHO Unrecognized origin: %origin%
ECHO Git identity was not changed.
EXIT /B 1

:configure
git config --local user.name "Ziv Caspi" || EXIT /B 1
git config --local user.email "%email%" || EXIT /B 1

ECHO Origin: %origin%
ECHO Commit identity: Ziv Caspi ^<%email%^>
