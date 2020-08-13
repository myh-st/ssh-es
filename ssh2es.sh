#!/bin/bash
for HOST in `cat hosts.txt`
do
nc -z -v $HOST 22
if [ $? -eq 0 ]
then
 > ssh-passed.csv
echo "$HOST,SUCCESS"
echo "$HOST,SUCCESS" >> ssh-passed.csv
else
echo "$HOST,FAILED"
echo "$HOST,FAILED" >> ssh-failed.csv
fi
done
