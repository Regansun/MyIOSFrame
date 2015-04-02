//
//  REMessageTableViewCell.h
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "BaseMessageCell.h"
#import "REMessageModel.h"

@interface REMessageTableViewCell : BaseMessageCell

@property (strong, nonatomic) UIImageView *avatorImage;  //头像

@property (strong, nonatomic) UILabel *timesLable;      //时间轴

@property (nonatomic, assign) BOOL displayTimestamp; //是否显示时间轴

/**
 *  初始化Cell的方法，必须先调用这个，不然不会初始化显示控件
 *
 *  @param message          需显示的目标消息Model
 *  @param displayTimestamp 预先告知是否需要显示时间轴Label
 *  @param cellIdentifier   重用Cell的标识
 *
 *  @return 返回消息Cell对象
 */
- (instancetype)initWithMessage:(REMessageModel *)message
              displaysTimestamp:(BOOL)displayTimestamp
                reuseIdentifier:(NSString *)cellIdentifier;

@end
