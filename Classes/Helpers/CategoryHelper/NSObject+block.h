//
//  NSObject+block.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/26.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


/**
 * 添加单击事件
 */

typedef void(^buttonHandlerBlcok)(id sender);

@interface NSObject (block)

@property (nonatomic, copy) buttonHandlerBlcok eventHandler;
@property (nonatomic, strong) NSMutableDictionary * evenDict;

- (void)addHandAction:(void(^)(id sender ))handler;

@end
