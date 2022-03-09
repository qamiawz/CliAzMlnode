#!/bin/bash

quit=n 
while [  "$quit"   =   "n"  ] 
do 
echo 
echo "============================CREATEVM===================================="
echo "01. eastus"
echo "02. eastus2"
echo "03. southcentralus"
echo "04. westus"
echo "05. westus2"
echo "06. westus3"
echo "07. centralus"
echo "08. australiseast"
echo "09. southeastasia"
echo "10. northeurope"
echo "11. uksouth"
echo "12. westeurope"
echo "13. centralindia"
echo "14. koreacentral"
echo "15. canadacentral"
echo "16. francecentral"
echo "17. switzenlandnorth"
echo "18. eastasia"
echo "=====================CAC REGION DA TAO TRUOC DAY========================"
cat created.txt
echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 
1) locationset=eastus;; 
2) locationset=eastus2;;
3) locationset=southcentralus;;
4) locationset=westus;;
5) locationset=westus2;;  
6) locationset=westus3;;
7) locationset=centralus;;
8) locationset=australiseast;;
9) locationset=southeastasia;;
10) locationset=northeurope;;
11) locationset=uksouth;;
12) locationset=westeurope;;
13) locationset=centralindia;;
14) locationset=koreacentral;;
15) locationset=canadacentral;;
16) locationset=francecentral;;
17) locationset=switzenlandnorth;;
18) locationset=eastasia;;	 
	
Q|q) quit=y;; 
*) echo "Try Again" 
esac 
done 
echo "Select done"

echo "$locationset"
location="$locationset"
echo $location >> created.txt
echo > VMName.txt
#Name Generate
cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 12 | head -n 1 > VMName.txt
echo "------------------------------------------------------------------------"
cat VMName.txt
echo "------------------------------------------------------------------------"
tmpvmname=$(cat VMName.txt)
echo $tmpvmname
echo "$tmpvmname"_group >> GroupResource.txt
echo $location >> created.txt

# Tuy chinh VM
size=Standard_NC6s_v3
#size=DS1_v2
priority=Spot
adminusername=azureuser
adminpassword=12345678@Abc

az group create --location $locationset --resource-group "$tmpvmname"_group
sleep 2
az vm create --resource-group "$tmpvmname"_group --name $tmpvmname --priority $priority --image UbuntuLTS --size $size --public-ip-sku Standard --admin-username $adminusername --admin-password $adminpassword

echo "Done"