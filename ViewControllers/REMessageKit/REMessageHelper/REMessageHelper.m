//
//  REMessageHelper.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "REMessageHelper.h"

@implementation REMessageHelper

/**
 *  消息背景框
 *
 *  @param type 发送还是接受
 *
 *  @return 返回拉伸图片
 */
+ (UIImage *)bubbleImageViewForType:(REMessageType)type{
    NSString *messageTypeString = @"weChatBubble";
    switch (type) {
        case REMessageTypeSending:
            messageTypeString = [messageTypeString stringByAppendingString:@"_Sending"];
            break;
        case REMessageTypeReceiving:
            messageTypeString = [messageTypeString stringByAppendingString:@"_Receiving"];
            break;
            
        default:
            break;
    }
    //messageTypeString = [messageTypeString stringByAppendingString:@"_Solid"];
    
    UIImage *bublleImage = [UIImage imageNamed:messageTypeString];
    UIEdgeInsets bubbleImageEdgeInsets = UIEdgeInsetsMake(19, 20, 19, 20);
    UIImage *image = [bublleImage resizableImageWithCapInsets:bubbleImageEdgeInsets resizingMode:UIImageResizingModeStretch];
    return image;
}

@end
