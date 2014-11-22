@echo off
cls

set Distribution_etalon="\\192.168.2.250\Other\Distribution\Start"
set Distribution_source="d:\Distribution"

SET scripts_etalon="\\192.168.2.250\Other\Belovol\scripts\install"
SET scripts_source="C:\temp\scripts"

echo Копируем scripty

xcopy /E /Q /R /Y %scripts_etalon% %scripts_source%\

call %scripts_source%\create_dirs.bat
call %scripts_source%\HDD_ReNaming.bat

call %scripts_source%\Copiying.bat

start /wait %scripts_source%\Soft_inst.bat

pause

exit


d:

cd %Distribution_source%

echo installing JRE
start /wait jre-7u25-windows-i586.exe /s

echo installing .NET
start /wait dotnetfx35sp1.exe /quiet

cd %Distribution_source%

echo installing damware
start /wait c:\WINDOWS\system32\msiexec.exe /i DWRCSVista32.MSI /qb

echo installing Adobe reader
cd AdbeRdr11000_uk_UA
start /wait c:\WINDOWS\system32\msiexec.exe /i AcroRead.msi /qb
cd ..

echo installing 7zip
7z920.exe /S

echo installing Thunderbird
start /wait Thunderbird_Setup_17.0.6_Ukr.exe /silent

rem echo installing Firefox
rem start /wait Firefox_Setup_10.0_Ukr.exe /silent

echo installing flash_player
start /wait install_flash_player_11_plugin.exe /install
start /wait install_flash_player_11_active_x.exe /install

echo installing K-Lite_Codec_Pack
start /wait K-Lite_Codec_Pack_995_Mega.exe /silent

echo Run almeza projects
cd D:\Almeza
rem start /wait multiset_player.exe /a_silent
cd ..


echo Remove almeza projects
rem rmdir D:\Almeza /s /q

echo    ********************************************************
echo    ***************    Installing Silab     ****************
echo    ********************************************************

:Installing_Silab

rem color 0A

rem echo on

rem pause

d:
cd d:\Distribution

echo installing CrystalReport
cd "UA Installer\CrystalReport"
c:\WINDOWS\system32\msiexec.exe /i cr9netredist.msi /qb SERIALS=A6S50-01C0008-ZSB00K4
cd ..\..

echo Copying DLL files
cd "UA Installer\Silab UA"
copy crdb_adoplus.dll "C:\Program Files\Common Files\Crystal Decisions\2.0\bin"
copy u25Invoice.dll "C:\Program Files\Common Files\Crystal Decisions\2.0\bin"
copy u2lbcp.dll "C:\Program Files\Common Files\Crystal Decisions\2.0\bin"
copy uflbcp.dll "C:\Program Files\Common Files\Crystal Decisions\2.0\bin"
cd ..
echo .

echo Copying Silab files
mkdir "C:\Program Files\Synevo"
xcopy /E /Q /R /Y "Silab UA" "C:\Program Files\Synevo"
echo .

echo Copying PrintServer files
mkdir "C:\Program Files\Synevo\PrintServer"
xcopy /E /Q /R /Y PrintServer "C:\Program Files\Synevo\PrintServer"

echo Registering PrintServ
c:\windows\system32\regsvr32 /s "C:\Program Files\Synevo\PrintServer\CommServer.dll"
echo .
echo .
echo .
echo .

echo Creating shortcuts
xcopy /E /Q /R /Y "Links" "C:\Documents and Settings\All Users\Рабочий стол"

echo Installing Silab Fonts

xcopy /E /Q /R /Y "Fonts" "C:\WINDOWS\Fonts"

xcopy /E /Q /R /Y "\\192.168.2.250\Other\Distribution\fonts" "c:\temp\fonts\"
c:
cd c:\temp\fonts\
fontinst.exe /f fontinst.inf

echo .
echo .
echo .
echo .
d:\Distribution\LibreOffice_4.1.0.Stable.exe
rem pause