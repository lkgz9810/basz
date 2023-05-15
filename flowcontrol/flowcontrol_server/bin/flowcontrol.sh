#!/bin/bash
BASE=$(readlink -f $(dirname "$(readlink -f $0)"))

echo ""
echo $(jq -r .id /data/data.json)
echo ""
echo "RESTRICTED ACCESS: Authorized personnel only"    

while true
do
    echo ""
    echo "Please select an option:"
    echo ""
    echo "1. Pipeline Status"
    echo "2. Unit Conversion"
    echo "3. Remote Access token"
    echo "4. Exit"
    echo ""
    read -p "Option: " choice
    echo ""

    case $choice in
        1)
            echo "Pipeline Status:"
            echo ""
            read -p "Enter variables to view: " argument
            /bin/bash -c "$BASE/flowcontrol_status.sh '$argument'"
            ;;
        2)
            echo "Unit Conversion:"
            echo ""
            /bin/bash -c "$BASE/flowcontrol_conversion.sh"
            ;;
        3)
            echo "Remote Access Token:"
            echo ""
            read -p "Enter username: " username 
            read -p "Enter password: " password
            /bin/bash -c "$BASE/flowcontrol_token.sh '$username' '$password'"
            ;;

        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            exit 1
            ;;
    esac

    echo ""
done

