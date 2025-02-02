# BAT Scripts for https://github.com/Dr4tez/sing-box4asus by Dr4tez

## Instructions for Using BAT Scripts

### Overview

These BAT scripts automate the process of managing the domain list for the `sbs` script by Dr4tez on an Asus router via SSH. The scripts use `plink.exe` (Putty) to establish an SSH connection and execute remote commands. Configuration variables (such as router IP, SSH credentials, and JSON file path) are stored in `config.bat`, allowing for easier customization.

---

## Script Descriptions

### 1. `add_domains.bat`

**Function:**
- Prompts the user to enter domain names separated by commas.
- Checks if each domain already exists in the JSON file on the router.
- If a new domain is found:
  - Stops the `sbs` service.
  - Adds the domain to the JSON file.
  - Restarts the `sbs` service.

### 2. `remove_domains.bat`

**Function:**
- Prompts the user to enter domains to remove.
- Checks if each domain exists in the JSON file.
- If a domain is found:
  - Stops the `sbs` service.
  - Removes the domain from the JSON file.
  - Restarts the `sbs` service.

### 3. `list_domains.bat`

**Function:**
- Retrieves the current domain list from the JSON file and displays it in the console.

### 4. `sbs_stop.bat`

**Function:**
- Stops the `sbs` service on the router.

### 5. `sbs_start.bat`

**Function:**
- Starts the `sbs` service on the router.

### 6. `sbs_restart.bat`

**Function:**
- Restarts the `sbs` service on the router.

---

## Configuration

Before using the scripts, update `config.bat` with your router’s credentials and settings:

```bat
@echo off
set ROUTER_IP=192.168.1.1
set SSH_PORT=22
set SSH_USER=admin
set SSH_PASS=your_password
set JSON_PATH=/jffs/addons/sing-box-script/my_domains.json
```

---

## Notes

- Ensure `plink.exe` is available in the same directory or in your system’s PATH.
- The router must have `jq` installed for JSON parsing (`opkg install jq`).
- Using SSH with a password is less secure; consider using SSH keys.

---

# BAT Скрипты для https://github.com/Dr4tez/sing-box4asus от Dr4tez

## Инструкция по использованию BAT-скриптов

### Обзор

Эти BAT-скрипты автоматизируют управление списком доменов для `sbs` скрипта Dr4tez на роутере через SSH. Для работы используется `plink.exe` (Putty), который подключается к роутеру и выполняет команды. Все настройки (IP роутера, учетные данные SSH, путь к JSON-файлу) вынесены в `config.bat` для удобства настройки.

---

## Описание скриптов

### 1. `add_domains.bat`

**Функция:**
- Запрашивает у пользователя домены через запятую.
- Проверяет, есть ли каждый домен в JSON-файле на роутере.
- Если домена нет:
  - Останавливает сервис `sbs`.
  - Добавляет домен в JSON-файл.
  - Запускает `sbs`.

### 2. `remove_domains.bat`

**Функция:**
- Запрашивает у пользователя список доменов для удаления.
- Проверяет, есть ли домены в JSON-файле.
- Если домен найден:
  - Останавливает сервис `sbs`.
  - Удаляет домен из JSON-файла.
  - Запускает `sbs`.

### 3. `list_domains.bat`

**Функция:**
- Отображает текущий список доменов из JSON-файла.

### 4. `sbs_stop.bat`

**Функция:**
- Останавливает сервис `sbs` на роутере.

### 5. `sbs_start.bat`

**Функция:**
- Запускает сервис `sbs` на роутере.

### 6. `sbs_restart.bat`

**Функция:**
- Перезапускает сервис `sbs` на роутере.

---

## Конфигурация

Перед использованием скриптов укажите свои параметры в `config.bat`:

```bat
@echo off
set ROUTER_IP=192.168.1.1
set SSH_PORT=22
set SSH_USER=admin
set SSH_PASS=your_password
set JSON_PATH=/jffs/addons/sing-box-script/my_domains.json
```

---

## Примечания

- Убедитесь, что `plink.exe` находится в той же папке, что и скрипты, или прописан в переменной PATH.
- На роутере должен быть установлен `jq` для обработки JSON (`opkg install jq`).
- Использование SSH с паролем менее безопасно — рекомендуется настроить ключи SSH.
