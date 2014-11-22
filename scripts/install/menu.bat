@Echo off

cls
 
:m1
Echo Sdelaite vybor?:
Echo.
Echo 1 - Version 1
Echo 2 - Version 2
Echo 3 - Version 3
 
echo.
Set /p choice="Vash vibor: "
if not defined choice goto m1
if "%choice%"=="1" (start 1.exe)
if "%choice%"=="2" (start 2.exe)
if "%choice%"=="3" (start 3.exe)
Echo.
Echo oshibka v vibore
Echo.
Echo.
goto m1
pause >nul