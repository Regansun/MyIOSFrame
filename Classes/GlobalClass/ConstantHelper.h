//
//  ConstantHelper.h
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#ifndef MyIOSFrame_ConstantHelper_h
#define MyIOSFrame_ConstantHelper_h


//-------------------设备-------------------------
#define BatteryHeight 20.0
#define NavBarHeight  44.0
#define TabBarHeight  49.0
#define KMainScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define KMainScreenHeight ([UIScreen mainScreen].bounds.size.height)



//----------------------系统----------------------------
//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define kNav ((AppDelegate *)[UIApplication sharedApplication].delegate.navigationController)

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
//背景色
#define BACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]
#define CLEARCOLOR [UIColor clearColor]

//----------------------其他----------------------------
//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
//方正黑体简体字体定义
#define FONT(F) [UIFont fontWithName:@"FZHTJW--GB1" size:F]
//获取图片
#define LoginImage(name) [UIImage imageNamed:name]
//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
//输出frame(frame是结构体，没法%@)
#define LOGFRAME(f) NSLog(@"\nx:%f\ny:%f\nwidth:%f\nheight:%f\n",f.origin.x,f.origin.y,f.size.width,f.size.height)
//数据转换
#define ITOS(number) [NSString stringWithFormat:@"%d",number]
#define FTOS(number) [NSString stringWithFormat:@"%f",number]
#define DATE(stamp) [NSDate dateWithTimeIntervalSince1970:[stamp intValue]];
//GCD
#define GCD_BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCD_MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
//block self
#define WEAKSELF  __weak typeof (self)weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//----------------------沙盒路劲----------------------------
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#endif

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#else
#define DLog(...)


#endif
