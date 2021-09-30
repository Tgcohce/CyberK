@echo off
:Start
color b
cls
echo 
echo         Welcome To CyberK elevated command line tool 
echo               for some quick security fixes
echo               type help to see the commands
echo                     Shoutout to Atlas
echo               (Make Sure To Run it as Admin)
echo
:Command
SET /P Input=%username%@CyberK:~# 
if %Input% == Clear goto Start
if %Input% == clear goto Start
if %Input% == CLEAR goto Start
if %Input% == Help goto Help
if %Input% == help goto Help
if %Input% == HELP goto Help
if %Input% == RDP goto RDP
if %Input% == rdp goto RDP
if %Input% == Accounts Goto Accounts
if %Input% == Name goto Name
if %Input% == name goto Name
if %Input% == WallOn goto WallOn
if %Input% == wallon goto WallOn
if %Input% == Wallon goto WallOn
if %Input% == WallOff goto WallOff
if %Input% == Walloff goto WallOff
if %Input% == walloff goto WallOff
if %Input% == Fedia goto Fedia
if %Input% == fedia goto Fedia
if %Input% == Gpolicy goto Gpolicy
if %Input% == gpolicy goto Gpolicy

%Input%
goto Command
pause

:Help
echo       #############################################
echo        #                 -Help-                  #
echo        #                                         #
echo        #   Help - Goes To Help                   #
echo        #   Clear - Clears Screen                 #
echo        #   RDP - Brings Up RDP Settings          #
echo        #   Accounts - Disables Accounts          #
echo        #   Name - Displays Hostname              #
echo        #   WallOn - Turn Firewall on             #
echo        #   WallOff - Turns Firewall off          #
echo        #   Fedia - Finds Media Files(.mp3/.mp4)  #
echo        # --------------------------------------  #
echo        #                 -BETA-                  #
echo        #   Gpolicy - redirects for group policy  #
echo        #                                         #
echo       #############################################
echo

:RDP
echo Type 0 To Enable RDP Services Or 1 To Disable
SET /P RDP=%username%@KVHS:~# 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d %RDP% /f
goto Command

:Accounts
echo Disabling Guest And Admin Accounts
net user administrator /active:no
net user guest /active:no
goto Command

:Name
echo Hostname of the current system :
echo %computername%
goto Command

:WallOn
echo Turning Firewall on
netsh advfirewall set allprofiles state on
goto Command

:WallOff 
echo Turning Firewall off
netsh advfirewall set allprofiles state off
goto Command

:Fedia
echo Finding Media files in the system
echo Results will be generated in Results.txt file
echo If you had a file named results.txt its getting deleted
if exist results.txt (del results.txt)
echo. >NUL 2>results.txt
dir /s /a /b "*.mp3" "*.mp4" "*.mov" "*.aac" "*.mpeg" >>results.txt
goto Command

:Gpolicy
echo Redirecting you to the default template and the policy editor
timeout 2
start https://www.microsoft.com/en-us/download/confirmation.aspx?id=25250
timeout 4
start gpedit.msc
goto Command

