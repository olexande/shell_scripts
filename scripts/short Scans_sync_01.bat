SET File_Source="D:\FileArchive\Regions"
SET File_Dest="\\server\Docs\Regions"
robocopy.exe %File_Source% %File_Dest% /TEE /XN /XO /NP /E /R:10 /W:30 /Z 




