@echo off
set LOGS="\\192.168.2.250\Other\Distribution\Logs"

SET Property_Dest=d:\Distrib\Silaby_all\
SET Property_Source=\\192.168.2.250\Install\6_synevo\Distrib\Silaby_all


SET robocopy_source="\\192.168.2.250\Other\Distribution\robocopy\robocopy.exe"
SET robocopy_dest="C:\WINDOWS\system32"
 
c:
cd c:\temp
rem ѕроверка, есть-ли уже у нас сам "робокопи" в системе
if not exist %robocopy_dest%\robocopy.exe xcopy /E /Q /R /Y  %robocopy_source% %robocopy_dest%

rem goto skip_test
echo %computername%
echo %region%
echo %Property_Source%
echo %Property_Dest%
:skip_test

if not exist D:\distrib\Silaby_all\ goto localproperty
goto remoteproperty

:localproperty
echo Local Property create
mkdir %Property_Dest%

if %errorlevel%==1 goto dir_error

:remoteproperty
rem pause
echo Lan Property sync
robocopy.exe %Property_Source%  %Property_Dest% /TEE  /NP /MIR /R:10 /W:30 /Z /IPG:2050  

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

rem exit