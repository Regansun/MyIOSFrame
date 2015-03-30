
//  RENetWorkHelper.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "RENetWorkHelper.h"

@implementation RENetWorkHelper

+ (RENetWorkHelper *)sharedNetWork{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (id)init{
    if (self = [super init]) {
        _netWorkManager = [AFHTTPRequestOperationManager manager];
        _netWorkManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        //_netWorkManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _netWorkManager.responseSerializer = [AFXMLParserResponseSerializer serializer];
        [_netWorkManager.requestSerializer setValue:@"zlj" forHTTPHeaderField:@"Name"];
        [_netWorkManager.requestSerializer setValue:@"52D04DC20036DBD8" forHTTPHeaderField:@"Password"];
    }
    return self;
}

- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [_netWorkManager GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

//NSURL *baseURL = [NSURL URLWithString:@"http://example.com/"];
//AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
//
//NSOperationQueue *operationQueue = manager.operationQueue;
//[manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//    switch (status) {
//        case AFNetworkReachabilityStatusReachableViaWWAN:
//        case AFNetworkReachabilityStatusReachableViaWiFi:
//            [operationQueue setSuspended:NO];
//            break;
//        case AFNetworkReachabilityStatusNotReachable:
//        default:
//            [operationQueue setSuspended:YES];
//            break;
//    }
//}];

@end
