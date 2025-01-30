@echo off
chcp 65001 >nul
echo Получение текущего списка доменов...

plink.exe -ssh admin@ROUTER_IP -P 1024 -pw ROUTER_PASSWORD ^ 
"jq -r '.rules[].domain_suffix[]' /PATH/TO/CONFIG.JSON"

pause
