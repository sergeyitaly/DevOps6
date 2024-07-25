#!/bin/bash

# Створення директорії
mkdir -p ~/linux_p2

# Створення файлів з рандомними даними
for i in {1..20}; do
    head -c 100 </dev/urandom > ~/linux_p2/${i}.txt
done