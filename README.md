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
    
    NSString * encrypted12 =  pwd.encrypt(ENCRYPT_MD5, nil);
    NSString * encrypted13 =  pwd.encrypt(ENCRYPT_SHA1, nil);
    NSString * encrypted14 =  pwd.encrypt(ENCRYPT_SHA256, nil);
    NSString * encrypted15 =  pwd.encrypt(ENCRYPT_SHA512, nil);
    NSString * encrypted16 =  pwd.encrypt(ENCRYPT_MD5, key);
    NSString * encrypted17 =  pwd.encrypt(ENCRYPT_SHA1, key);
    NSString * encrypted18 =  pwd.encrypt(ENCRYPT_SHA256, key);
    NSString * encrypted19 =  pwd.encrypt(ENCRYPT_SHA512, key);
    
    NSLog(@"%@\n",encrypted1);
    NSLog(@"%@\n",encrypted2);
    NSLog(@"%@\n",encrypted3);
    NSLog(@"%@\n",encrypted4);
    NSLog(@"%@\n",encrypted5);
    NSLog(@"%@\n",encrypted6);
    NSLog(@"%@\n",encrypted7);
    NSLog(@"%@\n",encrypted8);
    NSLog(@"%@\n",encrypted9);
    NSLog(@"%@\n",encrypted10);
    NSLog(@"%@\n",encrypted11);
    NSLog(@"%@\n",encrypted12);
    NSLog(@"%@\n",encrypted13);
    NSLog(@"%@\n",encrypted14);
    NSLog(@"%@\n",encrypted15);
    NSLog(@"%@\n",encrypted16);
    NSLog(@"%@\n",encrypted17);
    NSLog(@"%@\n",encrypted18);
    NSLog(@"%@\n",encrypted19);
 ```
