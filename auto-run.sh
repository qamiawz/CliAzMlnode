
#!/bin/bash
while read p; do
	echo "$p"
az vm start --ids $(az vm list -g $p --query "[].id" -o tsv)
sh auto-run-custome.sh
sleep 3
az vm start --ids $(az vm list -g $p --query "[].id" -o tsv)
sleep 3
az vm start --ids $(az vm list -g $p --query "[].id" -o tsv)
	echo "Started Complete!!!"
	sleep 1
done <GroupResource.txt

echo "new sesssion" > run.log

echo "Next........."

