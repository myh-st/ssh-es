#!/bin/bash
NOW=$(date +"%m-%d-%Y_%Hh%Mm")
> rdp-result/post-test/rdp2es/result.csv
for HOST in `cat hosts.txt`
do
nc -z -v $HOST 3389
if [ $? -eq 0 ]
then
echo "$HOST,SUCCESS" >> rdp-result/post-test/rdp-passed_$NOW.csv
else
echo "$HOST,FAILED" >> rdp-result/post-test/rdp-failed_$NOW.csv
fi
done
curl -sS -XDELETE localhost:9200/rdp-post-test\* >/dev/null
cat rdp-result/post-test/rdp-passed_$NOW.csv rdp-result/post-test/rdp-failed_$NOW.csv > rdp-result/post-test/rdp2es/result.csv
