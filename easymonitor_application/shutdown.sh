echo 'EasyMonitor shutdown...'
ps -ef|grep easymonitor.*.jar | grep -v grep |awk '{print $2}' | xargs kill -9
echo 'EasyMonitor stoped.'
