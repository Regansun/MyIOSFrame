//
//  REMessageTableViewController.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "REMessageTableController.h"
#import "REGlobalClass.h"

@interface REMessageTableController () <UITableViewDelegate,UITableViewDataSource>


@end

@implementation REMessageTableController

- (NSMutableArray *)messages{
    if (_messages) {
        _messages = [NSMutableArray new];
    }
    return _messages;
}

- (UITableView *)messageTable{
    if (!_messageTable) {
        _messageTable = [[UITableView alloc] init];
        _messageTable.delegate = self;
        _messageTable.dataSource = self;
    }
    return _messageTable;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"聊天"];
    
    [self.view addSubview:self.messageTable];
    [self.messageTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.messages count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableViewCellId = @"";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
