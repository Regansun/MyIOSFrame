//
//  REMessageHelper.h
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

#define MaxBubbleWidth [UIScreen mainScreen].bounds.size.width/2.0+45.0  //气泡最大宽度
#define MinBubbleHeight 56.f                       //气泡最小高度

typedef NS_ENUM(NSInteger, REMessageType) {
    /**
     *  发送消息
     */
    REMessageTypeSending = 0,
    /**
     *  接受消息
     */
    REMessageTypeReceiving
};

typedef NS_ENUM(NSInteger, REMessageContentType) {
    REMessageContentTypeText = 0,          //文本
    REMessageContentTypeEmotion = 1,        //表情
    REMessageContentTypePhoto = 2,         //照片
    REMessageContentTypeVoice = 3,         //语音
    REMessageContentTypeVideo = 4,         //视频
    REMessageContentTypeLocaltion = 5,       //地址
};

@interface REMessageHelper : NSObject

/**
 *  消息背景框
 *
 *  @param type 发送还是接受
 *
 *  @return 返回拉伸图片
 */
+ (UIImage *)bubbleImageViewForType:(REMessageType)type;

@end
