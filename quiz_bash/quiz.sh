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
        echo
        echo "¿Cuánto es $A $operador $B?"
        echo
        echo "--------------------------------------"
        echo -n "Ingresa tu respuesta: "
        read usuario

        if (( usuario == respuesta ))
        then
            clear
            echo
            echo
            echo "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄"
            echo "▌                            ▐"
            echo "▌    ¡Correcto! Muy bien     ▐"
            echo "▌                            ▐"
            echo "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"
            echo
            echo
            echo -n "➤ Presiona ENTER para volver al menú..."
            read
            return
        else
            if (( intentos < 3 ))
            then
                clear
                echo
                echo "Incorrecto. Inténtalo de nuevo..."
                echo
            fi
        fi

        (( intentos = intentos + 1 ))
    done

    clear
    echo
    echo
    echo "Se acabaron los intentos..."
    echo
    echo "La respuesta correcta era: $respuesta"
    echo "▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔"
    echo
    echo
    echo -n "➤ Presiona ENTER para volver al menú..."
    read
}

opcion=0

while (( opcion != 9 ))
do
    clear
    echo
    echo "╔══════════════════════════════════════╗"
    echo "║          QUIZ MATEMÁTICO             ║"
    echo "╚══════════════════════════════════════╝"
    echo
    echo "   [1]  Problemas de Suma"
    echo "   [2]  Problemas de Resta"
    echo "   [3]  Problemas de Multiplicación"
    echo "   [4]  Problemas de División"
    echo "   [9]  Salir"    
    echo
    echo "--------------------------------------"
    echo -n " ► Elige una opción: "
    read opcion

    case $opcion in
        1)
            clear
            echo
            echo
            echo "▛▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▜"
            echo "        ¡RESUELVE ESTA SUMA!           "
            echo
            A=$(( RANDOM % 101 ))
            B=$(( RANDOM % 101 ))
            respuesta=$(( A + B ))
            hacer_pregunta $A $B "+" $respuesta
        

            ;;
        2)
            clear
            echo
            echo
            echo "▛▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▜"
            echo "        ¡RESUELVE ESTA RESTA!          "
            echo
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
            clear
            echo
            echo
            echo "▛▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▜"
            echo "    ¡RESUELVE ESTA MULTIPLICACIÓN!     "
            echo
            A=$(( RANDOM % 100 + 1 ))
            B=$(( RANDOM % 10 + 1 ))
            respuesta=$(( A * B ))
            hacer_pregunta $A $B "*" $respuesta
            ;;
        4)
            clear
            echo
            echo
            echo "▛▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▜"
            echo "       ¡RESUELVE ESTA DIVISIÓN!        "
            echo
            A=$(( RANDOM % 20 + 1 ))
            B=$(( RANDOM % 10 + 1 ))
            A=$(( A * B ))
            respuesta=$(( A / B ))
            hacer_pregunta $A $B "/" $respuesta
            ;;
        9)
            echo "Saliendo del quiz..."
            ;;
        *)
            echo "Opción inválida. Intenta nuevamente."
            ;;
    esac
done