@echo off
chcp 65001 >nul
plink.exe -ssh admin@ROUTER_IP -P 1024 -pw ROUTER_PASSWORD "sbs restart"