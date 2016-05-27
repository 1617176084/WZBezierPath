//
//  MoveView.m
//  20160317004-View is move
//
//  Created by Rainer on 16/3/17.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "MoveView.h"

/**
 *  iPhone UIView默认为一个手指触摸
 *  如果需要多点触摸需要开启UIView的multipleTouchEnabled属性
 *  iPhone 一般避免双击或者多点触摸事件
 */
@implementation MoveView

/**
 *  触摸事件开始（手指触摸到屏幕）
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"%s", __func__);
}

/**
 *  触摸移动时调用（手指在屏幕上移动）
 */
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  // 1.获取UITouch对象
  UITouch *touch = [touches anyObject];

  // 2.获取当前手指点的位置
  CGPoint currentPoint = [touch locationInView:self];

  // 3.获取上一个手指点的位置
  CGPoint previouPoint = [touch previousLocationInView:self];

  // 4.算出2次移动的偏移量
  CGFloat offsetX = currentPoint.x - previouPoint.x;
  CGFloat offsetY = currentPoint.y - previouPoint.y;

  // 5.移动UIView视图的位置
  self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
  // CGAffineTransformTranslate(self.transform, offsetX, offsetY);

  NSLog(@"%s", __func__);
}

/**
 *  触摸完成时调用（手指抬起）
 */
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"%s", __func__);
}

/**
 *  触摸取消时调用（有电话接入）
 */
- (void)touchesCancelled:(NSSet<UITouch *> *)touches
               withEvent:(UIEvent *)event {
  NSLog(@"%s", __func__);
}

@end
