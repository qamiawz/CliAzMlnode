#!/bin/bash
# Get var data: Group name, VM name + Subid    
#az vm start --resource-group "$tmpvmname_1"_group --name "$tmpvmname_1" --subscription $setsubid1

#Count line avaible in file _tempp/1.create.txt and get first number
numberline_2=$(wc -l _temp/2STOP.txt | cut -d' ' -f1)
# SET var value random from 1 > $numberline_1
RANDOMLINE_2=($(shuf -i "1-$numberline_2" -n 1))

# Read and send data line to _temp/2.stop.txt
valuelines_2=("$RANDOMLINE_2"p)

#action and move to 2SMV.txt
setstep3=$(sed -n $valuelines_2 _temp/2STOP.txt)
echo "Deallocate for: $setstep3"
echo $setstep3 >> _temp/3DEALLOCATE.txt
cmdactionfor3=$(head -1 _temp/$setstep3.2SVM.txt)
# Ra file random chua command : Hostserver48.VMS1.txt 

# Action stop
az vm deallocate $cmdactionfor3
sleep 2
#Rename file 1SMV to 2 SMV
mv _temp/$setstep3.2SVM.txt _temp/$setstep2.3SVM.txt
#Remove line in 1 SMV

# + Also remove it from _temp/FILE STOP
sed -i "$valuelines_2" _temp/2STOP.txt