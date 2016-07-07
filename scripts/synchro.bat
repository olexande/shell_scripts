@echo off

rem Регулярно пользуюсь функционалом 1-й программы, которая периодически выполняет действие и после окончания её
rem работы необходимо запустить некий абстрактный скрипт.
rem Возникла необходимость установить "ограничитель", который не допустит запуск конкурирующего экземпляра скрипта.

rem Моя попытка решить эту "заминку" и привела к созданию данного скрипта.

set /a RND=2+5*%random%/32767
echo %RND%
ping 127.0.0.1 -n %RND% > NUL


if exist c:\script\triger.txt (goto end) else (goto work)


:work
echo working

echo Y > c:\script\triger.txt

set /a RND=2+20*%random%/32767
echo %RND%
ping 127.0.0.1 -n %RND% > NUL

rem здесь что-то полезное запускаем\делаем

goto :deltriger

:end
echo end
goto exit

:deltriger
del c:\script\triger.txt
goto exit


:exit
