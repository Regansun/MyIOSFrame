//
//  NSString+Category.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

#pragma mark -------- 常用的一些操作
// 处理null字符
- (id)isNullString;

// 是否为空格
- (BOOL)isBlank;

// 是否有效 String is empty or nil
- (BOOL)isValid;

//去掉字符串前后空格
- (NSString*)removeWhiteSpacesFromString;

// 转成data
- (NSData *)convertToData;

// NSData 转 字符串
+ (NSString *)getStringFromData:(NSData *)data;

// 是否是 Email
- (BOOL)isValidEmail;

// 是否是 Phone
- (BOOL)isVAlidPhoneNumber;

// 是否是 URL
- (BOOL)isValidUrl;

//md5加密
- (NSString *)md5Encrypt;

- (NSString *)md5;


#pragma mark -------- 文件相关操作
//添加文件后缀
- (NSString *)appendFileName:(NSString *)append;



@end
