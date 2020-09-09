#!/bin/bash
NOW=$(date +"%m-%d-%Y_%Hh%Mm")
> rdp-result/rdp2es/result.csv
for HOST in `cat hosts.txt`
do


nc -w 1 -z -v $HOST 3389
if [ $? -eq 0 ]
then
echo "$HOST,SUCCESS" >> rdp-result/rdp-passed_$NOW.csv
else
echo "$HOST,FAILED" >> rdp-result/rdp-failed_$NOW.csv
fi
done
cat rdp-result/rdp-passed_$NOW.csv rdp-result/rdp-failed_$NOW.csv > rdp-result/rdp2es/result.csv
