#!/bin/bash
NOW=$(date +"%m-%d-%Y_%Hh%Mm")
echo ""
echo "RDP PRE-TEST"
echo ""
if [  ! -d rdp-result/pre-test/rdp2es ]; then
mkdir -p rdp-result/pre-test/rdp2es
fi
> rdp-result/pre-test/rdp2es/result.csv
for HOST in `cat hosts.txt`
do


nc -w 1 -z -v $HOST 3389
if [ $? -eq 0 ]
then
echo "$HOST,SUCCESS"
echo "$HOST,SUCCESS" >> rdp-result/pre-test/rdp-passed_$NOW.csv
else
echo "$HOST,FAILED"
echo "$HOST,FAILED" >> rdp-result/pre-test/rdp-failed_$NOW.csv
fi
done
curl -sS -XDELETE localhost:9200/rdp-pre-test\* >/dev/null
cat rdp-result/pre-test/rdp-passed_$NOW.csv rdp-result/pre-test/rdp-failed_$NOW.csv > rdp-result/pre-test/rdp2es/result.csv
