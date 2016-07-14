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
     <version>1.3.0-RELEASE</version>
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
    easymonitor.user.fileExistsMonitor.mail.receiver=yourmail@domain.com##yourmail@domain.org
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
  easymonitor.[url|port|process|user].NAME.sender.impl=user.SMSSender##user.OtherSender
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
     <version>1.3.0-RELEASE</version>
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
    easymonitor.user.fileExistsMonitor.mail.receiver=yourmail@domain.com##yourmail@domain.org
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
  easymonitor.[url|port|process|user].NAME.sender.impl=user.SMSSender##user.OtherSender
 ```





## End

