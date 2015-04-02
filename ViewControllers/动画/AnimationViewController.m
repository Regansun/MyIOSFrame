//
//  AnimationViewController.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/31.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "AnimationViewController.h"
#import "LoginViewController.h"

static NSString *const TableViewCellId = @"TableViewCellId";

@interface AnimationViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *tableArray;

@end

@implementation AnimationViewController

- (NSMutableArray *)tableArray{
    if (!_tableArray) {
        _tableArray = [@[@"登录验证表单(基本使用)"] mutableCopy];
    }
    return _tableArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"动画效果"];
    
    UITableView *tableView = [[UITableView alloc] init];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellId];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.textLabel setText:[self.tableArray objectAtIndex:indexPath.row]];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewCov = nil;
    switch (indexPath.row) {
        case 0:
            viewCov = [[LoginViewController alloc] init];
            break;
        case 1:
            
            break;
        case 2:
            //viewCov = [[CircleViewController alloc] init];
            break;
        case 3:
            //viewCov = [[AnimationViewController alloc] init];
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:viewCov animated:YES];
}


@end
