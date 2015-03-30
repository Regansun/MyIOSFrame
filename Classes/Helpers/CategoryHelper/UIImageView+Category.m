//
//  UIImageView+Category.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "UIImageView+Category.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (Category)

- (void)re_setImageWithURL:(NSURL *)url{
    [self sd_setImageWithURL:url placeholderImage:nil];
}

- (void)setRoundImageWithColor:(UIColor *)color{
    [self setClipsToBounds:YES];
    [self.layer setCornerRadius:CGRectGetWidth(self.frame)/2.0];
    [self.layer setBorderWidth:1.5f];
    [self.layer setBorderColor:[color CGColor]];
}

@end