//
//  GuidePageView.h
//  MyIOSFrame
//
//  Created by Regan on 15/4/8.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GuidePageViewDelegate <NSObject>

-(void)onDoneButtonPressed;

@end

@interface GuidePageView : UIView

@property (weak, nonatomic) id<GuidePageViewDelegate> delegate;

@end
