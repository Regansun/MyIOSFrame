//
//  REMessageBubbleView.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/3.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "REMessageBubbleView.h"

@implementation REMessageBubbleView

+ (CGFloat)calculateCellHeightWithMessage:(id <REMessage>)message{
    CGFloat height = MinBubbleHeight;
    switch (message.messageContentType) {
        case REMessageContentTypeText:
            
            break;
            
        default:
            break;
    }
    return height;
}

@end
