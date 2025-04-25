#!/bin/bash

mkdir -p commits_unzipped

for i in {0..50}; do
    zip_file="commits_zipped/commits_opi/commit${i}.zip"
    unzip_dir="commits_unzipped/commit${i}"
    
    mkdir -p "$unzip_dir"
    
    if [ -f "$zip_file" ]; then
        unzip -q "$zip_file" -d "$unzip_dir"
        echo "Распакован $zip_file в $unzip_dir"
    else
        echo "Файл $zip_file не найден, пропускаем"
    fi
done

echo "Готово!"