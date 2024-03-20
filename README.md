# Скрипт конфигурации маршрутизации IP-адресов для роутеров Keenetic

Этот сценарий PowerShell автоматизирует написание команд маршрутизации на основе предоставленных IP-адресов и масок подсетей. Ниже приведено руководство по эффективному использованию сценария.

## Предварительные требования
- Среда PowerShell.
- Базовое понимание IP-адресации и концепций подсетей.

## Использование

1. **Клонируйте или загрузите сценарий:**
   - Клонируйте этот репозиторий или загрузите файл скрипта (`route-config.ps1`) напрямую.

2. **Подготовьте файл с IP-адресами:**
   - Создайте файл с названием `ip.txt` в той же директории, что и скрипт.
   - Добавьте IP-адреса и маски подсетей в следующем формате: `x.x.x.x/x`.

3. **Понимание форматов IP-адресов:**
   - Скрипт поддерживает IP-адреса как в нотации CIDR (x.x.x.x/x), так и индивидуальные адреса хостов (x.x.x.x).

4. **Запустите сценарий:**
   - Откройте PowerShell в директории с скриптом.
   - Запустите сценарий с помощью команды `.\route-config.ps1`.

5. **Проверьте результаты:**
   - После выполнения скрипта вы увидите созданные маршрутные команды, а также общее количество команд.

## Примеры IP-адресов

- `192.168.1.0/24` - Сеть в нотации CIDR.
- `10.0.0.1` - Один IP-адрес хоста.

## Примечание
Для более подробной информации о форматах IP-адресов и других функциях скрипта обратитесь к комментариям в самом скрипте.