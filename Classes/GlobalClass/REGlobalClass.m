//
//  REGlobalClass.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "REGlobalClass.h"

@implementation REGlobalClass

/**
 *  Description 判断是否能链接到网络
 *
 *  @return YES or NO
 */
+ (BOOL)connectedToNetwork{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

/**
 *检测网络状态变化
 */
+ (void)netWorkChanged{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"No Internet Connection");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"4G/3G/2G");
                break;
            default:
                NSLog(@"Unkown network status");
                break;
        }
    }];
}

/**
 *  获取app版本号
 *
 *  @return
 */
+ (NSString *)appVersion{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *app_version = [info objectForKey:@"CFBundleShortVersionString"];
    return app_version;
}

/**
 *  获取app名字
 *
 *  @return
 */
+ (NSString *)ApplicationName{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}

@end
