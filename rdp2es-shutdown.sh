#!/bin/bash
NOW=$(date +"%m-%d-%Y_%Hh%Mm")
echo ""
echo "RDP SHUTDOWN"
echo ""
> rdp-result/shutdown/rdp2es/result.csv
for HOST in `cat hosts.txt`
do
nc -z -v $HOST 3389
if [ $? -eq 0 ]
then
echo "$HOST,SUCCESS"
echo "$HOST,SUCCESS" >> rdp-result/shutdown/rdp-passed_$NOW.csv
else
echo "$HOST,FAILED"
echo "$HOST,FAILED" >> rdp-result/shutdown/rdp-failed_$NOW.csv
fi
done
curl -sS -XDELETE localhost:9200/rdp-shutdown\* >/dev/null
cat rdp-result/shutdown/rdp-passed_$NOW.csv rdp-result/shutdown/rdp-failed_$NOW.csv > rdp-result/shutdown/rdp2es/result.csv
