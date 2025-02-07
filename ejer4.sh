#!/bin/bash

archivo="precipitaciones.txt"
dias=("Lunes" "Martes" "Miércoles" "Jueves" "Viernes" "Sábado" "Domingo")

if [[ ! -f "$archivo" ]]; then
    echo "Error: No se encontró el archivo."
    exit 1
fi

contador=0

while read -r linea; do
    litros=$(echo "$linea" | awk '{print $2}')
    if [[ "$litros" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        if (( $(echo "$litros == 0" | bc -l) )); then
            dia=${dias[$contador % 7]}
            echo "$dia"
        fi
    fi
    ((contador++))
done < "$archivo"

