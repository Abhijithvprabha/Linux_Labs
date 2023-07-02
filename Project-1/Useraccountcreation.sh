# Account creation , password setting , set password to expire on first login, display the host where account is created 

#! /bin/bash

# This script creates a new user on the system


# Must enforce execution with superuser (root) privileges. If the script is not executed with superuser privileges, it should not attempt to create a user and return an exit status of 1.

if [[ "${UID}" -ne 0 ]]
then
    echo " Please run the with sudo or as root"
    exit 1
fi


# Get the  username(login), the person name, password for the account

read -p "Enter the username to create: " USER_NAME

read -p "Enter the person real name(display name or contents for the description field): " COMMENT

read -p "Enter the password for the account:" PASSWORD

# Create the account

useradd -c "${COMMENT}" -m "${USER_NAME}"

# check to see if the useradd comment worked

if [[ "${?}" -ne 0 ]]
then
    echo "The user account cannot be created"
    exit 1
fi

# Set the password

echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
   echo "The password cannot be set for the useraccount"
   exit 1

fi


#Force the password change on first login

passwd --expire ${USER_NAME}


# Display username , password , and the host for the account will be displayed

echo

echo "username: $USER_NAME"

echo

echo "password: $PASSWORD"

echo

echo "Hostname: $HOSTNAME"

exit 0


