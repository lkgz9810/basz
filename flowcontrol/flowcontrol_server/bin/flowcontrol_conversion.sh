#!/bin/bash
while true
do
    echo "1. Celsius to Fahrenheit"
    echo "2. PipelineID to Integer"
    echo "3. PSI to kPa"
    echo "4. GPM to L/s"
    echo "5. SUS to cSt"
    echo "6. Back"
    echo ""
    read -p "Conversion: " choice
    echo ""

    case $choice in
        1)
            echo -n "Enter temperature in Celsius (input): "
            read celsius
            fahrenheit=$(Rscript --vanilla -e "cat(round((9/5) * $celsius + 32, 2))")
            echo ""
            echo "> ${fahrenheit}°F"
            ;;
        2)
            echo -n "Enter PipelineID (input): "
            read pipeline_id
            pipeline_numeric=$(Rscript --vanilla -e "cat(as.numeric(gsub('[[:alpha:]]', '', '$pipeline_id')))")
            echo ""
            echo "> $pipeline_numeric"
            ;;
        3)
            echo -n "Enter pressure in PSI (input): "
            read psi
            kpa=$(Rscript --vanilla -e "cat(round($psi * 6.89476, 2))")
            echo ""
            echo "> ${kpa} kPa"
            ;;

        4)
            echo -n "Enter flow rate in GPM (input): "
            read gpm
            lps=$(Rscript --vanilla -e "cat(round($gpm * 0.0630902, 2))")
            echo ""
            echo "> ${lps} L/s"
            ;;
        5)
            echo -n "Enter SUS viscosity (input): "
            read sus
            cSt=$(Rscript --vanilla -e "cat(round(10^(1.1513 + 0.539*log10($sus)), 2))")
            echo ""
            echo "> ${cSt} cSt"
            ;;
        6)
            exit
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            exit 
            ;;
    esac

    echo ""
done

