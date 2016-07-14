@echo off 
echo EasyMonitor started...
echo The log in easymonitor.out
cd /d %~dp0
java -jar easymonitor-1.3.0-RELEASE-APPLICATION.jar
echo EasyMonitor started.