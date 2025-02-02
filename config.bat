@echo off
chcp 65001 >nul
:: Конфигурационный файл для переменных

set ROUTER_IP=192.168.1.1
set SSH_PORT=22
set SSH_USER=admin
set SSH_PASS=password
set JSON_PATH=/jffs/addons/sing-box-script/my_domains.json