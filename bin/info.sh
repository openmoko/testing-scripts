#!/bin/sh
DATE=`date`
echo "$0 run on $DATE" > /tmp/info.log
echo >> /tmp/info.log 
echo "Kernel Version" >> /tmp/info.log
uname -a >> /tmp/info.log
echo >> /tmp/info.log
cat /proc/cpuinfo >> /tmp/info.log
cat /proc/cmdline >> /tmp/info.log
cat /proc/modules >> /tmp/info.log
echo >> tmp.log
echo "GSM firmware version" >> /tmp/info.log
identvar=$(date +%s)
ptsvar=$(dbus-send --system --print-reply --type=method_call --dest=org.pyneo.muxer /org/pyneo/Muxer org.freesmartphone.GSM.MUX.AllocChannel string:$identvar | grep string | awk -F '"' '{ print $2 }')
chat -sv '' AT OK AT+CGMR OK > $ptsvar < $ptsvar 2>> /tmp/info.log

cat /etc/freesmartphone/oevents/rules.yaml >> /tmp/info.log

echo >> /tmp/info.log
ps ax >> /tmp/info.log
opkg list_installed >> /tmp/info.log 

rm /tmp/info.log.gz 2> /dev/null
gzip /tmp/info.log 
gzip -c /var/log/frameworkd.log >> /tmp/info.log.gz
gzip -c /var/log/paroli.log >> /tmp/info.log.gz
gzip -c /tmp/x.log >> /tmp/info.log.gz

