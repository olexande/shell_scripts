if not exist c:\temp\signature_sync.cmd goto stop_work
goto begin_work

:begin_work
call c:\temp\signature_sync.cmd

:stop_work
