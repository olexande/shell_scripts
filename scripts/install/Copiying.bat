echo Copiying Distribution
xcopy /E /Q /R /Y "\\server\Other\Distribution\Start" "d:\Distribution\"

echo Copiying i386
xcopy /E /Q /R /Y "\\server\Other\Distribution\i386" "d:\i386\"

echo Copiying Almeza
xcopy /E /Q /R /Y "\\server\Other\Distribution\Almeza" "d:\Almeza\"

echo Copiying Drivers 4 standart printers and COM-converter
xcopy /E /Q /R /Y "\\server\Other\Distribution\Drivers" "d:\Drivers\"

echo Copiying Nettop -Drivers
xcopy /E /Q /R /Y "\\server\Other\Distribution\Drivers" "d:\Drivers\"


