#!/bin/bash

echo "Name of this CSR Request: "
read CSRName
echo "Have you modified DNS name in add_san.cnf file?"
echo "1. YES"
echo "2. NO"
read Ans
if [ $Ans -eq "1" ]
then
        openssl req -out $CSRName.csr -newkey rsa:2048 -nodes -keyout $CSRName.key -config /home/mobaxterm/certificate_request/add_san.cnf
        mkdir $CSRName
        mv $CSRName.key $CSRName/$CSRName.key
        mv $CSRName.csr $CSRName/$CSRName.csr
        echo "Done creating CSR and key file for $CSRName Thank you!!!"
else
        echo "Please modify DNS name in add_san.cnf file first, Thank you"
        sleep 3
        vim add_san.cnf
fi