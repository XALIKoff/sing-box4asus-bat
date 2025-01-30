@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Запрос ввода доменов у пользователя
set /p domains=Введите домены, разделенные запятыми: 

:: Флаг для проверки, были ли добавлены домены
set added=0

:: Перебор каждого домена из списка
for %%D in (%domains%) do (
    set domain=%%D
    set domain=!domain:,=!
    echo Проверяем домен: !domain!

    :: Проверяем, существует ли домен в JSON
    plink.exe -ssh admin@ROUTER_IP -P 1024 -pw ROUTER_PASSWORD "grep -q '\"!domain!\"' /PATH/TO/CONFIG.JSON && echo \"!domain! уже существует\" || echo \"!domain! не найден в JSON\""
    
    :: Если домен не найден, ставим флаг добавления
    plink.exe -ssh admin@ROUTER_IP -P 1024 -pw ROUTER_PASSWORD "grep -q '\"!domain!\"' /PATH/TO/CONFIG.JSON || echo 1"
    if !errorlevel! equ 0 (
        set added=1
    )
)

:: Если хотя бы один домен был добавлен, останавливаем службу
if %added% equ 1 (
    echo Останавливаем службу sbs...
    plink.exe -ssh admin@ROUTER_IP -P 1024 -pw ROUTER_PASSWORD "sbs stop"
    if %errorlevel% neq 0 (
        echo Не удалось остановить службу sbs.
        pause
        exit /b
    )
)

:: Перебор каждого домена из списка и добавление в JSON
for %%D in (%domains%) do (
    set domain=%%D
    set domain=!domain:,=!
    echo Добавляем домен: !domain!

    :: Добавляем домен в JSON
    plink.exe -ssh admin@ROUTER_IP -P 1024 -pw ROUTER_PASSWORD "grep -q '\"!domain!\"' /PATH/TO/CONFIG.JSON || sed -i '/\"domain_suffix\": \[/a\    \"!domain!\",' /PATH/TO/CONFIG.JSON"
)

:: Запуск службы после изменений
echo Запускаем службу sbs...
plink.exe -ssh admin@ROUTER_IP -P 1024 -pw ROUTER_PASSWORD "sbs start"
if %errorlevel% neq 0 (
    echo Не удалось запустить службу sbs.
    pause
    exit /b
)

echo Проверка завершена, домены добавлены (если их не было).
pause