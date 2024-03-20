function Convert-LengthAddressToIPv4Mask([int] $maskLength)
{
    $binaryMask = "1" * $maskLength + "0" * (32 - $maskLength)
    $octets = @()
    for ($i = 0; $i -lt 4; $i++) {
        $octet = [convert]::ToInt32($binaryMask.Substring($i * 8, 8), 2)
        $octets += $octet
    }
    return $octets -join "."
}

# Путь к файлу с адресами
$filePath = ".\ip.txt"

# Проверяем, существует ли файл
if (Test-Path $filePath) {
    # Считываем все строки из файла
    $addresses = Get-Content $filePath
    
    # Переменная для хранения общего количества команд
    $totalCount = 0
    
    # Цикл по каждому адресу
    foreach ($address in $addresses) {
        # Проверка формата адреса (x.x.x.x/x)
        if ($address -match "(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/(\d{1,2})") {
            # Разбиваем адрес на IP и маску
            $ip = $matches[1]
            $maskLength = [int]$matches[2]

            # Получаем адрес IPv4 маски подсети
            $subnetMask = Convert-LengthAddressToIPv4Mask -maskLength $maskLength
            
            # Формируем команду
            $command = "route ADD $ip MASK $subnetMask 10.8.0.1"
        }
        else {
            # Разбиваем адрес на части
            $parts = $address.Split('.')
            
            # Проверяем последний октет адреса
            if ($parts[-1] -eq '0') {
                # Формируем команду для подсетей
                $command = "route ADD $address MASK 255.255.255.0 10.8.0.1"
            } else {
                # Формируем команду для одного хоста
                $command = "route ADD $address MASK 255.255.255.255 10.8.0.1"
            }
        }
        
        # Выводим текущую команду в консоль
        Write-Host $command
        
        # Добавляем текущую команду в файл
        Add-Content -Path ".\routes.txt" -Value $command
        
        # Увеличиваем счетчик общего количества команд
        $totalCount++
    }
    
    # Выводим общее количество команд в консоль
    Write-Host "Total commands: $totalCount"
} else {
    Write-Host "File not found: $filePath"
}
