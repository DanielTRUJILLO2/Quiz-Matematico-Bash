#!/bin/bash

hacer_pregunta()
{
    A=$1
    B=$2
    operador=$3
    respuesta=$4

    intentos=1

    while (( intentos <= 3 ))
    do
        echo -n "¿Cuánto es $A $operador $B? "
        read usuario

        if (( usuario == respuesta ))
        then
            echo "¡Correcto! Muy bien."
            return
        else
            if (( intentos < 3 ))
            then
                echo "Incorrecto. Inténtalo de nuevo."
            fi
        fi

        (( intentos = intentos + 1 ))
    done

    echo "Se acabaron los intentos. La respuesta correcta era: $respuesta"
}

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
        1)
            A=$(( RANDOM % 101 ))
            B=$(( RANDOM % 101 ))
            respuesta=$(( A + B ))
            hacer_pregunta $A $B "+" $respuesta
            ;;
        2)
            A=$(( RANDOM % 101 ))
            B=$(( RANDOM % 101 ))

            if (( A < B ))
            then
                temp=$A
                A=$B
                B=$temp
            fi

            respuesta=$(( A - B ))
            hacer_pregunta $A $B "-" $respuesta
            ;;
        3)
            A=$(( RANDOM % 100 + 1 ))
            B=$(( RANDOM % 10 + 1 ))
            respuesta=$(( A * B ))
            hacer_pregunta $A $B "*" $respuesta
            ;;
        9)
            echo "Saliendo del quiz..."
            ;;
        *)
            echo "Opción inválida. Intenta nuevamente."
            ;;
    esac
done