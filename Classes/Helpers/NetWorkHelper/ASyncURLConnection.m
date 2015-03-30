//
//  ASyncURLConnection.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/30.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "ASyncURLConnection.h"

@implementation ASyncURLConnection

+ (id)request:(NSString *)requestUrl completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock{
    return [[self alloc] initWithRequest:requestUrl completeBlock:completeBlock errorBlock:errorBlock];
}

- (id)initWithRequest:(NSString *)requestUrl completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock{
    NSURL *url = [NSURL URLWithString:requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    if (self = [super initWithRequest:request delegate:self startImmediately:NO]) {
        data_ = [NSMutableData new];
        completeBlock_ = [completeBlock copy];
        errorBlock_ = [errorBlock copy];
        
        [self start];
    }
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [data_ setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [data_ appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if (completeBlock_) {
        completeBlock_(data_);
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    if (errorBlock_) {
        errorBlock_(error);
    }
}

@end
