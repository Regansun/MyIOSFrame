//
//  RENetWorkHelper.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "REGlobalClass.h"

@class RENetWorkHelper;

@interface RENetWorkHelper : NSObject

@property (nonatomic, strong) AFHTTPRequestOperationManager *netWorkManager;

+ (RENetWorkHelper *)sharedNetWork;

- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
