<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<style type="text/css">
body{margin: 0;padding: 0}
span{color: #CC0000; font-weight: bold;}
a{font-weight: bold; color: #666666;}
</style> 
</head>
<body style="margin: 0;padding: 0;">
<div style="background-color: #CC0000; color: #ffffff; padding-left: 10px;line-height:45px; font-size: 20px; font-weight:bold; ">
EasyMonitor Notice
</div>

<div style="padding: 10px">
<p>Hello,</p>
<p>Your monitor service is stopped. </p>
<p>
Monitor: <span>${type}-${name}: ${value}</span>
</p>
<p>
Stop time: <span>${stoptime?datetime}</span>
</p>
<p>
Please check the services you are monitoring.
</p>
</div>
<div style="background-color: #F4F4F4;padding-left: 10px;color: #777777;line-height:35px;">
EasyMonitor by <a href="www.easyproject.cn">easyproject.cn</a> 
</div>
</body>
</html>
