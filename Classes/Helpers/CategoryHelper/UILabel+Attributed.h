//
//  UILabel+Attributed.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/26.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Attributed)

/**
 *  富文
 *
 *  @param Attributed      需改变的字符串
 *  @param AttributedColor 需改变字符串的颜色
 *  @param AttributedFont  AttributedFont description
 */
- (void)setAttributedWithString:(NSString *)Attributed andAttributedColor:(UIColor *)AttributedColor andAttributedFont:(UIFont *)AttributedFont;

/**
 *  富文
 *
 *  @param attributes  举个例子：NSArray *attributes =
 *@[@{NSTextEffectAttributeName:@"123",NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0]},
 *@{NSTextEffectAttributeName:@"456",NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0]},
 *@{NSTextEffectAttributeName:@"789",NSForegroundColorAttributeName:[UIColor yellowColor],NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0]}];
 */
- (void)setAttributedWithAttributes:(NSArray *)attributes;

@end
