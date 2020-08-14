#!/bin/bash
NOW=$(date +"%m-%d-%Y_%Hh%Mm")
> ssh-result/pre-test/ssh2es/result.csv
for HOST in `cat hosts.txt`
do
nc -z -v $HOST 22
if [ $? -eq 0 ]
then
echo "$HOST,SUCCESS"
echo "$HOST,SUCCESS" >> ssh-result/pre-test/ssh-passed_$NOW.csv
else
echo "$HOST,FAILED"
echo "$HOST,FAILED" >> ssh-result/pre-test/ssh-failed_$NOW.csv
fi
done
curl -sS -XDELETE localhost:9200/ssh-pre-test\* >/dev/null
cat ssh-result/pre-test/ssh-passed_$NOW.csv ssh-result/pre-test/ssh-failed_$NOW.csv > ssh-result/pre-test/ssh2es/result.csv
