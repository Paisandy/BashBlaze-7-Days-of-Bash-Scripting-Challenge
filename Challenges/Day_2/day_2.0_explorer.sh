#!/bin/bash


###########################################################
# Author : Sandesh Pai
# Date : 01-08-2023
# Repo : prajwalpd7
# Purpose : TASK - DAY-2 TWS
###########################################################

## PART-1: File and Directory Exploration

echo -e "Welcome to the Interactive File and Directory Explorer!\n"

sleep 2s #for the 2sec delay output using "sleep" command
echo -e "Files and Directories in the Current Path:\n"

sleep 2s

# Main Statement
# First we are using ls -lh command which shows all the file name with storage
# After the output we have added a pipe "|" to filter it and to get a exact output to show only file & storage
# using this "NR > 1" Command to remove the first line blank space. It removes first line contains of the header of the output
while true; do
       ls -lh | awk 'NR > 1 {print $9 " " $5}'

       read -p "Press 'ENTER' to continue or type 'exit' to quit:" output

       if [ "$output" = "exit" ]; then
               break
       fi
done

#################################################################################################################################################

## PART-2: Character Counting

echo -e "Now, let's do Character Counting!\n"
sleep 2s

while true; do
        read -p "Enter a line of text (Press Enter without text to exit):" sentence
        length=${#sentence}

        if [[ $length -eq 0 ]]; then
                echo "Exiting the Interactive Explorer. Goodbye!"
                break
        fi

        echo "Character Count: $length"
done
