//
//  LoginViewController.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/31.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+Category.h"

@interface LoginViewController () <UITextFieldDelegate> {
    UITextField *userName_;
    UITextField *passWord_;
    UILabel *noticeLb_;
}

@end

@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"登 录"];
    
    WS(ws)
    noticeLb_ = [[UILabel alloc] init];
    [noticeLb_ setTextAlignment:NSTextAlignmentRight];
    [noticeLb_ setTextColor:[UIColor redColor]];
    [noticeLb_ setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:noticeLb_];
    [noticeLb_ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.equalTo(@80);
        make.centerX.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(300, 20));
    }];
    
    userName_ = [[UITextField alloc] init];
    [userName_ setPlaceholder:@"输入邮箱"];
    [userName_ setTextAlignment:NSTextAlignmentCenter];
    [userName_ setReturnKeyType:UIReturnKeyDone];
    [userName_ setDelegate:self];
    [self.view addSubview:userName_];
    [userName_ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.equalTo(@105);
        make.size.mas_equalTo(CGSizeMake(320, 44));
    }];
    
    passWord_ = [[UITextField alloc] init];
    [passWord_ setPlaceholder:@"输入密码"];
    [passWord_ setSecureTextEntry:YES];
    [passWord_ setTextAlignment:NSTextAlignmentCenter];
    [passWord_ setReturnKeyType:UIReturnKeyDone];
    [passWord_ setDelegate:self];
    [self.view addSubview:passWord_];
    [passWord_ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userName_).with.equalTo(@45);
        make.size.mas_equalTo(CGSizeMake(320, 44));
    }];
    
    for (int i = 0; i<3; i++) {
        UILabel *lable = [[UILabel alloc] init];
        [lable setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
        [self.view addSubview:lable];
        
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.view).with.equalTo(@(104+45*i));
            make.size.mas_equalTo(CGSizeMake(320, 1));
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == userName_ && ![userName_.text isValidEmail]) {
        [noticeLb_ setText:@"用户名格式错误"];
        [self addAnimation:userName_];
    }else if (textField == passWord_ && ![passWord_.text isEqualToString:@"123"]){
        [noticeLb_ setText:@"用户名密码错误"];
        [self addAnimation:passWord_];
    }
    [textField resignFirstResponder];
    return YES;
}

- (void)addAnimation:(UITextField *)textField{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    animation.additive = YES;
    [textField.layer addAnimation:animation forKey:@"shake"];
}

@end
