//
//  WZBezierPath.m
//  WZBezierPath
//
//  Created by 黄燕 on 16/5/27.
//  Copyright © 2016年 Mr.Wang. All rights reserved.
//

#import "WZBezierPath.h"

@interface WZBezierPath () {
}
@property(copy, nonatomic) void (^didStop)();
@end

@implementation WZBezierPath
- (void)moveToPoint:(CGPoint)point
addQuadCurveToPoint:(CGPoint)endPoint
       controlPoint:(CGPoint)controlPoint
            didStop:(void (^)())didStop {
  _didStop = didStop;
  UIBezierPath *path = [UIBezierPath bezierPath];
  [path moveToPoint:point];

  /**
   *  画二元曲线，一般和moveToPoint配合使用
   *
   *  @param endPoint     曲线的终点 - 购物车按钮的坐标
   *  @param controlPoint 画曲线的控制点
   */
  [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
  [self groupAnimation:path];
}
- (void)groupAnimation:(UIBezierPath *)path {
  CAKeyframeAnimation *animation =
      [CAKeyframeAnimation animationWithKeyPath:@"position"];
  animation.path = path.CGPath;
  animation.rotationMode = kCAAnimationRotateAuto;

  //放大
  CABasicAnimation *expandAnimation =
      [CABasicAnimation animationWithKeyPath:@"transform.scale"];
  expandAnimation.duration = 0.5f;
  expandAnimation.fromValue = [NSNumber numberWithFloat:1];
  expandAnimation.toValue = [NSNumber numberWithFloat:2.0f];
  expandAnimation.timingFunction =
      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

  //缩小
  CABasicAnimation *narrowAnimation =
      [CABasicAnimation animationWithKeyPath:@"transform.scale"];
  narrowAnimation.beginTime = 0.5;
  narrowAnimation.duration = 1.5f;
  narrowAnimation.fromValue = [NSNumber numberWithFloat:2.0f];
  narrowAnimation.toValue = [NSNumber numberWithFloat:0.5f];
  narrowAnimation.timingFunction =
      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

  CAAnimationGroup *groups = [CAAnimationGroup animation];
  groups.animations = @[ animation, expandAnimation, narrowAnimation ];
  groups.duration = 1.0f;
  groups.removedOnCompletion = NO;
  groups.fillMode = kCAFillModeForwards;
  groups.delegate = self;
  [self.layer addAnimation:groups forKey:@"group"];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
  [self.layer removeAnimationForKey:@"group"];
  if (_didStop) {
    _didStop();
  }
}
@end
