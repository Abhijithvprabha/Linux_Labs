#! /bin/bash
echo -e "Ente the name of the file you want to check \c: "
read filename

if [ -f $filename ]
then
 echo " the file exists"
 if [ -w $filename ]
 then
  echo " the file has write permissions"
 else
  echo " the files doesn't have write permissions"
 fi
else
 echo " the files doesn't exit"
fi
