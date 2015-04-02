//
//  TextMessageBubbleView.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "TextMessageBubbleView.h"

@implementation TextMessageBubbleView

- (UILabel *)textLable{
    if (!_textLable) {
        _textLable = [[UILabel alloc] init];
        _textLable.numberOfLines = 0;
        [self addSubview:_textLable];
    }
    return _textLable;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.textLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

- (void)showInfo:(REMessageModel *)model{
    [self.textLable setText:@"123"];
    [self layoutSubviews];
}

@end
