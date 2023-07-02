#! /bin/bash




# DIsplay if the user is the root user or not

# Display the UID

echo " Your UID is ${UID}"


# Display the Username

echo " You username is ${USER}"


# Display if the user is root or not

if [[ "${UID}" -eq 0 ]]
then
   echo " the user is root"
else
   echo " You are not root"
fi

