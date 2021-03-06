@echo off
echo *** Launching Server ***
start /w /d "C:\Program Files (x86)\GOG\Neverwinter Nights Diamond Edition\" customlauncher.exe +connect 1.1.1.1:5121
timeout /t 5 /nobreak > nul
:loop
timeout /t 1 /nobreak > nul
tasklist /fi "imagename eq nwmain.exe" |find ":" > nul
if errorlevel 1 goto loop
echo *** Neverwinter Nights Terminated ***
echo *** Processing Logs ***
node RavenLogRotator -s servername -u true -p "C:/Source/nwClientLog.txt" -d "C:/DestinationWithNoSlashAtTheEnd" -h "mysftphostname" -l mysftpusername -k mysftppassword -g 22 -z "/mysftppath"
exit