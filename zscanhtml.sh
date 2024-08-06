#!/bin/bash
# Versão 1.0 (ALPHA)

if [ -z "$1" ]; then
    echo "Uso: $0 <url>"
    echo "Exemplo: $0 www.alvo.com.br"
else
    url="$1"
    filename=$(basename "$url")
    wget -O "$filename" "$url"

grep href "$url"  | cut -d "/" -f 3 | grep "\."  | cut -d '"' -f 1 | grep -v "<l"  > "$url.txt"

for  readUrl in $(cat "$url.txt"  ); do host $readUrl | grep "has address"; done
fi

