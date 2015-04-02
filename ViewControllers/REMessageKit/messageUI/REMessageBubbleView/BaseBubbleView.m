//
//  BaseBubbleView.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "BaseBubbleView.h"

@implementation BaseBubbleView

- (UIImageView *)bubbleImageView{
    if (!_bubbleImageView) {
        _bubbleImageView = [[UIImageView alloc] init];
        [self addSubview:_bubbleImageView];
    }
    return _bubbleImageView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.bubbleImageView setFrame:self.bounds];
}

@end
