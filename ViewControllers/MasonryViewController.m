//
//  MasonryViewController.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/27.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "MasonryViewController.h"
#import "REGlobalClass.h"

/* 学习链接：http://www.cocoachina.com/ios/20141219/10702.html
 
 - (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block;
 - (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block;
 - (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block;
 
 mas_makeConstraints 只负责新增约束 Autolayout不能同时存在两条针对于同一对象的约束 否则会报错
 mas_updateConstraints 针对上面的情况 会更新在block中出现的约束 不会导致出现两个相同约束的情况
 mas_remakeConstraints 则会清除之前的所有约束 仅保留最新的约束
 三种函数善加利用 就可以应对各种情况了
 
 */

@interface MasonryViewController () {
    UIView *sv;
}

@end

@implementation MasonryViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Masonry实践"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    WS(ws);
    /*---------------------------------- [基础] 居中显示一个view -------------------------------*/
    sv = [UIView new];
    [sv setBackgroundColor:[UIColor blackColor]];
    //[sv showPlaceHolder];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    //[self action1];
    //[self action2];
    [self action3];
    //[self action4];
    
}

/**
 *  [初级] 让一个view略小于其superView(边距为10)
 */
- (void)action1{
    UIView *sv1 = [UIView new];
    [sv1 setBackgroundColor:[UIColor redColor]];
    //[sv1 showPlaceHolder];
    [sv addSubview:sv1];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

/**
 *  [初级] 让两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
 */
- (void)action2{
    UIView *sv2 = [UIView new];
    [sv2 setBackgroundColor:[UIColor yellowColor]];
    [sv addSubview:sv2];
     
    UIView *sv3 = [UIView new];
    [sv3 setBackgroundColor:[UIColor yellowColor]];
    [sv addSubview:sv3];
     
    int padding1 = 10;
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv.mas_left).with.offset(padding1);
        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv3);
    }];
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv2.mas_right).with.offset(padding1);
        make.right.equalTo(sv.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv2);
    }];
}

/**
 *  [中级] 在UIScrollView顺序排列一些view并自动计算contentSize
 */
- (void)action3{
    UIScrollView *scrollView = [UIScrollView new];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [sv addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    NSInteger count = 10;
    UIView *lastView = nil;
    for (int i = 0; i<count; i++) {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            if ( lastView ) {
                make.top.mas_equalTo(lastView.mas_bottom);
            }else{
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        
        lastView = subv;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}

/**
 *  [高级] 横向或者纵向等间隙的排列一组view
 */
- (void)action4{
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    //给予不同的大小 测试效果
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    [sv distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [sv distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
    [sv showPlaceHolderWithAllSubviews];
    [sv hidePlaceHolder];
}


@end
