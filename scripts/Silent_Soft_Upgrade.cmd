@echo off

@echo off

set LOGS="\\server\Other\Logs"

SET Soft_Dest=C:\temp\soft
SET Soft_Source=\\server\Install\Distrib\soft32
SET Soft_local_backup="C:\Program Files\soft_bac\"
SET Soft_local="C:\Program Files\soft"


SET robocopy_source="\\server\install\Distrib\robocopy\robocopy.exe"
SET robocopy_dest="C:\WINDOWS\system32"

c:
cd c:\temp
rem Проверка, есть-ли уже у нас сам "робокопи" в системе
if not exist %robocopy_dest%\robocopy.exe xcopy /E /Q /R /Y  %robocopy_source% %robocopy_dest%

rem goto skip_test
echo %computername%
echo %Soft_Source%
echo %Soft_Dest%
:skip_test

if not exist d:\podpisi goto localpodpisi
goto remotepodpisi

:localpodpisi
echo Local Podpisi create
mkdir %Soft_Dest%

if %errorlevel%==1 goto dir_error

:remotepodpisi
rem pause
echo Lan Podpisi sync
robocopy.exe %Soft_Source%  %Soft_Dest% /TEE  /NP /MIR /R:10 /W:30 /Z /IPG:2050

goto complete
:dir_error

echo Disk error.
echo %computername%  >  c:\temp\%computername%_error.log
echo. >> c:\temp\%computername%_error.log
echo. >> c:\temp\%computername%_error.log
echo. >> c:\temp\%computername%_error.log
ipconfig >> c:\temp\%computername%_error.log
xcopy /E /Q /R /Y "c:\temp\%computername%_error.log" "%LOGS%"

:complete

rem pause

rem echo. debug output
rem if exist %Soft_local% echo Soft_exist
rem if exist %Soft_local_backup% echo backup_exist

echo. make backup
rd %Soft_local_backup% /s /q

rem pause

xcopy %Soft_local% %Soft_local_backup% /s /q /r /y

echo.  updating programm
xcopy %Soft_Dest% %Soft_local% /s /q /r /y

rem pause

exit