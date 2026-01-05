#!/bin/bash

# Configuración
PHONE_NUMBER="570000000000" 
FILE_PATH="$1"

if [ -z "$FILE_PATH" ]; then
    echo "Uso: $0 <ruta_del_archivo>"
    exit 1
fi

if [ ! -f "$FILE_PATH" ]; then
    echo "Error: El archivo no existe"
    exit 1
fi

FILENAME=$(basename "$FILE_PATH")
adb push "$FILE_PATH" "/sdcard/Buffer/$FILENAME"

adb shell am start -a android.intent.action.SEND \
    -t "$(file --mime-type -b "$FILE_PATH")" \
    --eu android.intent.extra.STREAM "file:///sdcard/Buffer/$FILENAME" \
    -p com.whatsapp \
    --es jid "${PHONE_NUMBER}@s.whatsapp.net"