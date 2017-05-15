//
//  NSString+HMAC.h
//  HMACDemo
//
//  Created by MOMO的小棉袄 on 2017/5/8.
//  Copyright © 2017年 peony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HMAC)

+ (NSString *)HMACMD5:(NSString *)data key:(NSString *)key;

+ (NSString *)HMACSHA1:(NSString *)data key:(NSString *)key;

+ (NSString *)HMACSHA256:(NSString *)data key:(NSString *)key;

+ (NSString *)HMACSHA512:(NSString *)data key:(NSString *)key;

@end
