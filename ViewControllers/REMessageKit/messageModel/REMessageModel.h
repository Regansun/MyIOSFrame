//
//  REMessageModel.h
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "REMessage.h"

@interface REMessageModel : NSObject <REMessage,NSCoding,NSCopying>

@property (nonatomic, copy) NSString *avatorUrl;         //头像url
@property (nonatomic, strong) UIImage *avatorImage;       //头像图片

@property (nonatomic, copy) NSString *text;            //文本内容

@property (nonatomic, strong) UIImage *photo;          //图片
@property (nonatomic, copy) NSString *photoName;        //图片名称
@property (nonatomic, copy) NSString *photoPath;         //图片路劲

@property (nonatomic, copy) NSString *voiceName;         //语音名称
@property (nonatomic, copy) NSString *voicePath;          //语音路劲
@property (nonatomic, copy) NSString *voiceDuration;        //语音时长

@property (nonatomic, copy) NSString *emotionName;        //表情图片名称
@property (nonatomic, copy) NSString *emotionPath;         //表情图片路径

@property (nonatomic, strong) UIImage *videoPhoto;         //视频封面图片
@property (nonatomic, copy) NSString *videoName;          //视频名称
@property (nonatomic, copy) NSString *videoPath;           //视频路径

@property (nonatomic, strong) UIImage *localPhoto;          //定位图片
@property (nonatomic, copy) NSString *geolocations;          //定位信息
@property (nonatomic, strong) CLLocation *location;          //定位经纬度

@property (nonatomic, assign) REMessageType messageType;
@property (nonatomic, assign) REMessageContentType messageContentType;

@property (nonatomic, strong) NSDate *timestamp;           //消息发送或则接受时间
@property (nonatomic, copy) NSString *messageId;           //消息id
@property (nonatomic, copy) NSString *receiver;             //对方的信息


/**
 *  初始化文本消息
 *
 *  @param text   发送的目标文本
 *  @param receiver 聊天的对方
 *  @param timestamp   时间
 *
 *  @return 返回Message model 对象
 */
- (instancetype)initWithText:(NSString *)text receiver:(NSString *)receiver timestamp:(NSDate *)timestamp;

/**
 *  初始化表情图片消息
 *
 *  @param emotionName 表情名称
 *  @param emotionPath 表情路径
 *  @param receiver    聊天的对方
 *  @param timestamp   时间
 *
 *  @return 返回Message model 对象
 */
- (instancetype)initWithEmotionName:(NSString *)emotionName emotionPath:(NSString *)emotionPath receiver:(NSString *)receiver timestamp:(NSDate *)timestamp;

/**
 *  初始化图片类型的消息
 *
 *  @param photo   目标图片
 *  @param photoName   目标图片名称
 *  @param photoPath   目标图片路径
 *  @param receiver      聊天的对方
 *  @param timestamp     时间
 *
 *  @return 返回Message model 对象
 */
- (instancetype)initWithPhoto:(UIImage *)photo photoName:(NSString *)photoName photoPath:(NSString *)photoPath receiver:(NSString *)receiver timestamp:(NSDate *)timestamp;

/**
 *  初始化视频类型的消息
 *
 *  @param videoPhoto 视频封面图
 *  @param videoName  视频名称
 *  @param videoPath  视频路劲
 *  @param receiver   聊天的对方
 *  @param timestamp  时间
 *
 *  @return 返回Message model 对象
 */
- (instancetype)initWithVideoPhoto:(UIImage *)videoPhoto videoName:(NSString *)videoName videoPath:(NSString *)videoPath receiver:(NSString *)receiver timestamp:(NSDate *)timestamp;

/**
 *  初始化语音类型的消息
 *
 *  @param VoiceName     语音名称
 *  @param voicePath     语音路径
 *  @param voiceDuration 语音时间
 *  @param receiver      聊天的对方
 *  @param timestamp     时间
 *
 *  @return 返回Message model 对象
 */
- (instancetype)initWithVoiceName:(NSString *)voiceName voicePath:(NSString *)voicePath voiceDuration:(NSString *)voiceDuration receiver:(NSString *)receiver timestamp:(NSDate *)timestamp;

/**
 *  初始化地理位置的消息
 *
 *  @param localPhoto   地理位置默认显示的图
 *  @param geolocations 地理位置的信息
 *  @param location     地理位置的经纬度
 *  @param receiver       聊天的对方
 *  @param timestamp    时间
 *
 *  @return 返回Message model 对象
 */
- (instancetype)initWithLocalPhoto:(UIImage *)localPhoto geolocations:(NSString *)geolocations location:(CLLocation *)location receiver:(NSString *)receiver timestamp:(NSDate *)timestamp;


@end
