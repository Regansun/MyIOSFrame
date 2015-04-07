//
//  REMessageBubbleView.m
//  MyIOSFrame
//
//  Created by Regan on 15/4/3.
//  Copyright (c) 2015年 Regan. All rights reserved.
//

#import "REMessageBubbleView.h"

@implementation REMessageBubbleView

- (instancetype)initWithMessage:(id<REMessage>)message{
    self = [super init];
    if (self) {
        self.message = message;
        UIImageView *bubbleImage = [[UIImageView alloc] init];
        [self addSubview:bubbleImage];
        self.bubbleImage = bubbleImage;
        
        RELable *textLable = [[RELable alloc] init];
        //[textLable setBackgroundColor:[UIColor redColor]];
        textLable.numberOfLines = 0;
        //[textLable setVerticalAlignment:VerticalAlignmentTop];
        [textLable setFont:FONT(16)];
        [self.bubbleImage addSubview:textLable];
        self.textLable = textLable;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws)
    [self.bubbleImage setImage:[REMessageHelper bubbleImageViewForType:[self.message messageType]]];
    [self.bubbleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsZero);
    }];
    CGSize size = [REMessageBubbleView bubbleSizeWithMessage:self.message];
    switch ([self.message messageContentType]) {
        case REMessageContentTypeText:{
            [self.textLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.bubbleImage).with.offset(18);
                make.left.mas_equalTo(ws.bubbleImage.mas_left).with.offset([ws.message messageType]?25:20);
                make.right.mas_equalTo(ws.bubbleImage.mas_right).with.offset([ws.message messageType]?-20:-25);
                make.height.mas_equalTo(size.height);
            }];
        }
            break;
        case REMessageContentTypeEmotion:
            
            break;
        case REMessageContentTypePhoto:
            
            break;
        case REMessageContentTypeVoice:
            
            break;
        case REMessageContentTypeVideo:
            
            break;
        case REMessageContentTypeLocaltion:
            
            break;
            
        default:
            break;
    }
}

- (void)configureCellWithMessage:(id <REMessage>)message{
    switch ([message messageContentType]) {
        case REMessageContentTypeText:{
//            NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[message text]];
//            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//            //style.headIndent = 30;//缩进
//            style.firstLineHeadIndent = 0;
//            style.lineSpacing = 5;//行距
//            [text addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
            self.textLable.text = [message text];
        }
            
            break;
        case REMessageContentTypeEmotion:
            
            break;
        case REMessageContentTypePhoto:
            
            break;
        case REMessageContentTypeVoice:
            
            break;
        case REMessageContentTypeVideo:
            
            break;
        case REMessageContentTypeLocaltion:
            
            break;
            
        default:
            break;
    }
}

+ (CGSize)calculateCellHeightWithMessage:(id <REMessage>)message{
    CGSize bubbleSize = CGSizeMake(MaxBubbleWidth, MinBubbleHeight);
    switch ([message messageContentType]) {
        case REMessageContentTypeText:{
            CGSize size = [REMessageBubbleView bubbleSizeWithMessage:message];
            bubbleSize = CGSizeMake(size.width+45, size.height+36);
        }
            break;
        case REMessageContentTypeEmotion:
            
            break;
        case REMessageContentTypePhoto:
            
            break;
        case REMessageContentTypeVoice:
            
            break;
        case REMessageContentTypeVideo:
            
            break;
        case REMessageContentTypeLocaltion:
            
            break;
            
        default:
            break;
    }
    return CGSizeMake(bubbleSize.width>MaxBubbleWidth ? MaxBubbleWidth:bubbleSize.width, bubbleSize.height<MinBubbleHeight ? MinBubbleHeight:bubbleSize.height);
}

+ (CGSize)bubbleSizeWithMessage:(id<REMessage>)message{
    CGSize size;
    switch ([message messageContentType]) {
        case REMessageContentTypeText:{
//            NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[message text]];
//            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//            //style.headIndent = 30;//缩进
//            style.firstLineHeadIndent = 0;
//            style.lineSpacing = 5;//行距
//            [text addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
            size = [[message text] boundingRectWithSize:CGSizeMake(MaxBubbleWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: FONT(16)} context:nil].size;
            NSLog(@"文字控件大小---%f ---- %f",size.width,size.height);
        }
            break;
        case REMessageContentTypeEmotion:
            
            break;
        case REMessageContentTypePhoto:
            
            break;
        case REMessageContentTypeVoice:
            
            break;
        case REMessageContentTypeVideo:
            
            break;
        case REMessageContentTypeLocaltion:
            
            break;
            
        default:
            break;
    }
    return size;
}



@end
