#!/bin/bash

# A function to display usage information and options
usage() {
  echo "Usage: $0 [OPTION]"
  echo "Options:"
  echo "  -c, --create    Create a new user account"
  echo "  -d, --delete    Delete an existing user account"
  echo "  -r, --reset     Reset the password of an existing user account"
  echo "  -l, --list      List all user accounts on the system"
  echo "  -h, --help      Display this help and exit"
}

# A function to check if a username is available
is_available() {
  local username=$1
  if id -u "$username" >/dev/null 2>&1; then
    return 1 # username exists
  else
    return 0 # username is available
  fi
}

# A function to create a new user account
create_account() {
  local username password
  read -p "Enter the new username: " username
  if is_available "$username"; then
    read -sp "Enter the new password: " password
    echo # print a newline
    useradd -m "$username" # create the user with a home directory
    echo "$username:$password" | chpasswd # set the password for the user
    echo "Account created successfully for $username"
  else
    echo "Username $username already exists"
    exit 1
  fi
}

# A function to delete an existing user account
delete_account() {
  local username
  read -p "Enter the username to delete: " username
  if is_available "$username"; then
    echo "Username $username does not exist"
    exit 1
  else
    userdel -r "$username" # delete the user and its home directory
    echo "Account deleted successfully for $username"
  fi
}

# A function to reset the password of an existing user account
reset_password() {
  local username password
  read -p "Enter the username to reset password: " username
  if is_available "$username"; then
    echo "Username $username does not exist"
    exit 1
  else
    read -sp "Enter the new password: " password
    echo # print a newline
    echo "$username:$password" | chpasswd # set the new password for the user
    echo "Password reset successfully for $username. New password is $password"
  fi
}

# A function to list all user accounts on the system
list_accounts() {
  cut -d: -f1,3 /etc/passwd # extract the usernames and UIDs from /etc/passwd file 
}

# Parse the command-line arguments and call the corresponding functions

if [ $# -eq 0 ]; then # no arguments provided
  usage # display usage information and exit 
elif [ $# -eq 1 ]; then # one argument provided 
  case $1 in 
    -c|--create) # create option 
      create_account # call create_account function 
      ;;
    -d|--delete) # delete option 
      delete_account # call delete_account function 
      ;;
    -r|--reset) # reset option 
      reset_password # call reset_password function 
      ;;
    -l|--list) # list option 
      list_accounts # call list_accounts function 
      ;;
    -h|--help) # help option 
      usage # display usage information and exit 
      ;;
    *) # invalid option 
      echo "Invalid option: $1" >&2 # print error message to stderr 
      usage # display usage information and exit 
      exit 2 
      ;;
   esac 
else # more than one argument provided 
   echo "Too many arguments" >&2 # print error message to stderr 
   usage # display usage information and exit 
   exit 3 
fi


