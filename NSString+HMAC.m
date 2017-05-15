//
//  NSString+HMAC.m
//  HMACDemo
//
//  Created by MOMO的小棉袄 on 2017/5/8.
//  Copyright © 2017年 peony. All rights reserved.
//

#import "NSString+HMAC.h"

#import <CommonCrypto/CommonHMAC.h>


@implementation NSString (HMAC)
@dynamic MD5String;
@dynamic SHA1String;
@dynamic SHA256String;
@dynamic SHA512String;


/**
 获得字符的MD5加密后的字符串

 @return 加密后的字符串
 */
- (NSString *)MD5String{
    return [self encryptWithLength:CC_MD5_DIGEST_LENGTH andWithWay:kCCHmacAlgMD5];
}

/**
 获得字符的SHA1加密后的字符串
 
 @return 加密后的字符串
 */
- (NSString *)SHA1String{
    return [self encryptWithLength:CC_SHA1_DIGEST_LENGTH andWithWay:kCCHmacAlgSHA1];
}
/**
 获得字符的SHA256加密后的字符串
 
 @return 加密后的字符串
 */
- (NSString *)SHA256String{
    return [self encryptWithLength:CC_SHA256_DIGEST_LENGTH andWithWay:kCCHmacAlgSHA256];
}
/**
 获得字符的SHA512加密后的字符串
 
 @return 加密后的字符串
 */
- (NSString *)SHA512String{
    return [self encryptWithLength:CC_SHA512_DIGEST_LENGTH andWithWay:kCCHmacAlgSHA512];
}

/**
 类方法实现HMAC加密

 @param data 传入的字符串
 @param key 传入的key
 @param digestLength 编码方式返回的字符长度
 @param way 加密方式
 @return 加密过后的字符串
 */
+ (NSString *)HMAC:(NSString *)data key:(NSString *)key andLenth:(CC_LONG )digestLength  way:(int)way{
    
    return [data HMACWithkey:key andLenth:digestLength way:way];
}

/**
 根据加密规范给传入的字符进行HMAC加密
 
 @param key 加密的提供的key
 @param digestLength 传入的字符编码长度
 @param way 传入的字符编码方式
 @return 编码过后的字符串
 */
- (NSString *)HMACWithkey:(NSString *)key andLenth:(CC_LONG )digestLength  way:(int)way{
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [self cStringUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t cHMAC[digestLength];
    
    CCHmac(way, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    //NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    NSString *hash;
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < digestLength; i++)
        [output appendFormat:@"%02x", cHMAC[i]];
    hash = output;
    
    return hash;
}
/**
    根据加密规范给传入的字符进行哈希加密
 
 @param digestLength 传入的字符编码长度
 @param way 传入的字符编码方式
 @return 编码过后的字符串
 */
- (NSString *)encryptWithLength:(CC_LONG )digestLength andWithWay:(int)way{
    const char *cData = [self cStringUsingEncoding:NSUTF8StringEncoding];
    uint8_t cHMAC[digestLength];
    CC_MD5(cData, (int)strlen(cData), cHMAC);
    NSMutableString *output = [NSMutableString stringWithCapacity:digestLength * 2];
    
    for(int i = 0; i < digestLength; i++)
        [output appendFormat:@"%02x", cHMAC[i]];
    return output;
}

/**
 HMAC+MD5加密

 @param data 传入的字符串
 @param key 传入的KEY
 @return 编码过后的字符串
 */
+ (NSString *)HMACMD5:(NSString *)data key:(NSString *)key {
    
    return [self HMAC:data key:key andLenth:CC_MD5_DIGEST_LENGTH way:kCCHmacAlgMD5];
}
/**
 HMAC+SHA1加密
 
 @param data 传入的字符串
 @param key 传入的KEY
 @return 编码过后的字符串
 */
+ (NSString *)HMACSHA1:(NSString *)data key:(NSString *)key {
    return [self HMAC:data key:key andLenth:CC_SHA1_DIGEST_LENGTH way:kCCHmacAlgSHA1];
}
/**
 HMAC+SHA256加密
 
 @param data 传入的字符串
 @param key 传入的KEY
 @return 编码过后的字符串
 */
+ (NSString *)HMACSHA256:(NSString *)data key:(NSString *)key {
    
    return [self HMAC:data key:key andLenth:CC_SHA256_DIGEST_LENGTH way:kCCHmacAlgSHA256];
}
/**
 HMAC+SHA512加密
 
 @param data 传入的字符串
 @param key 传入的KEY
 @return 编码过后的字符串
 */
+ (NSString *)HMACSHA512:(NSString *)data key:(NSString *)key {
    return [self HMAC:data key:key andLenth:CC_SHA512_DIGEST_LENGTH way:kCCHmacAlgSHA512];
}
/**
 HMAC+MD5加密
 
 @param key 传入的KEY
 @return 编码过后的字符串
 */
- (NSString *)HMACMD5StringWithKey:(NSString *)key{
    return [self HMACWithkey:key andLenth:CC_MD5_DIGEST_LENGTH way:kCCHmacAlgMD5];
}
/**
 HMAC+SHA1加密
 
 @param key 传入的KEY
 @return 编码过后的字符串
 */
- (NSString *)HMACHSA1StringWithKey:(NSString *)key{
    return [self HMACWithkey:key andLenth:CC_SHA1_DIGEST_LENGTH way:kCCHmacAlgSHA1];
}
/**
 HMAC+SHA256加密
 
 @param key 传入的KEY
 @return 编码过后的字符串
 */
- (NSString *)HMACSHA256StringWithKey:(NSString *)key{
    return [self HMACWithkey:key andLenth:CC_SHA256_DIGEST_LENGTH way:kCCHmacAlgSHA256];
}
/**
 HMAC+SHA512加密
 
 @param key 传入的KEY
 @return 编码过后的字符串
 */
- (NSString *)HMACSHA512StringWithKey:(NSString *)key{
    return [self HMACWithkey:key andLenth:CC_SHA512_DIGEST_LENGTH way:kCCHmacAlgSHA512];
}

@end
