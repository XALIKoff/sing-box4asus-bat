@echo off
chcp 65001 >nul

:: Загружаем конфигурацию
call config.bat

plink.exe -ssh %SSH_USER%@%ROUTER_IP% -P %SSH_PORT% -pw %SSH_PASS% "sbs start"