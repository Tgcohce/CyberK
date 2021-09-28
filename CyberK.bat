@echo off
:Start
color b
cls
echo        Welcome To CyberK customized command line tool 
echo               for some quick security fixes
echo               type help to see the commands
echo                     Shoutout to Atlas
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
if %Input% == Accounts Goto Accounts

%Input%
goto Command
pause

:Help
echo       ############################################
echo        #                 -Help-                 #
echo        #                                        #
echo        #   Help - Goes To Help                  #
echo        #   Clear - Clears Screen                #
echo        #   RDP - Brings Up RDP Settings         #
echo        #   Accounts - Disables Accounts         #
echo        #                                        #
echo       ############################################
echo.

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