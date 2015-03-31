//
//  CircleViewController.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/31.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "CircleViewController.h"
#import "SDCycleScrollView.h"

@interface CircleViewController () <SDCycleScrollViewDelegate>

@end

@implementation CircleViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"无限循环图片轮播器"];
    
    NSArray *images = @[[UIImage imageNamed:@"h1.jpg"],
                        [UIImage imageNamed:@"h2.jpg"],
                        [UIImage imageNamed:@"h3.jpg"],
                        [UIImage imageNamed:@"h4.jpg"]
                        ];
    NSArray *images2 = @[   [NSURL URLWithString:@"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg"],
                            [NSURL URLWithString:@"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg"],
                            [NSURL URLWithString:@"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"],
                            [NSURL URLWithString:@"https://ss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=0c231a5bb34543a9f54ea98c782abeb0/a71ea8d3fd1f41342830c1d1211f95cad1c85e1e.jpg"]];
    
    NSArray *titles = @[@"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com",
                        @"感谢您的支持"
                        ];
    
    
    CGFloat height = 180*kWidthScale;
    
    // 创建不带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, KMainScreenWidth, height) imagesGroup:images];
    cycleScrollView.delegate = self;
    cycleScrollView.autoScrollTimeInterval = 2.0;
    [self.view addSubview:cycleScrollView];
    
    
    // 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 280, KMainScreenWidth, height) imagesGroup:images2];
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    cycleScrollView2.autoScrollTimeInterval = 2.0;
    cycleScrollView2.titlesGroup = titles;
    [self.view addSubview:cycleScrollView2];
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"---点击了第%ld张图片", (unsigned long)index);
}

@end
