//
//  ASyncURLConnection.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/30.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  typedef block 类型变量 提高源代码的可读性
 */
typedef void (^completeBlock_t) (NSData *date);
typedef void (^errorBlock_t) (NSError *error);

@interface ASyncURLConnection : NSURLConnection <NSURLConnectionDelegate,NSURLConnectionDataDelegate> {
    
    NSMutableData *data_;
    completeBlock_t completeBlock_;
    errorBlock_t errorBlock_;
}

+ (id)request:(NSString *)requestUrl completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock;

- (id)initWithRequest:(NSString *)requestUrl completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock;

@end
