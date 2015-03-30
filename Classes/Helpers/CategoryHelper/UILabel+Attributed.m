//
//  UILabel+Attributed.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/26.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "UILabel+Attributed.h"

@implementation UILabel (Attributed)

- (void)setAttributedWithString:(NSString *)Attributed andAttributedColor:(UIColor *)AttributedColor andAttributedFont:(UIFont *)AttributedFont{
    NSRange rang = [self.text rangeOfString:Attributed];
    UIColor *cuttentColor = AttributedColor?AttributedColor:self.textColor;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.text];
    [string addAttribute:NSForegroundColorAttributeName value:cuttentColor range:rang];
    
    if (AttributedFont) {
        [string addAttribute:NSFontAttributeName value:AttributedFont range:rang];
        
    }
    self.attributedText=string;
}

- (void)setAttributedWithAttributes:(NSArray *)attributes{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.text];
    for (NSDictionary *dic in attributes) {
        NSString *Attributed = [dic objectForKey:NSTextEffectAttributeName];
        NSRange rang = [self.text rangeOfString:Attributed];
        
        UIColor *AttributedColor = [dic objectForKey:NSForegroundColorAttributeName];
        UIColor *cuttentColor = AttributedColor?AttributedColor:self.textColor;
        [string addAttribute:NSForegroundColorAttributeName value:cuttentColor range:rang];
        
        UIFont *AttributedFont = [dic objectForKey:NSFontAttributeName];
        if (AttributedFont) {
            [string addAttribute:NSFontAttributeName value:AttributedFont range:rang];
            
        }
    }
    self.attributedText=string;
}

@end
