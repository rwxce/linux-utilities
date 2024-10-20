#!/bin/sh

while true; do
    echo "=============================="
    echo "      SERVICE MANAGEMENT      "
    echo "=============================="
    echo "1) View active services"
    echo "2) Start a service"
    echo "3) Stop a service"
    echo "4) Enable a service (start at boot)"
    echo "5) Disable a service (do not start at boot)"
    echo "6) Exit"
    echo
    printf "Select an option: "
    read -r OPTION

    case "$OPTION" in
        1)
            echo
            echo "Active services:"
            systemctl list-units --type=service --state=active
            echo
            ;;
        2)
            echo
            printf "Enter the name of the service to start: "
            read -r SERVICE_NAME
            sudo systemctl start "$SERVICE_NAME"
            echo "Service '$SERVICE_NAME' started."
            echo
            ;;
        3)
            echo
            printf "Enter the name of the service to stop: "
            read -r SERVICE_NAME
            sudo systemctl stop "$SERVICE_NAME"
            echo "Service '$SERVICE_NAME' stopped."
            echo
            ;;
        4)
            echo
            printf "Enter the name of the service to enable: "
            read -r SERVICE_NAME
            sudo systemctl enable "$SERVICE_NAME"
            echo "Service '$SERVICE_NAME' enabled (will start at boot)."
            echo
            ;;
        5)
            echo
            printf "Enter the name of the service to disable: "
            read -r SERVICE_NAME
            sudo systemctl disable "$SERVICE_NAME"
            echo "Service '$SERVICE_NAME' disabled (will not start at boot)."
            echo
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid option."
            ;;
    esac
done