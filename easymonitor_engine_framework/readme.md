# EasyMonitor Engine Framework 



## 中文

EasyMonitor 同时是一个免费开源跨平台的 Java 监控引擎框架（**Java Monitor Engine Framework**），提供统一规范的监控配置和核心调度。

您只需要开发监控实现（`MonitorValidator`）和通知发送者（`Sender`），按需配置即可。


### 使用步骤

1. **Maven dependency**

 ```XML
 <dependency>
     <groupId>cn.easyproject</groupId>
     <artifactId>easymonitor</artifactId>
     <version>1.5.0-RELEASE</version>
 </dependency>
 ```

2. 自定义 `MonitorValidator` 监控或 `Sender` 通知发送者实现类

3. 配置 `easymonitor.properties`

4. 启动  
  ```JAVA
  public static void main(String[] args) {
      new EasyMonitor().start();
  }
  ```
   

### **自定义 MonitorValidator**

 仅需实现 `MonitorValidator` 接口，根据判断规则返回 `ValidatorResult` 结果即可。

 - **MonitorValidator 监控实现示例**
 
    ```JAVA
    /**
     * User Monitor Example. 
     * To monitor the file whether exists.
     */
    public class FileMonitorValidator implements MonitorValidator {
    
    	public ValidatorResult validate(MonitorConfiguration configuration) {
    		// ONLY A DEMO
    		System.out.println("file check !");
    		
    		ValidatorResult result;
    		
    		File file=new File(configuration.getValue());
    		
    		if(file.exists()){
    			result=ValidatorResult.VALIDATION;
    		}else{
    			result=ValidatorResult.INVALIDATION;
    		}
    		
    		return result;
    	}
    }
    ```

 - **ValidatorResult 验证结果枚举选项**
 
    ``` JAVA
    /**
     * 检查通过
     */
    VALIDATION, 
    /**
     * 检查未通过
     */
    INVALIDATION, 
    /**
     * 忽略本次检测结果
     */
    IGNORE;
    ```

 - **配置 easymonitor.user.Name 类型的自定义监控**  
    注意指定 `validatorClass` 配置参数。
   
    ```properties
    # Example:
    easymonitor.user.fileExistsMonitor=data.txt
    easymonitor.user.fileExistsMonitor.validatorClass=user.FileMonitorValidator
    easymonitor.user.fileExistsMonitor.cronexpression=0/5 * * * * ?
    easymonitor.user.fileExistsMonitor.mail.sender.interval=30
    easymonitor.user.fileExistsMonitor.mail.receiver=yourmail@domain.com;yourmail@domain.org
    easymonitor.user.fileExistsMonitor.cmd=/home/app/create.sh
    easymonitor.user.fileExistsMonitor.maxfailure=4
    ```

### **自定义 Sender**  
一个监控服务可以自定义多个 `Sender`。当监控到服务异常时，可以执行对应的 `SenderImpls` 发送提醒通知。

仅需实现 `Sender` 接口即可。

- **Sender 通知发送者示例**
 ```JAVA
 /**
  * User Sender Example. 
  * Send a SMS 
  */
 public class SMSSender implements Sender{
 	public void send(MonitorConfiguration configuration) {
 		// ONLY A DEMO
 		System.out.println("SMS Sending...");
 		System.out.println(configuration);
 		System.out.println(GlobalMonitorConfiguration.properties);
 		System.out.println("Send completed");
 	}
 }
 ```  

- **配置 Sender**  
指定 `sender.impl` 配置参数。 

 ```properties
  # Example:
  easymonitor.[url|port|process|user].NAME.sender.impl=user.SMSSender;user.OtherSender
 ```

### 自定义配置文件和 freemarker 配置对象
为了提供更多灵活性，EasyMonitor 允许在启动监控服务前自定义**配置文件对象 Properties File**（`easymonitor.properties`） 和邮件发送时的 **freemarker 配置对象**（`Configuration`）。

```JAVA
// 自定义配置文件对象
EasyMonitor.setPropertiesFile(java.io.File propertiesFile);

// 自定义邮件发送的 freemarker 配置对象
MailSender.setFreemarkerConfiguration(freemarker.template.Configuration configuration);
```

示例：

```JAVA
// Custom EasyMonitor initialization Parameter

// 自定义配置文件对象
Resource res = new ServletContextResource(sce.getServletContext(), "/easymonitor.properties"); 
try {
    // Properties File 
    EasyMonitor.setPropertiesFile(res.getFile());
} catch (IOException e) {
    e.printStackTrace();
}

// 自定义邮件发送的 freemarker 配置对象
Configuration cfg= new Configuration(Configuration.VERSION_2_3_23);
cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
cfg.setDefaultEncoding("UTF-8");
cfg.setServletContextForTemplateLoading(sce.getServletContext(), "/template");
// MailSender Configuration
MailSender.setFreemarkerConfiguration(cfg);
```

### 运行时信息获取

`cn.easyproject.easymonitor.MonitorRuntime` 提供了监控运行时的信息。

```
# 监控控制
start()：启动
stop()：停止

# 启动后的运行状态信息
started: 是否启动
allMonitorsOnStartup：所有配置的服务
errorJobMonitorsOnStartup：任务启动失败的服务
runningMonitorsOnStartup：正在运行的服务

# 配置信息
getMonitorNames()：所有配置的服务名称
getMonitorsConfigurations()：所有监控服务配置对象
getEnableMonitorsConfigurations()：所有设为启用（enable=ON）的监控服务配置对象
getGlobalMonitorsConfiguration()：全局监控配置对象
getProperties()：Properties对象
getPropertiesFile()：Properties File 对象
```





