## Installation ##
1.Download TMITH - OVF from Microsoft Teams General > TMI > TMITH - OVF

2.Import OVF to VMware

3.Remove old project from /opt via command : rm -rf fping-es ssh-es

4.Download fping-es.zip and ssh-es.zip from Microsoft Teams Microsoft Teams General > TMI > TMITH - Code

5.Copy fping-es.zip and ssh-es.zip to /opt 

6.Unzip fping-es.zip and ssh-es.zip via command : unzip fping-es.zip && ssh-es.zip

## ELK Services ##
## KIBANA ##
Kibana Port 5601
UI 
http://<ip>:5601
Dashboard Name Fping
service kibana status/start/stop/restart

## ELASTICSEARCH ##
Elasticsearch Port 9200,9300
service elasticsearch status/start/stop/restart

## LOGSTASH ##
Logstash Port 9600
service logstash status/start/stop/restart
config path: /etc/logstash/conf.d/fping2es.conf

## Script ##
fping.sh and run.sh read a hosts.txt file line by line.if you want to edit ip please edit hosts.txt file        

Script path: 
/opt/fping-es  
/opt/ssh-es

## fping to send ICMP echo probes to network hosts ##
Run fping-es script
/opt/fping-es/fping.sh 
or
./fping.sh

## Check ssh and rdp port ##
Run ssh-es script
/opt/ssh-es/run.sh 
or
./run.sh
