//
//  NSString+Category.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Category)

/**
 *  处理null字符
 *
 *  @return 字符串
 */
- (id)isNullString{
    if ([self isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return self;
}

// 判断是否为空格
- (BOOL)isBlank{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""]) ? YES : NO;
}

// 是否有效 String is empty or nil
- (BOOL)isValid{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"]) ? NO :YES;
}

// 去除字符串的前后空格
- (NSString *)removeWhiteSpacesFromString{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

// If my string starts with given string
- (BOOL)isBeginsWith:(NSString *)string
{
    return ([self hasPrefix:string]) ? YES : NO;
}

// If my string ends with given string
- (BOOL)isEndssWith:(NSString *)string
{
    return ([self hasSuffix:string]) ? YES : NO;
}

// Get String from array
+ (NSString *)getStringFromArray:(NSArray *)array
{
    return [array componentsJoinedByString:@" "];
}

// Convert Array from my String
- (NSArray *)getArray
{
    return [self componentsSeparatedByString:@" "];
}

// 转成data
- (NSData *)convertToData{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

// NSData 转 字符串
+ (NSString *)getStringFromData:(NSData *)data{
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

// Is Valid Email
- (BOOL)isValidEmail{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}

// Is Valid Phone
- (BOOL)isVAlidPhoneNumber{
    NSString *regex = @"[235689][0-9]{6}([0-9]{3})?";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:self];
}

// Is Valid URL
- (BOOL)isValidUrl{
    NSString *regex =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

#pragma mark ---------------------- 文件操作 -----------------------------
- (NSString *)appendFileName:(NSString *)append{
    NSString *fileName = [self stringByDeletingPathExtension];
    fileName = [fileName stringByAppendingString:append];
    NSString *filePath = [self pathExtension];
    if ([filePath length]) {
        return [filePath stringByAppendingPathExtension:filePath];
    }
    return fileName;
}

#pragma mark -------------------------------------MD5加密-------------------
- (NSString *)md5{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)md5Encrypt {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    // CC_MD5( cStr, strlen(cStr), digest ); 这里的用法明显是错误的，但是不知道为什么依然可以在网络上得以流传。当srcString中包含空字符（\0）时
    CC_MD5(cStr, strlen(cStr), digest);
    //CC_MD5(cStr,self.length, digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02X", digest[i]];
    return result;
}

@end
