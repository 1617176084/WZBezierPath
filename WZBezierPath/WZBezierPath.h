//
//  WZBezierPath.h
//  WZBezierPath
//
//  Created by 黄燕 on 16/5/27.
//  Copyright © 2016年 Mr.Wang. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WZBezierPath : UIView
- (void)moveToPoint:(CGPoint)point
addQuadCurveToPoint:(CGPoint)endPoint
       controlPoint:(CGPoint)controlPoint
            didStop:(void (^)())didStop;

@end
