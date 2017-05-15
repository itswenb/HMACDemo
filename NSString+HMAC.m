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

+ (NSString *)HMAC:(NSString *)data key:(NSString *)key andLenth:(CC_LONG )digestLength  way:(int)way{
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [data cStringUsingEncoding:NSUTF8StringEncoding];
    
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

+ (NSString *)HMACMD5:(NSString *)data key:(NSString *)key {
    
    return [self HMAC:data key:key andLenth:CC_MD5_DIGEST_LENGTH way:kCCHmacAlgMD5];
}

+ (NSString *)HMACSHA1:(NSString *)data key:(NSString *)key {
    return [self HMAC:data key:key andLenth:CC_MD5_DIGEST_LENGTH way:kCCHmacAlgSHA1];
}

+ (NSString *)HMACSHA256:(NSString *)data key:(NSString *)key {
    
    return [self HMAC:data key:key andLenth:CC_SHA256_DIGEST_LENGTH way:kCCHmacAlgSHA256];
}

+ (NSString *)HMACSHA512:(NSString *)data key:(NSString *)key {
    return [self HMAC:data key:key andLenth:CC_SHA512_DIGEST_LENGTH way:kCCHmacAlgSHA512];
}

@end
