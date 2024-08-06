#!/bin/bash

# Create command.sh script
cat << 'EOF' > ./command.sh
#!/bin/bash
# Create directory and files with random data

mkdir -p ~/linux_p2 && \
for i in {1..20}; do
  base64 /dev/urandom | head -c 100 > ~/linux_p2/$i.txt
done
EOF

# Make command.sh executable
chmod +x ./command.sh

# Create script.sh script
cat << 'EOF' > ./script.sh
#!/bin/bash
# Archiving script

mkdir -p ~/linux_p2/backup
mkdir -p ~/linux_p2/old_backup

current_date=$(date +%Y-%m-%d)

for file in ~/linux_p2/*.txt; do
  file_name=$(basename "$file")
  echo "Processing $file_name"
  tar -czf ~/linux_p2/backup/${file_name}_${current_date}.tar.gz -C ~/linux_p2 "$file_name"
done

# Move old backups to old_backup directory
find ~/linux_p2/backup -name "*.tar.gz" -mmin +3 -exec mv {} ~/linux_p2/old_backup/ \;
EOF

# Make script.sh executable
chmod +x ./script.sh

# Create directories and log files for the main script
mkdir -p ~/linux_p2/log

# Set up cron job to run script.sh every 5 minutes
(crontab -l ; echo "*/5 * * * * ./script.sh >> ~/linux_p2/log/backup.log 2>> ~/linux_p2/log/err_backup.log") | sort - | uniq - | crontab -

# Run command.sh to create files with random data
./command.sh

