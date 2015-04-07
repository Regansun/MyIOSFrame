//
//  REMessageBubbleView.h
//  MyIOSFrame
//
//  Created by Regan on 15/4/3.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMessage.h"
#import "REGlobalClass.h"
#import "RELable.h"

@interface REMessageBubbleView : UIView <UIAppearance>

@property (weak, nonatomic) id<REMessage> message;

@property (weak, nonatomic) UIImageView *bubbleImage;         //背景框

@property (weak, nonatomic) UIFont *textFont UI_APPEARANCE_SELECTOR;   //文字大小

@property (weak, nonatomic) RELable *textLable;     //文本

/**
 *  初始化
 *
 *  @param message 消息model
 *
 *  @return 返回REMessageBubbleView类型的对象
 */
- (instancetype)initWithMessage:(id <REMessage>)message;

/**
 *  根据消息Model对象配置消息显示内容
 *
 *  @param message 目标消息Model对象
 */
- (void)configureCellWithMessage:(id <REMessage>)message;

/**
 *  根据消息Model对象计算消息内容的大小
 *
 *  @param message 目标消息Model对象
 *
 *  @return 返回大小
 */
+ (CGSize)calculateCellHeightWithMessage:(id <REMessage>)message;


@end
