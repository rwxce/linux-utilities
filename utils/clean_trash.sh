#!/bin/sh

# Trash Directory
TRASH="$HOME/.local/share/Trash"

while true; do
    echo "=============================="
    echo "           TRASH BIN          "
    echo "=============================="
    echo "1) View trash contents"
    echo "2) Empty trash"
    echo "3) Exit"
    echo
    printf "Select an option: "
    read -r OPTION

    case "$OPTION" in
        1)
            echo
            echo "Trash contents:"
            ls -la "$TRASH/files"
            echo
            ;;
        2)
            echo
            printf "Are you sure you want to empty the trash? (Y/N): "
            read -r CONFIRM
            if [ "$CONFIRM" = "y" ] || [ "$CONFIRM" = "Y" ]; then
                rm -rf "$TRASH/files/"* "$TRASH/info/"*
                echo "Trash emptied."
            else
                echo "Operation cancelled."
            fi
            echo
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid option."
            ;;
    esac
done