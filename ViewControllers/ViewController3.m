//
//  ViewController3.m
//  MyIOSFrame
//
//  Created by Regan on 15/3/25.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "ViewController3.h"
#import "REMessageHelper.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    
    UIImageView *imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 84, 150, 100)];
    [imageview1 setImage:[REMessageHelper bubbleImageViewForType:REMessageTypeReceiving]];
    [self.view addSubview:imageview1];
    
    UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake(KMainScreenWidth-160, 204, 150, 60)];
    [imageview2 setImage:[REMessageHelper bubbleImageViewForType:REMessageTypeSending]];
    [self.view addSubview:imageview2];
}

@end
