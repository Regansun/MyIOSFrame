//
//  REMessage.h
//  MyIOSFrame
//
//  Created by Regan on 15/4/3.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "REMessageHelper.h"
#import <CoreLocation/CoreLocation.h>

@protocol REMessage <NSObject>

@required
- (NSString *)avatorUrl;         //头像url
- (UIImage *)avatorImage;       //头像图片

- (NSString *)text;

- (UIImage *)photo;          //图片
- (NSString *)photoName;        //图片名称
- (NSString *)photoPath;         //图片路劲

- (NSString *)voiceName;         //语音名称
- (NSString *)voicePath;          //语音路劲
- (NSString *)voiceDuration;        //语音时长

- (NSString *)emotionName;        //表情图片名称
- (NSString *)emotionPath;         //表情图片路径

- (UIImage *)videoPhoto;         //视频封面图片
- (NSString *)videoName;          //视频名称
- (NSString *)videoPath;           //视频路径

- (UIImage *)localPhoto;          //定位图片
- (NSString *)geolocations;          //定位信息
- (CLLocation *)location;          //定位经纬度

- (REMessageType)messageType;
- (REMessageContentType)messageContentType;

@optional
- (NSDate *)timestamp;           //消息发送或则接受时间
- (NSString *)messageId;           //消息id
- (NSString *)receiver;             //对方的信息

@end
