#!/bin/sh

# Trash Directory
TRASH="$HOME/.local/share/Trash"

while true; do
    echo "=============================="
    echo "           PAPERERA           "
    echo "=============================="
    echo "1) Veure el contingut de la paperera"
    echo "2) Netejar la paperera"
    echo "3) Sortir"
    echo
    printf "Selecciona una opció: "
    read -r OPTION

    case "$OPTION" in
        1)
            echo
            echo "Contingut de la paperera:"
            ls -la "$TRASH/files"
            echo
            ;;
        2)
            echo
            printf "Estàs segur que vols netejar la paperera? (Y/N): "
            read -r CONFIRM
            if [ "$CONFIRM" = "y" ] || [ "$CONFIRM" = "Y" ]; then
                rm -rf "$TRASH/files/"* "$TRASH/info/"*
                echo "Paperera netejada."
            else
                echo "Operació cancel·lada"
            fi
            echo
            ;;
        3)
            echo "Sortint..."
            exit 0
            ;;
        *)
            echo "Opció invàlida. Si us plau, tria una opció vàlida"
            ;;
    esac
done