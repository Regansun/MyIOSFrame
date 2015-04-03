//
//  REMessageTableViewCell.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "REMessageTableViewCell.h"

static const CGFloat kLabelPadding = 5.0f;         //间隔
static const CGFloat kAvatorPaddingX = 8.0;        //头像与其他控件之间的间隔
static const CGFloat kTimeStampLabelHeight = 20.0f;    //时间Lable的高度
static const CGFloat kAvatarImageSize = 40.0f;       //头像大小
//static const CGFloat kAlbumAvatorSpacing = 15.0f;     //

@implementation REMessageTableViewCell

+ (CGFloat)calculateCellHeightWithMessage:(id <REMessage>)message displaysTimestamp:(BOOL)displayTimestamp{
    CGFloat timestampHeight = displayTimestamp ? (kTimeStampLabelHeight + kLabelPadding) : kLabelPadding;
    //CGFloat avatorHeight = kAvatarImageSize;
    CGFloat bubbleHeight = [REMessageBubbleView calculateCellHeightWithMessage:message];
    return timestampHeight+bubbleHeight+kLabelPadding;
}

- (instancetype)initWithMessage:(id<REMessage>)message displaysTimestamp:(BOOL)displayTimestamp reuseIdentifier:(NSString *)cellIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    if (self) {
        self.message = message;
        self.displayTimestamp = displayTimestamp;
        self.messageType = message.messageType;
        //时间轴
        UILabel *timeLable = [[UILabel alloc] init];
        [timeLable setFont:[UIFont systemFontOfSize:12.0]];
        [timeLable setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:timeLable];
        [self.contentView bringSubviewToFront:timeLable];
        self.timesLable = timeLable;
        
        //头像
        UIImageView *avatorImage = [[UIImageView alloc] init];
        [self.contentView addSubview:avatorImage];
        self.avatorImage = avatorImage;
        
        //配置需要显示什么消息内容，比如语音、文字、视频、图片
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws)
    if (self.displayTimestamp) {
        [self.timesLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws).with.mas_equalTo(kLabelPadding);
            make.size.mas_equalTo(CGSizeMake(KMainScreenWidth, kTimeStampLabelHeight));
        }];
    }
    
    if (self.message.messageType == REMessageTypeReceiving) {
        [self.avatorImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws.timesLable).with.offset(kLabelPadding+kTimeStampLabelHeight);
            make.left.equalTo(ws).with.mas_equalTo(kAvatorPaddingX);
            make.size.mas_equalTo(CGSizeMake(kAvatarImageSize, kAvatarImageSize));
        }];
    }else{
        [self.avatorImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws.timesLable).with.offset(kLabelPadding);
            make.right.equalTo(ws).with.mas_equalTo(-kAvatorPaddingX);
            make.size.mas_equalTo(CGSizeMake(kAvatarImageSize, kAvatarImageSize));
        }];
    }
}

- (void)configureCellWithMessage:(id <REMessage>)message displaysTimestamp:(BOOL)displayTimestamp{
    //_messageBubbleView.userModel = self.userModel;
    [self configAvatorWithMessage:message];   //设置头像
    //[self configureTimestamp:displayTimestamp atMessage:message];    //设置时间
    //[self configureMessageBubbleViewWithMessage:message];      //设置内容
}

/**
 *  头像配置
 *
 *  @param message 需要配置的目标消息Model
 */
- (void)configAvatorWithMessage:(id <REMessage>)message {
//    if (message.bubbleMessageType == REBubbleMessageTypeSending) {
//        NSString *headUrl = [NSString stringWithFormat:@"%@%@",kTUserHeaderImage,[(TeacherModel *)[NSString getUserModel] user_avater]];
//        [self.avatorButton sd_setImageWithURL:[NSURL URLWithString:headUrl] placeholderImage:[UIImage imageNamed:kSenderUserImage]];
//    }else {
//        NSString *headUrl = [NSString stringWithFormat:@"%@%@",[NSString getUserHearderImage:[(TeacherModel *)self.userModel user_id]],[(TeacherModel *)self.userModel user_avater]];
//        [self.avatorButton sd_setImageWithURL:[NSURL URLWithString:headUrl] placeholderImage:[UIImage imageNamed:kDefaultUserImage]];
//    }
    [self.avatorImage setImage:[UIImage imageNamed:@"allClassIcon"]];
}

@end
