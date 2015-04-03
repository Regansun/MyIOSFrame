//
//  REMessageTableViewController.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "REMessageTableController.h"
#import "REMessageTableViewCell.h"
#import "REGlobalClass.h"
#import "REMessageModel.h"

static NSString *const MessageTableViewCellIdentifier = @"MessageTableViewCellIdentifier";

@interface REMessageTableController () <UITableViewDelegate,UITableViewDataSource>


@end

@implementation REMessageTableController

- (NSMutableArray *)messages{
    if (!_messages) {
        _messages = [NSMutableArray new];
        REMessageModel *textModel1 = [[REMessageModel alloc] initWithText:@"测试数据" receiver:@"123" timestamp:[NSDate date]];
        textModel1.messageType = REMessageTypeReceiving;
        REMessageModel *textModel2 = [[REMessageModel alloc] initWithText:@"回复测试数据" receiver:@"123" timestamp:[NSDate date]];
        textModel2.messageType = REMessageTypeSending;
        
        [_messages addObject:textModel1];
        [_messages addObject:textModel2];
    }
    return _messages;
}

- (UITableView *)messageTable{
    if (!_messageTable) {
        _messageTable = [[UITableView alloc] init];
        [_messageTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        //[_messageTable registerClass:[REMessageTableViewCell class] forCellReuseIdentifier:MessageTableViewCellIdentifier];
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
- (id<REMessage>)messageForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.messages objectAtIndex:indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.messages count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id <REMessage> message = [self messageForRowAtIndexPath:indexPath];
    return [self calculateCellHeightWithMessage:message atIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id <REMessage> message = [self messageForRowAtIndexPath:indexPath];
    BOOL displayTimestamp = YES;
    REMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MessageTableViewCellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!cell) {
        cell = [[REMessageTableViewCell alloc] initWithMessage:message displaysTimestamp:displayTimestamp reuseIdentifier:MessageTableViewCellIdentifier];
        [cell setBackgroundColor:tableView.backgroundColor];
        //messageTableViewCell.delegate = self;
    }
    [cell configureCellWithMessage:message displaysTimestamp:displayTimestamp];
    
    return cell;
}

#pragma mark - Message Calculate Cell Height  计算cell的高度
- (CGFloat)calculateCellHeightWithMessage:(id <REMessage>)message atIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = 0;
    BOOL displayTimestamp = YES;
//    if ([self.delegate respondsToSelector:@selector(shouldDisplayTimestampForRowAtIndexPath:)]) {
//        displayTimestamp = [self.delegate shouldDisplayTimestampForRowAtIndexPath:indexPath];
//    }
    
    cellHeight = [REMessageTableViewCell calculateCellHeightWithMessage:message displaysTimestamp:displayTimestamp];
    return cellHeight;
}

@end
