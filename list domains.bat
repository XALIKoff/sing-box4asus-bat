@echo off
chcp 65001 >nul

:: Загружаем конфигурацию
call config.bat

echo Получение текущего списка доменов...

plink.exe -ssh %SSH_USER%@%ROUTER_IP% -P %SSH_PORT% -pw %SSH_PASS% ^
"jq -r '.rules[].domain_suffix[]' %JSON_PATH%"

pause