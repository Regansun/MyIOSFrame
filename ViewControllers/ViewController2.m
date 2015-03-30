//
//  ViewController2.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/25.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "ViewController2.h"
#import "UILabel+Attributed.h"
#import "NSObject+block.h"
#import "REGlobalClass.h"
#import "UIViewExt.h"

@implementation ViewController2

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"通讯录"];
    
    UILabel *attrLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 80)];
    attrLabel.numberOfLines = 0;
    attrLabel.text = @"123456789";
    NSArray *attributes =
    @[@{NSTextEffectAttributeName:@"123",NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0]},
      @{NSTextEffectAttributeName:@"456",NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0]},
      @{NSTextEffectAttributeName:@"789",NSForegroundColorAttributeName:[UIColor yellowColor],NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0]}];
    [attrLabel setAttributedWithAttributes:attributes];
    [self.view addSubview:attrLabel];
    
    [attrLabel addHandAction:^(id sender) {
        NSLog(@"点击");
    }];
    
    
    view = [[UIView alloc] initWithFrame:CGRectMake(135, 150, 80, 80)];
    view.backgroundColor = [UIColor redColor];
    WEAKSELF
    [view addHandAction:^(id sender) {
        [weakSelf move];
        [weakSelf scale];
        //[weakSelf fitInSize];
    }];
    [self.view addSubview:view];
}

- (void)move{
    [UIView animateWithDuration:5 animations:^{
        [view moveBy:CGPointMake(20, 150)];
    }];
}

- (void)scale{
    [UIView animateWithDuration:5 animations:^{
        [view scaleBy:2];
    }];
}

- (void)fitInSize{
    [UIView animateWithDuration:5 animations:^{
        [view fitInSize:CGSizeMake(50, 80)];
    }];
}

@end
