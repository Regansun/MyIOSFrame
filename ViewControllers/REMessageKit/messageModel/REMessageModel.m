//
//  REMessageModel.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/2.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "REMessageModel.h"
#import <objc/runtime.h>

@implementation REMessageModel

- (instancetype)initWithText:(NSString *)text receiver:(NSString *)receiver timestamp:(NSDate *)timestamp{
    self = [super init];
    if (self) {
        self.text = text;
        self.receiver = receiver;
        self.timestamp = timestamp;
        self.messageContentType = REMessageContentTypeText;
    }
    return self;
}

- (instancetype)initWithEmotionName:(NSString *)emotionName emotionPath:(NSString *)emotionPath receiver:(NSString *)receiver timestamp:(NSDate *)timestamp{
    self = [super init];
    if (self) {
        self.emotionName = emotionName;
        self.emotionPath = emotionPath;
        self.receiver = receiver;
        self.timestamp = timestamp;
        self.messageContentType = REMessageContentTypeEmotion;
    }
    return self;
}

- (instancetype)initWithPhoto:(UIImage *)photo photoName:(NSString *)photoName photoPath:(NSString *)photoPath receiver:(NSString *)receiver timestamp:(NSDate *)timestamp{
    self = [super init];
    if (self) {
        self.photo  = photo;
        self.photoName = photoName;
        self.photoPath = photoPath;
        self.receiver = receiver;
        self.timestamp = timestamp;
        self.messageContentType = REMessageContentTypePhoto;
    }
    return self;
}

- (instancetype)initWithVoiceName:(NSString *)voiceName voicePath:(NSString *)voicePath voiceDuration:(NSString *)voiceDuration receiver:(NSString *)receiver timestamp:(NSDate *)timestamp{
    self = [super init];
    if (self) {
        self.voiceName = voiceName;
        self.voicePath = voicePath;
        self.voiceDuration = voiceDuration;
        self.receiver = receiver;
        self.timestamp = timestamp;
        self.messageContentType = REMessageContentTypeVoice;
    }
    return self;
}

- (instancetype)initWithVideoPhoto:(UIImage *)videoPhoto videoName:(NSString *)videoName videoPath:(NSString *)videoPath receiver:(NSString *)receiver timestamp:(NSDate *)timestamp{
    self = [super init];
    if (self) {
        self.videoPhoto = videoPhoto;
        self.videoName = videoName;
        self.videoPath = videoPath;
        self.receiver = receiver;
        self.timestamp = timestamp;
        self.messageContentType = REMessageContentTypeVideo;
    }
    return self;
}

- (instancetype)initWithLocalPhoto:(UIImage *)localPhoto geolocations:(NSString *)geolocations location:(CLLocation *)location receiver:(NSString *)receiver timestamp:(NSDate *)timestamp{
    self = [super init];
    if (self) {
        self.localPhoto = localPhoto;
        self.geolocations = geolocations;
        self.location = location;
        self.receiver = receiver;
        self.timestamp = timestamp;
        self.messageContentType = REMessageContentTypeLocaltion;
    }
    return self;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([REMessageModel class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([REMessageModel class], &count);
        for (int i = 0; i<count; i++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            // 设置到成员变量身上
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    switch (self.messageContentType) {
        case REMessageContentTypeText:
            return [[[self class] allocWithZone:zone] initWithText:[self.text copy] receiver:[self.receiver copy] timestamp:[self.timestamp copy]];
            
        case REMessageContentTypeEmotion:
            return [[[self class] allocWithZone:zone] initWithEmotionName:[self.emotionName copy] emotionPath:[self.emotionPath copy] receiver:[self.receiver copy] timestamp:[self.timestamp copy]];
        
        case REMessageContentTypePhoto:
            return [[[self class] allocWithZone:zone] initWithPhoto:[self.photo copy] photoName:[self.photoName copy] photoPath:[self.photoPath copy] receiver:[self.receiver copy] timestamp:[self.timestamp copy]];
            
        case REMessageContentTypeVoice:
            return [[[self class] allocWithZone:zone] initWithVoiceName:[self.voiceName copy] voicePath:[self.voicePath copy] voiceDuration:[self.voiceDuration copy] receiver:[self.receiver copy] timestamp:[self.timestamp copy]];
            
        case REMessageContentTypeVideo:
            return [[[self class] allocWithZone:zone] initWithVideoPhoto:[self.videoPhoto copy] videoName:[self.videoName copy] videoPath:[self.videoPath copy] receiver:[self.receiver copy] timestamp:[self.timestamp copy]];
            
        case REMessageContentTypeLocaltion:
            return [[[self class] allocWithZone:zone] initWithLocalPhoto:[self.localPhoto copy] geolocations:[self.geolocations copy] location:[self.location copy] receiver:[self.receiver copy] timestamp:[self.timestamp copy]];
            
        default:
            return nil;
    }
}

@end
