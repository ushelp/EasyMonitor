# EasyMonitor Application 



## 中文

**EasyMonitor Application** 是开箱即用的 EasyMonitor 监控应用。按需配置您的监控服务，启动即可。


### 使用步骤
 
1. **配置监控服务**

 参考 `easymonitor.properties` 中的示例，配置您的监控服务。

2. **运行 EasyMonitor**

 - **Windows**(Sometimes you must '`Run as Administrator`')
 
   ```
   Start:  bin/startup.bat
   Stop:   bin/shutdown.bat
   ```

 - **Linux** 
 
   ```
   Start:  ./bin/startup.sh
   Stop:   ./bin/shutdown.sh
   ```

3. **可选配置**

  1. **邮件模板 Mail template**  
  
     修改 '`template/mail.tpl`' 定制您的邮件提醒内容。

  2. **日志 Logger**  
  
     配置 `log4j.properties` 日志输出。 



## English

**EasyMonitor Application** can run as application. Configure your monitoring service as needed, can be activated.

### Steps for usage
 
1. **Configuration monitor services**

 `Easymonitor.properties` the reference sample, configure your monitoring service.

2. **Run EasyMonitor**

 - **Windows**(Sometimes you must '`Run as Administrator`')
 
   ```
   Start:  startup.bat
   Stop:   shutdown.bat
   ```

 - **Linux** 
 
   ```
   Start:  ./startup.sh
   Stop:   ./shutdown.sh
   ```

3. **Optional**

  1. **Mail template**
  
     You can edit '`template/mail.tpl`' to customize send mail content.

  2. **Logger**
  
     configure `log4j.properties` to out log.  




## End

