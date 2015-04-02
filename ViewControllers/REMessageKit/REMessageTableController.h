//
//  REMessageTableViewController.h
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "BaseViewController.h"

@interface REMessageTableController : BaseViewController

@property (strong, nonatomic) UITableView *messageTable;

@property (strong, nonatomic) NSMutableArray *messages;

@end
