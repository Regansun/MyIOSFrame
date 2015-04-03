//
//  REMessageTableViewCell.h
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "BaseMessageCell.h"
#import "REMessage.h"
#import "REMessageBubbleView.h"

@interface REMessageTableViewCell : BaseMessageCell

@property (weak, nonatomic) UIImageView *avatorImage;  //头像

@property (weak, nonatomic) UILabel *timesLable;      //时间轴

@property (nonatomic, assign) BOOL displayTimestamp; //是否显示时间轴

@property (nonatomic, strong) REMessageBubbleView *bubbleView;  //消息内容视图

@property (nonatomic, strong) id<REMessage> message; //消息对象

@property (strong, nonatomic) NSIndexPath *indexPath; //Cell所在的位置

@property (assign, nonatomic) REMessageType messageType;   //是接受还是发送

/**
 *  初始化Cell的方法，必须先调用这个，不然不会初始化显示控件
 *
 *  @param message     需显示的目标消息Model
 *  @param displayTimestamp 预先告知是否需要显示时间轴Label
 *  @param cellIdentifier   重用Cell的标识
 *
 *  @return 返回消息Cell对象
 */
- (instancetype)initWithMessage:(id<REMessage>)message
              displaysTimestamp:(BOOL)displayTimestamp
                reuseIdentifier:(NSString *)cellIdentifier;

/**
 *  根据消息Model配置Cell的显示内容
 *
 *  @param message          目标消息Model
 *  @param displayTimestamp 配置的时候告知是否需要显示时间轴Label
 */
- (void)configureCellWithMessage:(id <REMessage>)message displaysTimestamp:(BOOL)displayTimestamp;

/**
 *  根据消息Model计算Cell的高度
 *
 *  @param message      目标消息Model
 *  @param displayTimestamp 是否显示时间轴Label
 *
 *  @return 返回Cell所需要的高度
 */
+ (CGFloat)calculateCellHeightWithMessage:(id <REMessage>)message displaysTimestamp:(BOOL)displayTimestamp;

@end
