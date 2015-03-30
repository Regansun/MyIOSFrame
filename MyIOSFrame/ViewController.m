//
//  ViewController.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/24.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "ViewController.h"
#import "REGlobalClass.h"
#import "RENetWorkHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    NSMutableDictionary *param = [NSMutableDictionary new];
    //[param setObject:@"C5VlkhOQLN0T6wUrSq2CRG4c" forKey:@"ak"];
    [param setObject:@"1" forKey:@"page"];
    [param setObject:@"" forKey:@"type"];
//    [[RENetWorkHelper sharedNetWork] postPath:@"http://jxt.51jxt.net:8080/TeacherMainService.asmx?op=SchoolBulletinListnew" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//    }];
//
    
    NSURL *baseURL = [NSURL URLWithString:@"http://jxt.51jxt.net:8080/TeacherMainService.asmx?op=SchoolBulletinListnew"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];
    NSString *soapMessage = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Header><MySoapHeader xmlns=\"http://tempuri.org/\"><Name>%@</Name><Password>%@</Password></MySoapHeader></soap:Header><soap:Body><SchoolBulletinListnew xmlns=\"http://tempuri.org/\"><page>%@</page><type>%@</type></SchoolBulletinListnew></soap:Body></soap:Envelope>" ,@"zlj",@"52D04DC20036DBD8",@"1",@""];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    [request addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    [operation start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
