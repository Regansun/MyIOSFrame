/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

/**
 *  移动
 *
 *  @param delta
 */
- (void) moveBy: (CGPoint) delta;

/**
 *  等比放大缩小
 *
 *  @param scaleFactor 比例
 */
- (void) scaleBy: (CGFloat) scaleFactor;

/**
 *  随意缩小
 *
 *  @param aSize
 */
- (void) fitInSize: (CGSize) aSize;
@end