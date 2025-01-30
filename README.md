# BAT Scripts for https://github.com/Dr4tez/sing-box4asus by Dr4tez

# Instructions for Using BAT Scripts

## Overview

These BAT scripts automate the process of managing domain list for sbs script by Dr4tez on an Asus router via SSH. The scripts use `plink.exe` (Putty) to establish an SSH connection and execute remote commands. Below is a breakdown of each script's functionality and necessary modifications.

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

## Required Modifications

Before using the scripts, update the following placeholders with your router’s credentials and settings:

- `ROUTER_IP` → Replace with your router’s actual IP address.
- `ROUTER_PORT` → Replace with the correct SSH port (default is 22, but yours may be different).
- `ROUTER_USER` → Replace with your SSH username.
- `ROUTER_PASSWORD` → Replace with your SSH password.
- `/PATH/TO/CONFIG.JSON` → Replace with the actual path to your domain list JSON file on the router.

**Example Change:**

```bat
plink.exe -ssh ROUTER_USER@ROUTER_IP -P ROUTER_PORT -pw ROUTER_PASSWORD "cat /PATH/TO/CONFIG.JSON"
```

---

## Notes

- Ensure `plink.exe` is available in the same directory or in your system’s PATH.
- The router must have `jq` installed for JSON parsing.
- Using SSH with a password is less secure; consider using SSH keys.

---
# BAT Скрипты для https://github.com/Dr4tez/sing-box4asus от Dr4tez
# Инструкция по использованию BAT-скриптов

## Обзор

Эти BAT-скрипты автоматизируют управление списком доменов для sbs скрипта Dr4tez на роутере через SSH. Для работы используется `plink.exe` (Putty), который подключается к роутеру и выполняет команды. Ниже описаны функции каждого скрипта и параметры, которые нужно изменить.

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

## Необходимые изменения

Перед использованием скриптов замените следующие значения на свои:

- `ROUTER_IP` → Укажите IP-адрес роутера.
- `ROUTER_PORT` → Укажите порт SSH (по умолчанию 22, но может быть другим).
- `ROUTER_USER` → Укажите имя пользователя SSH.
- `ROUTER_PASSWORD` → Укажите пароль SSH.
- `/PATH/TO/CONFIG.JSON` → Укажите путь к JSON-файлу со списком доменов на роутере.

**Пример изменения:**

```bat
plink.exe -ssh ROUTER_USER@ROUTER_IP -P ROUTER_PORT -pw ROUTER_PASSWORD "cat /PATH/TO/CONFIG.JSON"
```

---

## Примечания

- Убедитесь, что `plink.exe` находится в той же папке, что и скрипты, или прописан в переменной PATH.
- На роутере должен быть установлен `jq` для обработки JSON. (`opkg install jq`)
- Использование SSH с паролем менее безопасно — рекомендуется настроить ключи SSH.

