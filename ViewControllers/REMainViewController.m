//
//  REMainViewController.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/26.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "REMainViewController.h"
#import "REGlobalClass.h"
#import "UITableViewController+pull.h"
#import "MasonryViewController.h"

static NSString *const TableViewCellIdentifier = @"TableViewCellIdentifier";

@interface REMainViewController ()

@property (strong, nonatomic) NSMutableArray *tableArray;

@end

@implementation REMainViewController

- (NSMutableArray *)tableArray{
    if (!_tableArray) {
        _tableArray = [@[@"Masonry介绍与使用实践：快速上手Autolayout"] mutableCopy];
    }
    return _tableArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"微 信"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
    
//    WEAKSELF
//    [self addHeadViewPull:^(UITableViewController *tablewVC) {
//        [weakSelf Refreshing];
//    }];
    //[self headerBeginRefreshing];
}

- (void)Refreshing{
    NSLog(@"下拉刷新");
    sleep(2);
    
    [self headerEndRefreshing];
    NSLog(@"结束刷新");
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.textLabel setText:[self.tableArray objectAtIndex:indexPath.row]];
    //cell.textLabel.numberOfLines = 0;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[self headerBeginRefreshing];
    UIViewController *viewCov = nil;
    switch (indexPath.row) {
        case 0:
            viewCov = [[MasonryViewController alloc] init];
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:viewCov animated:YES];
}

@end
