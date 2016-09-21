@echo off 
echo EasyMonitor starting...
echo The log in easymonitor.out
cd /d %~dp0
java -jar easymonitor-1.5.0-RELEASE-APPLICATION.jar
echo EasyMonitor started.