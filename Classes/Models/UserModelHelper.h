//
//  UserModelHelper.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserModelHelper <NSObject>

@required
- (NSString *)user_id;

- (NSString *)user_name;

- (NSInteger)user_age;

@end
