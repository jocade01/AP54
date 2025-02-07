#!/bin/bash


usuarios_linux=0
usuarios_windows=0
total_procesos_linux=0
total_procesos_windows=0

while read -r linea; do
  usuario=$(echo "$linea" | awk '{print $1}')
  sistema_operativo=$(echo "$linea" | awk '{print $2}')
  procesos=$(echo "$linea" | awk '{print $3}')

  if [[ "$sistema_operativo" == "Linux" ]]; then
    usuarios_linux=$((usuarios_linux + 1))
    total_procesos_linux=$((total_procesos_linux + procesos))
  elif [[ "$sistema_operativo" == "Windows" ]]; then
    usuarios_windows=$((usuarios_windows + 1))
    total_procesos_windows=$((total_procesos_windows + procesos))
  fi
done < listado.txt

echo "Usuarios con Linux: $usuarios_linux"
echo "Total de procesos en Linux: $total_procesos_linux"
echo -e "\nUsuarios con Windows: $usuarios_windows"
echo "Total de procesos en Windows: $total_procesos_windows"
