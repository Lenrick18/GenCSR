#!/bin/bash

echo "Have you modified DNS name in add_san.cnf file for $1 ?"
echo "1. YES"
echo "2. NO"
read Ans
if [ $Ans -eq "1" ]
then
        openssl req -out $1.csr -newkey rsa:2048 -nodes -keyout $1.key -config add_san.cnf
        mkdir $1
        mv $1.key $1/$1.key
        mv $1.csr $1/$1.csr
        echo "Done creating CSR and key file for $1 Thank you!!!"
else
        echo "Please modify DNS name in add_san.cnf file first, Thank you"
        sleep 3
        vim add_san.cnf
fi