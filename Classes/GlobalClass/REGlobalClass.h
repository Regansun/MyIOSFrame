//
//  REGlobalClass.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConstantHelper.h"
#import "REGlobalClass.h"
#import <objc/runtime.h>
#import "AFNetworking.h"
#import "Masonry.h"
#import "UIView+Masonry_ZLJ.h"
#import "MMPlaceHolder.h"


@interface REGlobalClass : NSObject

+ (BOOL)connectedToNetwork;

+ (void)netWorkChanged;

+ (NSString *)appVersion;

+ (NSString *)ApplicationName;


@end
