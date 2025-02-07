#/bin/bash

pares=()
impares=()
total_pares=0
total_impares=0

while read -r numero; do
  if [ $((numero % 2)) -eq 0 ]; then
    pares+=("$numero")
    total_pares=$((total_pares + 1))
  else
    impares+=("$numero")
    total_impares=$((total_impares + 1))
  fi
done < numeros.txt

echo "Números pares:"
printf "%d\n" "${pares[@]}"
echo "Total de números pares: $total_pares"

echo -e "\nNúmeros impares:"
printf "%d\n" "${impares[@]}"
echo "Total de números impares: $total_impares"
