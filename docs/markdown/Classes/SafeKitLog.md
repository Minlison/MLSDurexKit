# SafeKitLog Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** SafeKitLog.h  

## Tasks

### 

[&nbsp;&nbsp;printer](#//api/name/printer) *property* 

[&ndash;&nbsp;initWithPrinter:](#//api/name/initWithPrinter:)  

[&ndash;&nbsp;log:](#//api/name/log:)  

[&ndash;&nbsp;logInfo:](#//api/name/logInfo:)  

[&ndash;&nbsp;logWarning:](#//api/name/logWarning:)  

[&ndash;&nbsp;logError:](#//api/name/logError:)  

[+&nbsp;shareInstance](#//api/name/shareInstance)  

## Properties

<a name="//api/name/printer" title="printer"></a>
### printer

`@property (nonatomic, strong) SafeKitPrinter *printer`

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/shareInstance" title="shareInstance"></a>
### shareInstance

`+ (SafeKitLog *)shareInstance`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/initWithPrinter:" title="initWithPrinter:"></a>
### initWithPrinter:

`- (id)initWithPrinter:(SafeKitPrinter *)*printer*`

<a name="//api/name/log:" title="log:"></a>
### log:

`- (void)log:(NSString *)*aString*`

<a name="//api/name/logError:" title="logError:"></a>
### logError:

`- (void)logError:(NSString *)*aString*`

<a name="//api/name/logInfo:" title="logInfo:"></a>
### logInfo:

`- (void)logInfo:(NSString *)*aString*`

<a name="//api/name/logWarning:" title="logWarning:"></a>
### logWarning:

`- (void)logWarning:(NSString *)*aString*`

