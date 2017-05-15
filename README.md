# HMACDemo
HMAC加密的DEMO
## 使用说明
对**NSString**的扩展,在项目中导入.h文件
## 使用方法
 ```
 //先将文件拖入工程
 #import "NSString+HMAC.h"
 
 //使用
    NSString * pwd = @"123456";
    NSString * key = @"key";
    
    NSString * encrypted = pwd.MD5String;
    NSString * encrypted1 = pwd.SHA1String;
    NSString * encrypted2 = pwd.SHA256String;
    NSString * encrypted3 = pwd.SHA512String;
    
    
    NSString * encrypted4 = [pwd HMACMD5StringWithKey:key];
    NSString * encrypted5 = [pwd HMACHSA1StringWithKey:key];
    NSString * encrypted6 = [pwd HMACSHA256StringWithKey:key];
    NSString * encrypted7 = [pwd HMACSHA512StringWithKey:key];
    
    
    NSString * encrypted8 = [NSString HMACMD5:pwd key:key];
    NSString * encrypted9 = [NSString HMACSHA1:pwd key:key];
    NSString * encrypted10 = [NSString HMACSHA256:pwd key:key];
    NSString * encrypted11 = [NSString HMACSHA512:pwd key:key];
 ```
