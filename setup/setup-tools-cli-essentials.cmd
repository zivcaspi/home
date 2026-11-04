@ECHO OFF
SETLOCAL

FOR /F "tokens=1-4 delims=," %%a IN (tools-cli-essentials.csv) DO (
  IF "%%b" EQU "winget" (
    ECHO.
    ECHO Installing %%a -- %%d
    ECHO.
    winget.exe install --exact %%c
  )
)
