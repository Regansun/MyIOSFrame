//
//  UserModel.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModelHelper.h"

@interface UserModel : NSObject <UserModelHelper>

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, assign) NSInteger user_age;

@end
