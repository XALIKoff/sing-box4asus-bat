@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Загружаем конфигурацию
call config.bat

:: Флаг для проверки, были ли удалены домены
set removed=0

echo Введите домены для удаления, разделенные запятыми:
set /p domains=

:: Перебираем домены для удаления
for %%D in (%domains%) do (
    set domain=%%D
    set domain=!domain:,=!
    echo Проверяем домен на удаление: !domain!

    :: Проверяем, существует ли домен в JSON
    plink.exe -ssh %SSH_USER%@%ROUTER_IP% -P %SSH_PORT% -pw %SSH_PASS% "grep -q '\"!domain!\"' %JSON_PATH% && echo \"!domain! найден в JSON\" || echo \"!domain! не найден в JSON\""
    
    :: Если домен найден в JSON, ставим флаг удаления
    plink.exe -ssh %SSH_USER%@%ROUTER_IP% -P %SSH_PORT% -pw %SSH_PASS% "grep -q '\"!domain!\"' %JSON_PATH% && echo 1 || echo 0" > temp_result.txt
    set /p result=<temp_result.txt
    if !result! equ 1 (
        set removed=1
    )
)

:: Если хотя бы один домен был найден для удаления, останавливаем службу
if %removed% equ 1 (
    echo Останавливаем службу sbs...
    plink.exe -ssh %SSH_USER%@%ROUTER_IP% -P %SSH_PORT% -pw %SSH_PASS% "sbs stop"
    if %errorlevel% neq 0 (
        echo Не удалось остановить службу sbs.
        pause
        exit /b
    )
)

:: Перебираем домены и удаляем их из JSON
for %%D in (%domains%) do (
    set domain=%%D
    set domain=!domain:,=!
    echo Удаляем домен: !domain!

    :: Удаляем домен из JSON
    plink.exe -ssh %SSH_USER%@%ROUTER_IP% -P %SSH_PORT% -pw %SSH_PASS% "sed -i '/\"!domain!\",/d' %JSON_PATH%"
)

:: Запуск службы после изменений
echo Запускаем службу sbs...
plink.exe -ssh %SSH_USER%@%ROUTER_IP% -P %SSH_PORT% -pw %SSH_PASS% "sbs start"
if %errorlevel% neq 0 (
    echo Не удалось запустить службу sbs.
    pause
    exit /b
)

echo Указанные домены удалены (если они существовали).
pause