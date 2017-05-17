//
//  NSString+HMAC.h
//  HMACDemo
//
//  Created by MOMO的小棉袄 on 2017/5/8.
//  Copyright © 2017年 peony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>


typedef enum {
    ENCRYPT_MD5 = 1,
    ENCRYPT_SHA1,
    ENCRYPT_SHA256,
    ENCRYPT_SHA512,
} ENCRYPT_TYPE;

@interface NSString (HMAC)

@property (nonatomic, readonly) NSString * MD5String;

/**
   传入加密方式和加密的Key,如果key为空则直接
 */
@property (nonatomic ,readonly) NSString* (^encrypt)(ENCRYPT_TYPE,NSString*);

@property (nonatomic, readonly) NSString * SHA1String;

@property (nonatomic, readonly) NSString * SHA256String;

@property (nonatomic, readonly) NSString * SHA512String;


/**
 HMAC+MD5加密
 
 @param data 传入的字符串
 @param key 传入的KEY
 @return 编码过后的字符串
 */
+ (NSString *)HMACMD5:(NSString *)data key:(NSString *)key;
/**
 HMAC+SHA1加密
 
 @param data 传入的字符串
 @param key 传入的KEY
 @return 编码过后的字符串
 */
+ (NSString *)HMACSHA1:(NSString *)data key:(NSString *)key;
/**
 HMAC+SHA256加密
 
 @param data 传入的字符串
 @param key 传入的KEY
 @return 编码过后的字符串
 */
+ (NSString *)HMACSHA256:(NSString *)data key:(NSString *)key;
/**
 HMAC+SHA512加密
 
 @param data 传入的字符串
 @param key 传入的KEY
 @return 编码过后的字符串
 */
+ (NSString *)HMACSHA512:(NSString *)data key:(NSString *)key;
/**
 HMAC+MD5加密
 
 @param key 传入的KEY
 @return 编码过后的字符串
 */
- (NSString *)HMACMD5StringWithKey:(NSString *)key;
/**
 HMAC+SHA1加密
 
 @param key 传入的KEY
 @return 编码过后的字符串
 */
- (NSString *)HMACHSA1StringWithKey:(NSString *)key;
/**
 HMAC+SHA256加密
 
 @param key 传入的KEY
 @return 编码过后的字符串
 */
- (NSString *)HMACSHA256StringWithKey:(NSString *)key;
/**
 HMAC+SHA512加密
 
 @param key 传入的KEY
 @return 编码过后的字符串
 */
- (NSString *)HMACSHA512StringWithKey:(NSString *)key;


@end
