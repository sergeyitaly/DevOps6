#!/bin/bash

# Дата у форматі ISO
current_date=$(date +"%Y-%m-%d")

# Створення директорій
mkdir -p ~/linux_p2/backup
mkdir -p ~/linux_p2/old_backup

# Прохід по всіх файлах у директорії ~/linux_p2
for file in ~/linux_p2/*.txt; do
    # Отримання назви файлу без шляху
    filename=$(basename "$file")
    
    # Виведення назви файлу
    echo "Архівую: $filename"
    
    # Архівування файлу
    tar -czf ~/linux_p2/backup/"${filename}_${current_date}.tar.gz" -C ~/linux_p2 "$filename"
done

# Перевірка і переміщення старих архівів
find ~/linux_p2/backup -type f -name "*.tar.gz" -mmin +3 -exec mv {} ~/linux_p2/old_backup/ \;
#!/bin/bash
