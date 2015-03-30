//
//  BaseNavigationController.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavBarBg"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithWhite:0.000 alpha:0.620]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:17], NSFontAttributeName, nil]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - Life cycle
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
