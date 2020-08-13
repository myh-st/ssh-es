#!/bin/bash
NOW=$(date +"%m-%d-%Y_%Hh%Mm")
> ssh-result/ssh2es/result.csv
for HOST in `cat hosts.txt`
do
nc -z -v $HOST 22
if [ $? -eq 0 ]
then
echo "$HOST,SUCCESS" >> ssh-result/ssh-passed_$NOW.csv
else
echo "$HOST,FAILED" >> ssh-result/ssh-failed_$NOW.csv
fi
done
cat ssh-result/ssh-passed_$NOW.csv ssh-result/ssh-failed_$NOW.csv > ssh-result/ssh2es/result.csv
