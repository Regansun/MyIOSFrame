//
//  UITableViewController+pull.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/26.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 待完善  不是很好用
 */

@interface UITableViewController (pull)

@property (nonatomic, strong) NSMutableDictionary *evenDict;

-(void)addHeadViewPull:(void(^)(UITableViewController* tablewVC))pull;

-(void)headerBeginRefreshing;

-(void)headerEndRefreshing;

@end
