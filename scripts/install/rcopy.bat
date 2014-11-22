SET robocopy_source="\\192.168.2.250\Other\Distribution\robocopy\robocopy.exe"
SET robocopy_dest="C:\WINDOWS\system32"
 
c:
cd c:\temp
rem ѕроверка, есть-ли уже у нас сам "робокопи" в системе
if not exist %robocopy_dest%\robocopy.exe xcopy /E /Q /R /Y  %robocopy_source% %robocopy_dest%