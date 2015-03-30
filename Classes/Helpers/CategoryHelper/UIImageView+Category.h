//
//  UIImageView+Category.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Category)

- (void)re_setImageWithURL:(NSURL *)url;

/**
 *  生成圆图
 *
 *  @param color 边框颜色
 */
- (void)setRoundImageWithColor:(UIColor *)color;

@end