## English

EasyMonitor is also a free open source cross-platform Java monitoring engine framework that provides standardized monitoring configuration and core scheduling.

You only need to develop your own monitoring and control system ( MonitorValidator`) and notify the sender (`Sender`), on-demand can be.


### Steps for usage

1. **Maven dependency**

 ```XML
 <dependency>
     <groupId>cn.easyproject</groupId>
     <artifactId>easymonitor</artifactId>
     <version>1.5.0-RELEASE</version>
 </dependency>
 ```

2. Custom `Monitor Validator` monitor or` Sender` notify the sender of the implementation class

3. Configure `easymonitor.properties`

4. Start  
  ```JAVA
  public static void main(String[] args) {
      new EasyMonitor().start();
  }
  ```


### Custom MonitorValidator

 Only implement the interface `MonitorValidator`, according to the judgment result to rule returns` ValidatorResult`.

 - **MonitorValidator implements example**
 
    ```JAVA
    /**
     * User Monitor Example. 
     * To monitor the file whether exists.
     */
    public class FileMonitorValidator implements MonitorValidator {
    
    	public ValidatorResult validate(MonitorConfiguration configuration) {
    		// ONLY A DEMO
    		System.out.println("file check !");
    		
    		ValidatorResult result;
    		
    		File file=new File(configuration.getValue());
    		
    		if(file.exists()){
    			result=ValidatorResult.VALIDATION;
    		}else{
    			result=ValidatorResult.INVALIDATION;
    		}
    		
    		return result;
    	}
    }
    ```

 - **ValidatorResult enum items**
 
    ``` JAVA
    /**
     * Validator pass
     */
    VALIDATION, 
    /**
     * Validator not pass
     */
    INVALIDATION, 
    /**
     * Ignore this validator result
     */
    IGNORE;
    ```

 - **Configure easymonitor.user.Name type user custome ValidatorMonitor**  
    Note Specifying `validatoClass` configuration parameters.
   
    ```properties
    # Example:
    easymonitor.user.fileExistsMonitor=data.txt
    easymonitor.user.fileExistsMonitor.validatorClass=user.FileMonitorValidator
    easymonitor.user.fileExistsMonitor.cronexpression=0/5 * * * * ?
    easymonitor.user.fileExistsMonitor.mail.sender.interval=30
    easymonitor.user.fileExistsMonitor.mail.receiver=yourmail@domain.com;yourmail@domain.org
    easymonitor.user.fileExistsMonitor.cmd=/home/app/create.sh
    easymonitor.user.fileExistsMonitor.maxfailure=4
    ```


### Custom Sender

A monitoring service can customize many `Sender`. When a monitored service exceptions, you can perform the corresponding `SenderImpls` send reminders.

Only to implements `Sender` interface.

- **Sender Example**
 ```JAVA
 /**
  * User Sender Example. 
  * Send a SMS 
  */
 public class SMSSender implements Sender{
 	public void send(MonitorConfiguration configuration) {
 		// ONLY A DEMO
 		System.out.println("SMS Sending...");
 		System.out.println(configuration);
 		System.out.println(GlobalMonitorConfiguration.properties);
 		System.out.println("Send completed");
 	}
 }
 ```

- **Configure Sender**  

 Note Specifying `sender.impl` configuration parameters.

 ```properties
  # Example:
  easymonitor.[url|port|process|user].NAME.sender.impl=user.SMSSender;user.OtherSender
 ```

### Custom Properties File and Freemarker Configuration object
To provide more flexibility, EasyMonitor permit before starting Monitor service ** custom Properties File object** ( `easyMonitor.properties`) and ** mail to send Freemarker Configuration object** (` Configuration`).


```JAVA
// Custom Properties File
EasyMonitor.setPropertiesFile(java.io.File propertiesFile);

// Custom mail to send Freemarker Configuration object
MailSender.setFreemarkerConfiguration(freemarker.template.Configuration configuration);
```

Example:

```JAVA
// Custom EasyMonitor initialization Parameter

// Custom Properties File
Resource res = new ServletContextResource(sce.getServletContext(), "/easyMonitor.properties"); 
try {
    // Properties File 
    EasyMonitor.setPropertiesFile(res.getFile());
} catch (IOException e) {
    e.printStackTrace();
}

// Custom mail to send Freemarker Configuration object
Configuration cfg= new Configuration(Configuration.VERSION_2_3_23);
cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
cfg.setDefaultEncoding("UTF-8");
cfg.setServletContextForTemplateLoading(sce.getServletContext(), "/template");
// MailSender Configuration
MailSender.setFreemarkerConfiguration(cfg);
```

### Runtime access to information

`cn.easyproject.easymonitor.MonitorRuntime` providing information Monitor runtime.

```
# Monitor controller
start()
stop()

# Information when started
started: Wheter started
allMonitorsOnStartup
runningMonitorsOnStartup
errorJobMonitorsOnStartup

# Configuration information
getMonitorNames(): All configuration names
getMonitorsConfigurations(): All configuration objects
getEnableMonitorsConfigurations(): All enable（enable=ON） configuration objects
getGlobalMonitorsConfiguration(): Global Configuration object
getProperties(): Properties object
getPropertiesFile(): Properties File object
```



## End

