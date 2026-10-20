@ECHO OFF
SETLOCAL

REM This script sets-up default applications on new machines.

CALL winget\setup-fd.cmd
CALL winget\setup-fzf.cmd
CALL winget\setup-rg.cmd
