REM Let user to select a folder
REM Then run a command on it

@ECHO OFF
SET index=1
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /f %%f IN ('dir /a:d /b servers') DO (
   SET folder!index!=%%f
   ECHO !index! - %%f
   SET /A index=!index!+1
)
SETLOCAL DISABLEDELAYEDEXPANSION

SET /P selection="select folder by number: "
SET folder%selection% >nul 2>&1
IF ERRORLEVEL 1 (
   ECHO invalid number selected   
   EXIT /B 1
)

CALL :RESOLVE %%folder%selection%%%
echo Selected: %folder_name%

cd servers\%folder_name%

REM Choose jar file
FOR /f %%j IN ('dir /b /O-N *.jar') DO (set JARFILE=%%j)

SET CMD=java -Xmx1024M -Xms1024M -jar %JARFILE%
echo %CMD%
%CMD%

GOTO :EOF

:RESOLVE
SET folder_name=%1
GOTO :EOF
