//
//  CustomViewController.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/1.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "CustomViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

@interface CustomViewController () {
    ViewController2 *viewCov2;
    ViewController3 *viewCov3;
    ViewController4 *viewCov4;
    UIViewController *currentViewController;
}

@end

@implementation CustomViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:@[@"头 条",@"娱 乐",@"体 育"]];
    [control setSelectedSegmentIndex:0];
    [control addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = control;
    
    viewCov2 = [[ViewController2 alloc] init];
    viewCov3 = [[ViewController3 alloc] init];
    viewCov4 = [[ViewController4 alloc] init];
    [self addChildViewController:viewCov2];
    [self addChildViewController:viewCov3];
    [self addChildViewController:viewCov4];
    
    [self.view addSubview:viewCov2.view];
    currentViewController = viewCov2;
}

- (void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    //DLog(@"%ld",(unsigned long)Index);
    UIViewController *viewCov = nil;
    switch (Index) {
        case 0:{
            viewCov = viewCov2;
        }
            break;
        case 1:{
            viewCov = viewCov3;
        }
            break;
        case 2:{
            viewCov = viewCov4;
        }
            break;
            
        default:
            break;
    }
    [self transitionFromViewController:currentViewController toViewController:viewCov duration:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        
    } completion:^(BOOL finished) {
        if (finished) {
            currentViewController = viewCov;
        }
    }];
    //currentViewController = viewCov;
}


@end
