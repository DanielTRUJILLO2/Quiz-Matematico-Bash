#!/bin/bash

opcion=0

while (( opcion != 9 ))
do
    echo
    echo "QUIZ MATEMÁTICO"
    echo "1) Problemas de suma"
    echo "2) Problemas de resta"
    echo "3) Problemas de multiplicación"
    echo "4) Problemas de división"
    echo "9) Salir"
    echo -n "Elige una opción: "
    read opcion

    case $opcion in
        9)
            echo "Saliendo del quiz..."
            ;;
        *)
            echo "Opción inválida. Intenta nuevamente."
            ;;
    esac
done