#!/bin/bash

#########################################################################
# Author : Sandesh Pai                     
# Date : 31-07-2023
# Repo : prajwalpd7     
# Purpose : 7 days Bash Script challenge ---- DAY1 (Train with Shubham)
#########################################################################


# TASK-1 : Comments
# Comments are used to add the something value which is not a code. To display the comments to the code using this symbol "#"

#################################################################################################

# TASK-2 : Echo
# The "echo" command is used to print the statement
# For Example:
echo "Welcome to the DevOps World"
echo "My Guru TRAIN WITH SHUBHAM -- SHUBHAM SIR"

################################################################################################

# TASK-3 : Variables
# Variables in bash are used to store data and can be referenced by their name.
Studentname="Sandesh Pai"

###############################################################################################

# TASK-4 : Using Variables
# Can use variables to display the fullpath of the information
echo "Dear $Studentname. Congratulations that you have started the Day1"

###############################################################################################

# TASK-5 : Using Built-in Variables
# Bash provides several buit-in variables that hold useful information.

# Student name <------------------------------ (Comments)
read_input "Enter the student name" $text_name

# Student city
read_input "Enter the student city" $text_city

# output statement

echo "Student Name: $text_name"
echo "Student City: $text_city"

################################################################################################

# TASK-6 : Wildcards
# Wildcards are special characters used to perform pattern matching when working with files.
echo "Files with .sh extension in the current directory:"
ls*.sh
