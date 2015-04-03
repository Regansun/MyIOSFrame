//
//  BaseBubbleView.h
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMessage.h"
#import "REGlobalClass.h"

static const CGFloat kMarginTop = 8.0f;    //上边距
static const CGFloat kMarginBottom = 2.0f;  //下边距
static const CGFloat kMarginLeft = 10.0f;
static const CGFloat kMarginRight = 5.0f;

@interface BaseBubbleView : UIView

@property (strong, nonatomic) UIImageView *bubbleImageView; ///背景框


+ (CGFloat)calculateCellHeightWithMessage:(id <REMessage>)message;


@end
