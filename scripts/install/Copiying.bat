echo Copiying Distribution
xcopy /E /Q /R /Y "\\192.168.2.250\Other\Distribution\Start" "d:\Distribution\"

rem echo Copiying i386
rem xcopy /E /Q /R /Y "\\192.168.2.250\Other\Distribution\i386" "d:\i386\"

rem echo Copiying Almeza
rem xcopy /E /Q /R /Y "\\192.168.2.250\Other\Distribution\Almeza" "d:\Almeza\"

echo Copiying Drivers 4 standart printers and COM-converter
xcopy /E /Q /R /Y "\\192.168.2.250\Other\Distribution\Drivers" "d:\Drivers\"

rem echo Copiying Nettop EB1021-Drivers
rem xcopy /E /Q /R /Y "\\192.168.2.250\Other\Distribution\Drivers_\Asus_EB1021_new" "d:\Drivers\"


