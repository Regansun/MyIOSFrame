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

@interface REMessageBubbleView : UIView

+ (CGFloat)calculateCellHeightWithMessage:(id <REMessage>)message;

@end
