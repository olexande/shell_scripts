SET Scan_Source="D:\ScanArchive\Regions"
SET Scan_Dest="\\192.168.2.216\Docs_scan\Regions"
robocopy.exe %Scan_Source% %Scan_Dest% /TEE /XN /XO /NP /E /R:10 /W:30 /Z 

SET Scan_Source="D:\ScanArchive\Kiev"
SET Scan_Dest="\\192.168.2.216\Docs_scan\Kiev"
robocopy.exe %Scan_Source% %Scan_Dest% /TEE /XN /XO /NP /E /R:10 /W:30 /Z 






