//
//  GuidePageController.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/8.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "GuidePageController.h"
#import "GuidePageView.h"

@interface GuidePageController () <GuidePageViewDelegate>

@property (strong, nonatomic) GuidePageView *guideView;

@end

@implementation GuidePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"intro_screen_viewed"]) {
        self.guideView = [[GuidePageView alloc] initWithFrame:self.view.frame];
        self.guideView.delegate = self;
        self.guideView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:self.guideView];
    }
}

#pragma mark - ABCIntroViewDelegate Methods

-(void)onDoneButtonPressed{
    
    //    Uncomment so that the IntroView does not show after the user clicks "DONE"
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    [defaults setObject:@"YES"forKey:@"intro_screen_viewed"];
    //    [defaults synchronize];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.guideView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.guideView removeFromSuperview];
    }];
}

@end
