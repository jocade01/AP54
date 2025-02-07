#!/bin/bash

archivo="precipitaciones.txt"

if [[ ! -f "$archivo" ]]; then
    echo "Error: No se encontró el archivo."
    exit 1
fi

suma=$(awk '{s+=$2} END {print s}' "$archivo")
contador=$(awk 'END {print NR}' "$archivo")

if [[ $contador -gt 0 ]]; then
    media=$(echo "scale=2; $suma / $contador" | bc)
    echo "La media de precipitaciones es $media"
else
    echo "No hay datos válidos para calcular la media."
fi

